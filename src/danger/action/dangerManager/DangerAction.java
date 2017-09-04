package danger.action.dangerManager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import danger.service.dangerManage.DangerService;
import danger.service.queryView.QueryViewService;

@Controller
@Scope("prototype")
// 控制层，多例模式
public class DangerAction extends ActionSupport {

	private int currentPage;
	private int currentCount;

	@Autowired
	private QueryViewService queryViewService;

	public String findDangerByCondition() {
		Map condition = new HashMap();

		try {
			queryViewService.findDangerByCondition(currentPage, currentCount, condition);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}

	public QueryViewService getQueryViewService() {
		return queryViewService;
	}

	public void setQueryViewService(QueryViewService queryViewService) {
		this.queryViewService = queryViewService;
	}


}
