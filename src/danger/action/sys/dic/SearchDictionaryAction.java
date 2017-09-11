package danger.action.sys.dic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;

import danger.bean.sys.Dictionary;
import danger.service.sys.DictionaryService;
import net.sf.json.JSONArray;

/**
 * 查询字典action
 * @author yuanyr
 *
 */
@SuppressWarnings("serial")
@Component
public class SearchDictionaryAction extends ActionSupport {

	private String upDictionaryId; //上级字典编号  
	private String result;         //返回的结果
	private String nextId;         //下级中下一个字典的编号 
	private String dictionaryId;   //字典的编号  查询条件
	private String name;           //字典的名字  查询条件
	
	@Resource
	private DictionaryService dictionaryService;
	
	
	public String getUpDictionaryId() {
		return upDictionaryId;
	}

	public void setUpDictionaryId(String upDictionaryId) {
		this.upDictionaryId = upDictionaryId;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getNextId() {
		return nextId;
	}

	public void setNextId(String nextId) {
		this.nextId = nextId;
	}

	public String getDictionaryId() {
		return dictionaryId;
	}

	public void setDictionaryId(String dictionaryId) {
		this.dictionaryId = dictionaryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	/**
	 * 按照上级字典编号查询字典信息
	 * @return  
	 */
	public String searchDictionaryByUpId(){
		List<Dictionary> dictionary;
		try {
			//返回自己的子节点
			dictionary = dictionaryService.getDictionaryByUpDicId(upDictionaryId);
			//Dictionary dic = dictionaryService.getDictionaryById(upDictionaryId);
			//返回自己本身
			//dictionary.add(dic);
			//将java对象转化为json对象
			JSONArray jsonArray = JSONArray.fromObject(dictionary);
			//返回给Ajax
			this.result = jsonArray.toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	/**
	 * 按条件查询字典
	 * @return
	 */
	public String searchDictionaryByCondition(){
		List<Dictionary> dictionary;
		try {
			Map<String,Object> condition = new HashMap<String,Object>();
			condition.put("dictionaryId", dictionaryId);     //字典编号
			condition.put("name", name); 
			dictionary = dictionaryService.getDictionaryByConditon(condition);
			//将java对象转化为json对象
			JSONArray jsonArray = JSONArray.fromObject(dictionary);
			//返回给Ajax
			this.result = jsonArray.toString();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	
	/**
	 * 查询即将新增字典的id
	 * @return  
	 */
	public String searchNextId(){
		try {
			this.nextId = dictionaryService.getMaxDictionaryId(upDictionaryId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
}