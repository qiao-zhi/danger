package danger.service.impl.spotDisposeServiceImpl;

import java.util.Date;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import danger.bean.dangerHandle.Spotdispose;
import danger.service.dangerHandle.SpotDisposeService;

//现场处理实现类
@Service
public class SpotDisposeServiceImpl implements SpotDisposeService {
	// sqlSessionFactory
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}

	public SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}

	private DataSource dataSource;

	public DataSource getDataSource() {
		return dataSource;
	}

	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	// 添加现场处理的信息
	@Override
	public boolean addSpotDispose(Spotdispose spotDispose) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.insert("danger.mapper.dangerHandle.SpotdisposeMapper.insert", spotDispose);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sqlSession.rollback();// 如果发生异常，不插入数据
			return false;
		} finally {
			sqlSession.close();
		}
		return true;
	}

	public void haha() {
		System.out.println(sqlSessionFactory);
		System.out.println(dataSource);
	}

	public static void main(String[] args) throws Exception {
		/*SpotDisposeServiceImpl spotDisposeServiceImpl = new SpotDisposeServiceImpl();
		Spotdispose spotdispose = new Spotdispose();
		spotdispose.setDisposeid(1);
		spotdispose.setDangerid(1520);
		spotdispose.setHassafemeasure(true);
		spotdispose.setDisposemeasure("洒水");
		spotdispose.setDisposedate(new Date());
		spotdispose.setDisposeperson("贤贤");
*/
		// spotDisposeServiceImpl.addSpotDispose(spotdispose);

		new SpotDisposeServiceImpl().haha();

		System.out.println("现场处理插入成功！");
	}

	@Override
	public boolean deleteSpotDisposeById(Integer spotDisposeId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.insert("danger.mapper.dangerHandle.SpotdisposeMapper.deleteByPrimaryKey", spotDisposeId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sqlSession.rollback();// 如果发生异常，不插入数据
			return false;
		} finally {
			sqlSession.close();
		}
		return true;
	}

	@Override
	public boolean updateSpotDisposeById(Spotdispose spotDispose) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.insert("danger.mapper.dangerHandle.SpotdisposeMapper.updateByPrimaryKeySelective", spotDispose);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			sqlSession.rollback();// 如果发生异常，不插入数据
			return false;
		} finally {
			sqlSession.close();
		}
		return true;
	}

	@Override
	public Map<String, Object> getSpotDisposeByDangerId(Integer dangerId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
