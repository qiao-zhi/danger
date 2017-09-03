package danger.service.impl.dangerServiceImpl;

import static org.junit.Assert.*;

import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import danger.bean.dangerManage.Danger;
import danger.mapper.dangerManage.DangerMapper;
import danger.service.dangerManage.DangerService;
import danger.utils.PageBean;

//隐患录入实现类
@Service
public class DangerServiceImpl implements DangerService {
	@Autowired
	private DangerMapper dangerMapper;
	public DangerMapper getDangerMapper() {
		return dangerMapper;
	}
	public void setDangerMapper(DangerMapper dangerMapper) {
		this.dangerMapper = dangerMapper;
	}


	// 隐患录入
	@Override
	public boolean addDanger(Danger danger) throws Exception {
		dangerMapper.insert(danger);
		return true;
	}

	@Override
	public boolean deleteDangerById(Integer id) throws Exception {
		// 级联删除，这个还没做完
		dangerMapper.deleteByPrimaryKey(id);
		return false;
	}

	@Override
	public boolean updateDangerById(Danger danger) throws Exception {
		dangerMapper.updateByPrimaryKey(danger);
		return true;
	}

	@Override
	public boolean updateDangerStatus(Integer dangerId, String status) throws Exception {
		//根据隐患编号查询出对应的隐患记录
		Danger danger = dangerMapper.selectByPrimaryKey(dangerId);
		//修改隐患状态
		danger.setDangerstatus(status);
		//再将修改后的隐患信息保存到数据库
		dangerMapper.insert(danger);
		return true;
	}

	@Override
	public Danger getDangerById(Integer id) throws Exception {
		Danger danger = dangerMapper.selectByPrimaryKey(id);
		return danger;
	}

	@Override
	public PageBean<Danger> findDangerByCondition(int currentPage, int currentCount, Map<String, String> condition)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
