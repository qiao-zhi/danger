package danger.service.impl.sys;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import danger.bean.sys.Department;
import danger.mapper.sys.DepartmentMapper;
import danger.service.sys.DepartmentService;

/**
 * 机构service实现类
 * @author yuanyr
 *
 */
@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	
	@Resource
	private DepartmentMapper departmentMapper;

	
	@Override
	public List<Map<String, Object>> getUnitTree() {
		// TODO Auto-generated method stub
		return departmentMapper.getUnitTree();
	}
	

	@Override
	public boolean addUnit(Department department) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.addUnit(department);
	}

	
	@Override
	public boolean deleteUnit(String departmentId) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.deleteUnit(departmentId);
	}

	
	@Override
	public boolean updateUnit(Department department) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.updateUnit(department);
	}

	
	@Override
	public Department getUnitByUnitId(String departmentId) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.getUnitByUnitId(departmentId);
	}

	
	@Override
	public List<Department> getUnitByUpUnitId(String upDepartmentId) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.getUnitByUpUnitId(upDepartmentId);
	}

	
	@Override
	public List<Department> getUnitByConditon(Map<String, Object> condition) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.getUnitByConditon(condition);
	}

	
	@Override
	public String getNextUnitId(String upDepartmentId) throws SQLException {
		// TODO Auto-generated method stub
		return departmentMapper.getNextUnitId(upDepartmentId);
	}

}