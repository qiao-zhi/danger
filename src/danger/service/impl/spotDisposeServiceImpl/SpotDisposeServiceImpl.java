package danger.service.impl.spotDisposeServiceImpl;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import danger.bean.dangerHandle.Spotdispose;
import danger.bean.dangerManage.Danger;
import danger.mapper.dangerHandle.SpotdisposeMapper;
import danger.mapper.dangerManage.DangerMapper;
import danger.service.dangerHandle.SpotDisposeService;
import danger.service.dangerManage.DangerService;

//现场处理实现类
@Service
public class SpotDisposeServiceImpl implements SpotDisposeService {
	@Autowired
	private SpotdisposeMapper spotdisposeMapper;
	public SpotdisposeMapper getSpotdisposeMapper() {
		return spotdisposeMapper;
	}
	public void setSpotdisposeMapper(SpotdisposeMapper spotdisposeMapper) {
		this.spotdisposeMapper = spotdisposeMapper;
	}
	
	@Autowired
	private DangerMapper dangerMapper;
	public DangerMapper getDangerMapper() {
		return dangerMapper;
	}
	public void setDangerMapper(DangerMapper dangerMapper) {
		this.dangerMapper = dangerMapper;
	}
	
	@Autowired
	private DangerService dangerService;
	public DangerService getDangerService() {
		return dangerService;
	}
	public void setDangerService(DangerService dangerService) {
		this.dangerService = dangerService;
	}
	
	//？？？？？？？
	@Override
	public boolean addSpotDispose(Spotdispose spotDispose) throws Exception {
		//1、增加现场处理记录
		spotdisposeMapper.insert(spotDispose);
		//2、根据隐患编号修改隐患状态为已现场处理， 问题：新的隐患状态来自哪里？？？
		//dangerService.updateDangerStatus(spotDispose.getDangerid(), "这个隐患状态。。。？？");
		return true;
	}

	@Override
	public boolean deleteSpotDisposeById(Integer spotDisposeId) throws Exception {
		//这个要级联删除,这个还没做完
		spotdisposeMapper.deleteByPrimaryKey(spotDisposeId);
		return true;
	}

	@Override
	public boolean updateSpotDisposeById(Spotdispose spotDispose) throws Exception {
		spotdisposeMapper.updateByPrimaryKey(spotDispose);
		return true;
	}

	@Override
	public Map<String, Object> getSpotDisposeByDangerId(Integer dangerId) throws Exception {
		//获取现场处理信息
		Spotdispose spotMsg = spotdisposeMapper.selectByPrimaryKey(dangerId);
		//获取隐患基本信息
		Danger dangerMsg = dangerMapper.selectByPrimaryKey(dangerId);
		//将隐患基本信息和现场处理信息封装在Map集合中
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		map.put("spotMsg", spotMsg);
		map.put("dangerMsg", dangerMsg);
		return map;
	}
	
}
