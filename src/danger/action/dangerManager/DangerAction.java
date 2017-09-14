package danger.action.dangerManager;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import danger.bean.dangerManage.Danger;
import danger.bean.sys.Dictionary;
import danger.mapper.dangerManage.DangerMapper;
import danger.mapper.dangerManage.custom.DangerCustomMapper;
import danger.service.dangerManage.DangerService;
import danger.service.sys.DictionaryService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@Scope("prototype")
// 控制层，多例模式
public class DangerAction extends ActionSupport {

	@Resource
	private DangerCustomMapper dangerCustomMapper;
	@Resource
	private DangerService dangerService;
	@Resource
	DangerMapper dangerMapper;
	@Resource
	private DictionaryService dictionaryService;
	// 班次
	private List<Danger> banciList;

	public List<Danger> getBanciList() {
		return banciList;
	}

	public void setBanciList(List<Danger> banciList) {
		this.banciList = banciList;
	}

	// 检查单位
	private List<Danger> jianChaList;

	public List<Danger> getJianChaList() {
		return jianChaList;
	}

	public void setJianChaList(List<Danger> jianChaList) {
		this.jianChaList = jianChaList;
	}

	// 隐患类型
	private List<Danger> dangeTpList;

	public List<Danger> getDangeTpList() {
		return dangeTpList;
	}

	public void setDangeTpList(List<Danger> dangeTpList) {
		this.dangeTpList = dangeTpList;
	}

	// 责任单位
	private List<Danger> zeRenList;

	public List<Danger> getZeRenList() {
		return zeRenList;
	}

	public void setZeRenList(List<Danger> zeRenList) {
		this.zeRenList = zeRenList;
	}

	private List<Danger> jbztList;

	public List<Danger> getJbztList() {
		return jbztList;
	}

	public void setJbztList(List<Danger> jbztList) {
		this.jbztList = jbztList;
	}

	private Danger danger;

	public Danger getDanger() {
		return danger;
	}

	public void setDanger(Danger danger) {
		this.danger = danger;
	}

	// 隐患录入
	public String addDanger() throws Exception {

		System.out.println(danger);
		// System.out.println(danger+"好了sd没");
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean flag = dangerService.addDanger(danger);

		JSONObject json = new JSONObject();
		if (flag) {
			System.out.println(flag);
			json.put("result", "录入成功");
		} else {
			System.out.println(flag);
			json.put("result", "录入失败");
		}
		System.out.println(json.toString());
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json.toString());

