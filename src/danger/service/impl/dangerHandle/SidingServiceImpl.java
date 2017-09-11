package danger.service.impl.dangerHandle;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import danger.bean.dangerHandle.Delay;
import danger.bean.dangerHandle.DelayExample;
import danger.bean.dangerHandle.Follow;
import danger.bean.dangerHandle.FollowExample;
import danger.bean.dangerHandle.Sidingbiao;
import danger.bean.dangerHandle.SidingbiaoExample;
import danger.bean.dangerManage.Danger;
import danger.mapper.dangerHandle.DelayMapper;
import danger.mapper.dangerHandle.FollowMapper;
import danger.mapper.dangerHandle.SidingbiaoMapper;
import danger.mapper.dangerManage.DangerMapper;
import danger.service.dangerHandle.FollowService;
import danger.service.dangerHandle.SidingService;


/**   
*    
* 项目名称：danger   
* 类名称：SidingServiceImpl   
* 类描述：   隐患四定service的实现类
* 创建人：Leilong
* 修改人：       
* 修改备注：   
* @version    
*    
*/
@Transactional
@Service
public class SidingServiceImpl implements SidingService {
	
	@Resource
	private SidingbiaoMapper siDingBiaoMapper;
	@Resource
	private DangerMapper dangerMapper;
	@Resource
	private DelayMapper delayMapper;
	@Resource
	private FollowMapper followMapper;
	@Resource
	private FollowService followService;
	
	/**
	 * 增加四定记录。
	 * 首先判断当前隐患信息是否大于四定上限
	 * 1.增加四定记录2.修改隐患状态为已四定,设置隐患状态编号
	 * 3.往延迟表中增加一条记录，将第一次的延期时间设置为四定的整改时间
	 * @param siding
	 * @return
	 * @throws Exception
	 */
	public boolean addSiding(Sidingbiao siding) throws Exception {
		
		Boolean isAdd = true;
		//根据四定编号将要四定的隐患信息查询出来
		Danger dangerInfo = dangerMapper.selectByPrimaryKey(siding.getDangerid());
		String strNum = dangerInfo.getDangerstatusnum();
		Integer num = Integer.valueOf(strNum);
		//首先判断当前四定的隐患信息是否已达四定上限
		//若未超过四定上限，执行正常的业务操作
		if(num<19){
			int isInsert = siDingBiaoMapper.insert(siding);
			
			//判断插入四定信息是否正确
			if(isInsert>0){
				
				Delay delay = new Delay();
				
				//查询四定的编号，条件查询的方式按四定时间和隐患编号查询
				SidingbiaoExample sidingbiaoExample = new SidingbiaoExample();
				//通过criteria构造查询条件
				SidingbiaoExample.Criteria criteria = sidingbiaoExample.createCriteria();
				criteria.andSidingtimeEqualTo(siding.getSidingtime());
				criteria.andDangeridEqualTo(siding.getDangerid());
				//得到根据四定时间以及隐患编号得到刚才插入的四定信息，获取到它的id
				List<Sidingbiao> siDingInfo = siDingBiaoMapper.selectByExample(sidingbiaoExample);
				int siDingId = 0;
				for (Sidingbiao sidingbiao : siDingInfo) {
					siDingId = sidingbiao.getSidingid();
				}
				
				delay.setSidingid(siDingId);
				delay.setDelayseq(0);
				//设置延期时间为四定的整改时间
				delay.setDelaytime(siding.getRectificationtime());
				int isDelay = delayMapper.insertSelective(delay);
				
				//判断增加延迟表记录是否成功
				if(isDelay>0){					
					
					//判断是否是第一次四定
					if(num<1){
						num = 10;
						dangerInfo.setDangerstatusnum(num.toString());
						//修改隐患状态为已四定
						dangerInfo.setDangerstatus("已四定");
						int isSiding = dangerMapper.updateByPrimaryKey(dangerInfo);
						if(isSiding<1){
							isAdd = false;
						}
					}else{
						//判断是否大于四定上限，若在可四定的范围内，添加四定消息
						num += 1;
						dangerInfo.setDangerstatusnum(num.toString());
						int isSiding = dangerMapper.updateByPrimaryKey(dangerInfo);
						if(isSiding<1){
							isAdd = false;
						}
					}
				}else{
					isAdd = false;
				}
				
			}else{
				isAdd = false;
			}
		}else{
			isAdd = false;
		}
		
		return isAdd;
	}

