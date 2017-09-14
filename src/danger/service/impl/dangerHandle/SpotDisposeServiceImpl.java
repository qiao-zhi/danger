package danger.service.impl.dangerHandle;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import danger.bean.dangerHandle.Spotdispose;
import danger.bean.dangerHandle.SpotdisposeExample;
import danger.bean.dangerManage.Danger;
import danger.bean.dangerManage.DangerExample;
import danger.mapper.dangerHandle.SpotdisposeMapper;
import danger.mapper.dangerHandle.custom.SpotdisposeCustomMapper;
import danger.mapper.dangerManage.DangerMapper;
import danger.service.dangerHandle.SpotDisposeService;
import danger.service.dangerManage.DangerService;

//现场处理实现类
@Service
public class SpotDisposeServiceImpl implements SpotDisposeService {
	@Resource
	private SpotdisposeMapper spotdisposeMapper;

	@Resource
	private DangerMapper dangerMapper;

	@Resource
	private DangerService dangerService;
	@Resource
	SpotdisposeCustomMapper spotdisposeCustomMapper;

	//
	@Override
	public boolean addSpotDispose(Spotdispose spotDispose) throws Exception {
		// 1、增加现场处理记录
		int result = spotdisposeMapper.insert(spotDispose);
		if (result > 0) {
			// 2、根据隐患编号修改隐患状态为已现场处理
			Integer dangerId = spotDispose.getDangerid();

			// 封装条件
			Danger danger = (Danger) dangerMapper.selectByPrimaryKey(dangerId);
			// boolean result = false;
			int result2 = dangerMapper.updateByPrimaryKeySelective(danger);
			return result2 == 0 ? false : true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteSpotDisposeById(Integer spotDisposeId) throws Exception {
		// 这个要级联删除
		int result = spotdisposeMapper.deleteByPrimaryKey(spotDisposeId);
		return (result == 1 ? true : false);
	}

	@Override
	public boolean updateSpotDisposeById(Spotdispose spotDispose) throws Exception {
		int result = spotdisposeMapper.updateByPrimaryKeySelective(spotDispose);
		return (result == 1 ? true : false);
	}

	// 这个方法有错
	@Override
	public Map<String, Object> getSpotDisposeByDangerId(Integer dangerId) throws Exception {
		if (dangerId != null) {
			// 获取现场处理信息
			Spotdispose spotMsg = spotdisposeMapper.selectByPrimaryKey(dangerId);
			// 获取隐患基本信息
			Danger dangerMsg = dangerMapper.selectByPrimaryKey(dangerId);
			// 将隐患基本信息和现场处理信息封装在Map集合中
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("spotMsg", spotMsg);
			map.put("dangerMsg", dangerMsg);
			return map;
		} else {
			return null;
		}
	}

	/**
	 * 根据隐患id查询现场处理信息
	 * 
	 * @param dangerId
	 *            隐患id
	 * @return 现场处理的javabean
	 */
	@Override
	public Spotdispose selectByDangerId(Integer dangerId) {
		if (dangerId != null) {
			SpotdisposeExample spotdisposeExample = new SpotdisposeExample();
			SpotdisposeExample.Criteria criteria = spotdisposeExample.createCriteria();
			criteria.andDangeridEqualTo(dangerId);

			List<Spotdispose> spotdispose = spotdisposeMapper.selectByExample(spotdisposeExample);
			// Spotdispose spotdi =
			// spotdisposeCustomMapper.selectByDangerId(dangerId);
			if (spotdispose.size() > 0) {
				return spotdispose.get(0);
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * 根据隐患id删除现场处理信息
	 * @param dangerid 隐患id
	 * @return 是否删除成功
	 */
	@Override
	public boolean delSpotDisposeBydangerId(Integer dangerid){
		//
		SpotdisposeExample spotdisposeExample = new SpotdisposeExample();
		SpotdisposeExample.Criteria criteria = spotdisposeExample.createCriteria();
		//封装条件
		criteria.andDangeridEqualTo(dangerid);
		//删除现场处理信息
		int result = spotdisposeMapper.deleteByExample(spotdisposeExample);
		return result==0?false:true;
	}
}