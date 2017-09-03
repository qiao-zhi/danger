package danger.bean.sys;

public class Dictionary {
    private String dictionaryid;

    private String name;

    private String updictionaryid;

    private Boolean isuse;

    private String description;

    public String getDictionaryid() {
        return dictionaryid;
    }

    public void setDictionaryid(String dictionaryid) {
        this.dictionaryid = dictionaryid == null ? null : dictionaryid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getUpdictionaryid() {
        return updictionaryid;
    }

    public void setUpdictionaryid(String updictionaryid) {
        this.updictionaryid = updictionaryid == null ? null : updictionaryid.trim();
    }

    public Boolean getIsuse() {
        return isuse;
    }

    public void setIsuse(Boolean isuse) {
        this.isuse = isuse;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}