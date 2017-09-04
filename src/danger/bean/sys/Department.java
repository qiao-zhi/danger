package danger.bean.sys;

public class Department {
    private String departmentid;

    private String updepartmentid;

    private String name;

    private String manager;

    private String phone;

    public String getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(String departmentid) {
        this.departmentid = departmentid == null ? null : departmentid.trim();
    }

    public String getUpdepartmentid() {
        return updepartmentid;
    }

    public void setUpdepartmentid(String updepartmentid) {
        this.updepartmentid = updepartmentid == null ? null : updepartmentid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager == null ? null : manager.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}