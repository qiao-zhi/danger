package danger.service.sys;

import danger.bean.sys.Dictionary;

/**
 * 字典接口
 * 
 * @author QizoLiQiang
 * @time 2017年9月4日上午12:46:00
 */
public interface DictionaryService {

	/**
	 * 增加字典
	 * 
	 * @param dictionary
	 * @return
	 * @throws Exception
	 */
	public boolean addDictionary(Dictionary dictionary) throws Exception;
}