	/**
	 * 通过四定id删除相关信息(级联删除)
	 * 
	 * 将四定信息删除后，隐患表中的隐患信息的隐患状态改为未四定，隐患状态编号设为为初始值
	 * 四定延期表中的相关信息全部删除
	 * 隐患跟踪表中的相关信息全部删除
	 * 复查表中的相关信息全部删除
	 * 调用隐患跟踪FollowService的deleteFollowById()方法
	 * @param id	四定编号
	 *            
	 * @return
	 * @throws Exception
	 */
	public boolean deleteSidingById(Integer id) throws Exception {
		
		boolean isDelete = true;
		
		//先将要删除的四定信息查询出来
		Sidingbiao sidingInfo = siDingBiaoMapper.selectByPrimaryKey(id);
		
		//查询当前四定信息是否有关联的隐患跟踪信息
		//调用SidingService中的getFollowBySidingId()方法查询跟踪信息
		Follow followInfo = getFollowBySidingId(id);
		//判断跟踪信息是否为空
		if(followInfo!=null){
			boolean isDeleteFollow = followService.deleteFollowById(id);
			//判断是否删除成功
			if(!isDeleteFollow){
				return false;
			}			
		}
		
		//查询四定延期表是否有相关四定的信息
		DelayExample delayExample = new DelayExample();
		DelayExample.Criteria criteria = delayExample.createCriteria();
		criteria.andSidingidEqualTo(id);
		List<Delay> delayInfo = delayMapper.selectByExample(delayExample);
		//判断查询的四定延期信息是否为空
		if(delayInfo.size()>0){
			int isDeleteDelay = delayMapper.deleteByExample(delayExample);
			//判断是否删除成功
			if(isDeleteDelay<1){
				return false;
			}
		}
		
		//删除四定表中的信息
		int isDeleteSiding = siDingBiaoMapper.deleteByPrimaryKey(id);
		//判断四定信息是否删除成功
		if(isDeleteSiding>0){
			//查询隐患信息
			Danger dangerInfo = dangerMapper.selectByPrimaryKey(sidingInfo.getDangerid());
			String strNum = dangerInfo.getDangerstatusnum();
			Integer num = Integer.valueOf(strNum);
			//将隐患状态编号-1，判断结果值
			num -= 1;
			if(num<10){
				//将其设置为初始状态
				dangerInfo.setDangerstatus("未四定");
				dangerInfo.setDangerstatusnum("00");
				int isDanger = dangerMapper.updateByPrimaryKey(dangerInfo);
				//判断是否设置成功
				if(isDanger<1){
					isDelete = false;
				}
			}else{	
				//设置隐患状态编号
				dangerInfo.setDangerstatusnum(num.toString());
				int isDanger = dangerMapper.updateByPrimaryKey(dangerInfo);
				//判断是否设置成功
				if(isDanger<1){
					isDelete = false;
				}
			}
			
		}else{
			isDelete = false;
		}
		
	return isDelete;
	}

	/**
	 * 修改四定相关信息
	 * 前台封装包含隐患编号在内的所有四定相关信息
	 * @param siding
	 * @return
	 * @throws Exception
	 */
	public boolean updateSiding(Sidingbiao siding) throws Exception {
		
		int isUpdate = siDingBiaoMapper.updateByPrimaryKey(siding);
		
		return isUpdate>0 ? true : false;
	}

	/**
	 * 根据id查询四定以及隐患信息
	 * 
	 * @param id	 隐患编号
	 *           
	 * @return 第一个是隐患基本信息，第二个是四定集合
	 * @throws Exception
	 */
	public Map<String, Object> getSidingById(Integer dangerId) throws Exception {
		
		Danger dangerInfo = dangerMapper.selectByPrimaryKey(dangerId);
		SidingbiaoExample siDingBiaoExample = new SidingbiaoExample();
		SidingbiaoExample.Criteria criteria = siDingBiaoExample.createCriteria();
		criteria.andDangeridEqualTo(dangerId);
		List<Sidingbiao> sidingListInfo = siDingBiaoMapper.selectByExample(siDingBiaoExample);
		
		Map<String,Object> info = new HashMap<String,Object>();
		info.put("dangerInfo", dangerInfo);
		info.put("sidingListInfo", sidingListInfo);
		
		return info;
	}

	/**
	 * 根据四定编号查询四定延期记录
	 * 
	 * @param id 四定编号
	 *            
	 * @return
	 * @throws Exception
	 */
	public List<Delay> getDelaysBySidingId(Integer sidingId) throws Exception {
		
		DelayExample delayExample = new DelayExample();
		DelayExample.Criteria criteria = delayExample.createCriteria();
		criteria.andSidingidEqualTo(sidingId);
		List<Delay> delays = delayMapper.selectByExample(delayExample);
		
		return delays;
	}

	/**
	 * 根据四定编号查询跟踪信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public Follow getFollowBySidingId(Integer sidingId) throws Exception {
		Follow followInfo = null;
		FollowExample followExample = new FollowExample();
		FollowExample.Criteria criteria = followExample.createCriteria();
		criteria.andSidingidEqualTo(sidingId);
		List<Follow> list = followMapper.selectByExample(followExample);
		//判断查询是否为空
		if(list.size()>0){
			for (Follow follow : list) {
				followInfo = follow;
			}
		}
		
		
		return followInfo;
	}

	/**
	 * 根据四定编号查询四定信息
	 * 
	 * @param sidingId	四定编号
	 *            
	 * @return
	 * @throws Exception
	 */
	public Sidingbiao getSidingInfoBySidingId(Integer sidingId) throws Exception {
		
		Sidingbiao sidingInfo = siDingBiaoMapper.selectByPrimaryKey(sidingId);
		if(sidingInfo!=null){
			return sidingInfo;
		}else{
			return null;
		}
		
	}

}
