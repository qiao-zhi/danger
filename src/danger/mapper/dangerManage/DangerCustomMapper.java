package danger.mapper.dangerManage;

import java.util.List;
import java.util.Map;

import danger.bean.dangerManage.Danger;

public interface DangerCustomMapper {

	/**
	 * 组合条件查询隐患
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Danger> findDangerByCondition(Map<String, Object> map) throws Exception;

	/**
	 * 根据条件查询满足条件的总数
	 * 
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Integer getDangerCountByCondition(Map<String, Object> map) throws Exception;

}
