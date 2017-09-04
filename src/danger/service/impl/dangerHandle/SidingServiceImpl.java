package danger.service.impl.dangerHandle;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import danger.bean.dangerHandle.Delay;
import danger.bean.dangerHandle.Follow;
import danger.bean.dangerHandle.Sidingbiao;
import danger.service.dangerHandle.SidingService;
@Service
public class SidingServiceImpl implements SidingService {

	@Override
	public boolean addSiding(Sidingbiao siding) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteSidingById(Integer id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateSiding(Sidingbiao siding) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Map<String, Object> getSidingById(Integer dangerId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Delay> getDelaysBySidingId(Integer sidingId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Follow getFollowBySidingId(Integer sidingId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
