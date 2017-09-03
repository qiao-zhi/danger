package danger.bean.dangerManage;

import java.util.Date;
import java.util.List;

import danger.bean.dangerHandle.Sidingbiao;
//隐患表
public class Danger {
	//隐患编号
	private Integer dangerid;
	//发现时间
	private Date findtime;
	//隐患类型
	private String classtype;
	//发现人
	private String findperson;
	//检查单位
	private String checkunit;
	//地点
	private String address;
	//隐患内容
	private String content;
	//隐患级别
	private String dangergrade;
	//隐患类型
	private String type;
	//责任单位
	private String unit;
	//责任单位负责人
	private String manager;
	//
	private String dangerstatusnum;
	//隐患状态
	private String dangerstatus;
	//隐患上报报告
	private String dangerreport;
	//一个隐患有多个四定
	private List<Sidingbiao> siDings;

	public List<Sidingbiao> getSiDings() {
		return siDings;
	}

	public void setSiDings(List<Sidingbiao> siDings) {
		this.siDings = siDings;
	}

	public Integer getDangerid() {
		return dangerid;
	}

	public void setDangerid(Integer dangerid) {
		this.dangerid = dangerid;
	}

	public Date getFindtime() {
		return findtime;
	}

	public void setFindtime(Date findtime) {
		this.findtime = findtime;
	}

	public String getClasstype() {
		return classtype;
	}

	public void setClasstype(String classtype) {
		this.classtype = classtype == null ? null : classtype.trim();
	}

	public String getFindperson() {
		return findperson;
	}

	public void setFindperson(String findperson) {
		this.findperson = findperson == null ? null : findperson.trim();
	}

	public String getCheckunit() {
		return checkunit;
	}

	public void setCheckunit(String checkunit) {
		this.checkunit = checkunit == null ? null : checkunit.trim();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? null : address.trim();
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content == null ? null : content.trim();
	}

	public String getDangergrade() {
		return dangergrade;
	}

	public void setDangergrade(String dangergrade) {
		this.dangergrade = dangergrade == null ? null : dangergrade.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit == null ? null : unit.trim();
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager == null ? null : manager.trim();
	}

	public String getDangerstatusnum() {
		return dangerstatusnum;
	}

	public void setDangerstatusnum(String dangerstatusnum) {
		this.dangerstatusnum = dangerstatusnum == null ? null : dangerstatusnum.trim();
	}

	public String getDangerstatus() {
		return dangerstatus;
	}

	public void setDangerstatus(String dangerstatus) {
		this.dangerstatus = dangerstatus == null ? null : dangerstatus.trim();
	}

	public String getDangerreport() {
		return dangerreport;
	}

	public void setDangerreport(String dangerreport) {
		this.dangerreport = dangerreport == null ? null : dangerreport.trim();
	}
}