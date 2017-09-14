package danger.action.dangerHandle;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import danger.bean.dangerHandle.Spotdispose;
import danger.bean.dangerManage.Danger;
import danger.mapper.dangerHandle.SpotdisposeMapper;
import danger.mapper.dangerManage.DangerMapper;
import danger.service.dangerHandle.SpotDisposeService;
import danger.service.dangerManage.DangerService;
import danger.service.impl.dangerHandle.SpotDisposeServiceImpl;
import danger.service.impl.dangerManager.DangerServiceImpl;
import net.sf.json.JSONObject;

@Controller
@Scope("prototype")
// 控制层，多例模式
public class SpotDisposeAction extends ActionSupport {

	//实体javabean，struts2会进行自动封装
	private Spotdispose spotdispose;
	public Spotdispose getSpotdispose() {
		return spotdispose;
	}
	public void setSpotdispose(Spotdispose spotdispose) {
		this.spotdispose = spotdispose;
	}

	@Resource
	private SpotDisposeService spotDisposeService;
	@Resource
	private SpotdisposeMapper spotdisposeMapper;
	@Resource
	private DangerService dangerService;
	@Resource
	private DangerMapper dangerMapper;
	
	/**
	 * 根据隐患id删除现场处理信息
	 * @return
	 * @throws Exception
	 */
	public String delDisposeByDangerId() throws Exception{
		System.out.println("开始根据隐患id删除现场处理信息");
		String dangerid = ServletActionContext.getRequest().getParameter("dangerid");
		System.out.println("从jsp传过来的隐患id:"+dangerid);
		
		//根据隐患id删除现场处理信息
		boolean result = spotDisposeService.delSpotDisposeBydangerId(Integer.parseInt(dangerid));
		
		JSONObject json = new JSONObject();
		if(result){
			json.put("result", "删除成功");
			//删除成功之后，将隐患信息的状态改为"未四定" (根据隐患id修改)
			Danger danger = new Danger();
			danger.setDangerid(Integer.parseInt(dangerid));
			danger.setDangerstatus("未四定");
			dangerService.updateDangerById(danger);
		}else{
			json.put("result", "删除失败");
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		//将数据以json格式响应给ajax
		response.getWriter().write(json.toString());
		return null;
	}
	
	/**
	 * 根据隐患id添加现场处理信息
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception {
		//spotdispose.setDangerid(1);
		System.out.println(spotdispose);
		boolean flag = spotDisposeService.addSpotDispose(spotdispose);
		//将状态改为已现场处理
		int dangerid = spotdispose.getDangerid();//隐患id
		System.out.println("dangerid="+dangerid);
		//修改隐患状态
		Danger danger = new Danger();
		danger.setDangerid(dangerid);
		danger.setDangerstatus("已现场处理");
		dangerMapper.updateByPrimaryKeySelective(danger);
		
		JSONObject json = new JSONObject();
		if (flag) {
			json.put("result", "保存成功");
		} else {
			json.put("result", "保存失败");
		}
		// 将反馈信息发送给对应页面
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		return null;
	}
	
	/**
	 * 根据隐患id修改现场处理信息
	 * @return
	 * @throws Exception
	 */
	public String updateBydangerid() throws Exception{
		System.out.println("进入action");
		System.out.println(spotdispose);
		//Spotdispose [disposeid=null, dangerid=1, hassafemeasure=1, disposemeasure=refdg, disposedate=Sun Sep 10 00:00:00 CST 2017, disposeperson=fdg]

		//根据隐患id查询现场处理信息
		Spotdispose spotd = spotDisposeService.selectByDangerId(spotdispose.getDangerid());
		//获取现场处理信息的id
		Integer disposeid = spotd.getDisposeid();
		
		//
		spotdispose.setDisposeid(disposeid);
		int result = spotdisposeMapper.updateByPrimaryKeySelective(spotdispose);
		
		//根据隐患id修改现场处理信息 已经获取到了修该后的现场处理信息
		//先根据隐患id查询现场处理信息  然后再将修改后的现场处理信息
		
		
		
		JSONObject json = new JSONObject();
		if (result>0) {
			json.put("result", "保存成功");
		} else {
			json.put("result", "保存失败");
		}
		// 将反馈信息发送给对应页面
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json.toString());
		
		return null;
	}
	
	
	/**
	 * 通过隐患id查询现场处理信息
	 * @return
	 * @throws Exception
	 */
	public String findByDangerId() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String dangerid = request.getParameter("dangerid");
		Spotdispose spotd = spotDisposeService.selectByDangerId(Integer.parseInt(dangerid));

		JSONObject json = new JSONObject();
		json.put("hassafemeasure", spotd.getHassafemeasure().equals("1") ? "有" : "无");
		json.put("disposemeasure", spotd.getDisposemeasure());

		Date date = spotd.getDisposedate();
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String localdate = sdfm.format(date);

		json.put("disposedate", localdate);
		System.err.println("现场处理人:" + spotd.getDisposeperson());
		json.put("disposeperson", spotd.getDisposeperson());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(json.toString());
		return null;
	}
}
