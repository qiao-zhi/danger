package danger.bean.dangerHandle;

import java.util.Date;
//跟踪表
public class Follow {
    private Integer followid;

    private Integer sidingid;

    private Integer dangerid;

    private Boolean hassecurity;

    private String safetytechnician;

    private String managername;

    private Date rechecktime;

    public Integer getFollowid() {
        return followid;
    }

    public void setFollowid(Integer followid) {
        this.followid = followid;
    }

    public Integer getSidingid() {
        return sidingid;
    }

    public void setSidingid(Integer sidingid) {
        this.sidingid = sidingid;
    }

    public Integer getDangerid() {
        return dangerid;
    }

    public void setDangerid(Integer dangerid) {
        this.dangerid = dangerid;
    }

    public Boolean getHassecurity() {
        return hassecurity;
    }

    public void setHassecurity(Boolean hassecurity) {
        this.hassecurity = hassecurity;
    }

    public String getSafetytechnician() {
        return safetytechnician;
    }

    public void setSafetytechnician(String safetytechnician) {
        this.safetytechnician = safetytechnician == null ? null : safetytechnician.trim();
    }

    public String getManagername() {
        return managername;
    }

    public void setManagername(String managername) {
        this.managername = managername == null ? null : managername.trim();
    }

    public Date getRechecktime() {
        return rechecktime;
    }

    public void setRechecktime(Date rechecktime) {
        this.rechecktime = rechecktime;
    }
}