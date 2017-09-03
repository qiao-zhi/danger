package danger.bean.dangerHandle;

import java.util.Date;
//现场处理表
public class Spotdispose {
	//处理编号(这个是主键)
    private Integer disposeid;
    //隐患编号(这个是外键)
    private Integer dangerid;
    //是否有安全技术措施
    private Boolean hassafemeasure;
    //处理措施
    private String disposemeasure;
    //处理时间
    private Date disposedate;
    //处理人
    private String disposeperson;

    public Integer getDisposeid() {
        return disposeid;
    }

    public void setDisposeid(Integer disposeid) {
        this.disposeid = disposeid;
    }

    public Integer getDangerid() {
        return dangerid;
    }

    public void setDangerid(Integer dangerid) {
        this.dangerid = dangerid;
    }

    public Boolean getHassafemeasure() {
        return hassafemeasure;
    }

    public void setHassafemeasure(Boolean hassafemeasure) {
        this.hassafemeasure = hassafemeasure;
    }

    public String getDisposemeasure() {
        return disposemeasure;
    }

    public void setDisposemeasure(String disposemeasure) {
        this.disposemeasure = disposemeasure == null ? null : disposemeasure.trim();
    }

    public Date getDisposedate() {
        return disposedate;
    }

    public void setDisposedate(Date disposedate) {
        this.disposedate = disposedate;
    }

    public String getDisposeperson() {
        return disposeperson;
    }

    public void setDisposeperson(String disposeperson) {
        this.disposeperson = disposeperson == null ? null : disposeperson.trim();
    }
}