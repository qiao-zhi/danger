package danger.service.queryView;

import java.util.Map;

import danger.bean.dangerManage.Danger;
import danger.utils.PageBean;

public interface QueryViewService {

	/**
	 * 分页组合条件查询隐患
	 * 
	 * @param currentPage
	 *            当前页
	 * @param currentCount
	 *            每页大小
	 * @param condition
	 *            查询条件
	 * @return
	 * @throws Exception
	 */
	public PageBean<Danger> findDangerByCondition(int currentPage, int currentCount, Map<String, String> condition)
			throws Exception;
}
