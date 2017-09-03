package danger.service.impl.dangerServiceImpl;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import danger.bean.dangerManage.Danger;
import danger.service.dangerManage.DangerService;
import danger.utils.PageBean;

//隐患录入实现类
public class DangerServiceImpl implements DangerService{
	//sqlSessionFactory
	private SqlSessionFactory sqlSessionFactory;
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	
	//隐患录入
	//录入的隐患等级如果是A或B级，则需要记录重大安全隐患上报报告
	//如果是c级或者无，则不需要记录重大安全隐患上报报告。需要在用户填写之后的那个界面处理一下
	@Override
	public boolean addDanger(Danger danger) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.insert("danger.mapper.dangerManage.DangerMapper", danger);
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();//如果发生异常，不插入数据
			return false;
		}finally{
			sqlSession.close();
		}
		return true;
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
		// TODO Auto-generated method stub
		return null;
	}


}
