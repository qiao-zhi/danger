package danger.service.impl.dangerManager;

import java.util.Map;

import org.springframework.stereotype.Service;

import danger.bean.dangerManage.Danger;
import danger.service.dangerManage.DangerService;
import danger.utils.PageBean;
@Service
public class DangerServiceImpl implements DangerService{

	@Override
	public boolean addDanger(Danger danger) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteDangerById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateDangerById(Danger danger) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateDangerStatus(Integer dangerId, String status) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Danger getDangerById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageBean<Danger> findDangerByCondition(int currentPage, int currentCount, Map<String, String> condition)
			throws Exception {
		
		return null;
	}

}