		return null;
	}

	// 隐患修改，根据javabean修改
	public String updateBydanger() throws Exception {
		System.out.println("进入updateBydanger()Action中");
		System.out.println(danger);
		// 根据一个隐患对象修改隐患记录
		boolean flag = dangerService.updateDangerById(danger);

		System.out.println(flag);

		HttpServletResponse response = ServletActionContext.getResponse();

		JSONObject json = new JSONObject();
		if (flag) {
			json.put("result", "修改成功");
		} else {
			json.put("result", "修改失败");
		}

		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());

		return null;// "updateByDanger";
	}

	// ========初始化下拉框 start
	// 初始化班次 这个还没弄
	public String initBanciData() throws Exception {
		List<String> banciList = new ArrayList<String>();

		// 根据上级字典编号查询下级字典信息
		List<Dictionary> banciList2 = dictionaryService.getDictionaryByUpDicId("500");
		for (Dictionary dic : banciList2) {
			banciList.add(dic.getName());// 名称
		}

		JSONObject json = new JSONObject();
		json.put("banci", banciList);

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		return null;
	}

	// 初始化检查单位
	public String initcheckUnitData() throws IOException, SQLException {
		// 把查询出来的数据封装成List集合就行了
		List<String> banciList = new ArrayList<String>();

		// 根据上级字典编号查询下级字典信息
		List<Dictionary> jcdwList2 = dictionaryService.getDictionaryByUpDicId("400");
		for (Dictionary dic : jcdwList2) {
			banciList.add(dic.getName());// 名称
		}

		JSONObject json = new JSONObject();
		json.put("banci", banciList);

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		return null;
	}

	// 初始化隐患类型
	public String initDangerType() throws Exception {
		// 把查询出来的数据封装成List集合就行了
		// 把查询出来的数据封装成List集合就行了
		List<String> banciList = new ArrayList<String>();

		// 根据上级字典编号查询下级字典信息
		List<Dictionary> yhlxList2 = dictionaryService.getDictionaryByUpDicId("100");
		for (Dictionary dic : yhlxList2) {
			banciList.add(dic.getName());// 名称
		}

		JSONObject json = new JSONObject();
		json.put("banci", banciList);

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		return null;
	}

	// 初始化隐患级别
	public String initDangerGrade() throws IOException, SQLException {
		// 把查询出来的数据封装成List集合就行了
		// 把查询出来的数据封装成List集合就行了
		List<String> banciList = new ArrayList<String>();

		// 根据上级字典编号查询下级字典信息
		List<Dictionary> yhjbList2 = dictionaryService.getDictionaryByUpDicId("300");
		for (Dictionary dic : yhjbList2) {
			banciList.add(dic.getName());// 名称
		}

		JSONObject json = new JSONObject();
		json.put("banci", banciList);

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		return null;
	}

	// 初始化责任单位
	/*
	 * public String initUnitData() throws IOException {
	 *//**
		 * [ {id : 1,pId : 0,name : "炖烂安检处",open : true}, {id : 11,pId : 1,name
		 * : "无人检查组",open : true}, {id : 12,pId : 1,name : "班长",open : true } ];
		 */

	/*
	 * int id =1; int pId = 0; String name = "炖烂安监处"; boolean open = true;
	 * 
	 * //封装JSON数组 JSONArray jsonArray = new JSONArray();
	 * 
	 *//**
		 * var zNodes2 = [ {id : 1,pId : 0,name : "随意勾选 1",open : true}, {id :
		 * 11,pId : 1,name : "无 radio 1-1",nocheck : true}, {id : 12,pId :
		 * 1,name : "随意勾选 1-2",open : true }, {id : 121,pId : 12,name :
		 * "随意勾选 1-2-1" }, {id : 122,pId : 12, name : "随意勾选 1-2-2"}, {id :
		 * 123,pId : 12, name : "无 radio 1-2-3", nocheck : true}, {id : 13,pId :
		 * 1,name : "随意勾选 1-3" }, {id : 2,pId : 0,name : "禁止勾选 2",open : true},
		 * {id : 21,pId : 2,name : "禁止勾选 2-1",doCheck : false}, {id : 22,pId :
		 * 2,name : "禁止勾选 2-2",open : true }, {id : 221,pId : 22,name :
		 * "禁止勾选 2-2-1" }, {id : 222,pId : 22,name : "禁止勾选 2-2-2",doCheck :
		 * false }, {id : 223,pId : 22, name : "禁止勾选 2-2-3",doCheck : false},
		 * {id : 23,pId : 2,name : "禁止勾选 2-3",doCheck : false } ];
		 *//*
		 * JSONObject json1 = new JSONObject();
		 * 
		 * json1.put("id", 1); json1.put("pId", 0); json1.put("name", "炖烂安监处");
		 * json1.put("open", true); jsonArray.add(json1);
		 * 
		 * 
		 * //JSON对象 for(int i=1;i<=4;i++){ JSONObject json = new JSONObject();
		 * 
		 * json.put("id", i+1); json.put("pId", i); json.put("name", "炖烂安监处");
		 * json.put("open", true);
		 * 
		 * // 将json对象添加到json数组中 jsonArray.add(json);
		 * 
		 * 
		 * }
		 * 
		 * 
		 * System.out.println(jsonArray.toString());
		 * 
		 * HttpServletResponse response = ServletActionContext.getResponse();
		 * response.setContentType("text/html;charset=utf-8");
		 * response.getWriter().write(jsonArray.toString()); return null; }
		 */
	// ========================初始化下拉框 end

	// =====================
	// 将所有级别=无且状态="未四定的隐患信息查询出来 页面初始化用的
	/*
	 * public String findDangerByJBZT() throws IOException { // 这个查询出来的数据是错误的
	 * jbztList = dangerCustomMapper.findAllDangerclassType();
	 * System.out.println(jbztList); return SUCCESS; }
	 */

	public String deletebydangerid() throws Exception {
		System.out.println("进入Action删除方法");
		String dangerid = ServletActionContext.getRequest().getParameter("dangerid");
		System.out.println("传过来的隐患id是:" + dangerid);
		//
		// 根据隐患id删除隐患信息
		boolean flag = dangerService.deleteDangerById(Integer.parseInt(dangerid));
		System.out.println("是否根据隐患id删除了隐患信息？" + flag);

		// 将数据以json格式响应给ajax
		HttpServletResponse response = ServletActionContext.getResponse();

		JSONObject json = new JSONObject();
		if (flag) {
			json.put("message", "删除成功");
		} else {
			json.put("message", "删除失败");
		}
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json.toString());

		return null;
	}
}
