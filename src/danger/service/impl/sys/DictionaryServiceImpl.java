package danger.service.impl.sys;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import danger.bean.sys.Dictionary;
import danger.mapper.sys.DictionaryMapper;
import danger.service.sys.DictionaryService;

/**
 * 字典service实现类
 * @author yuanyr
 *
 */
@Service("dictionaryService")
public class DictionaryServiceImpl implements DictionaryService {

	@Resource
	private DictionaryMapper dictionaryMapper;

	
	@Override
	public List<Map<String, Object>> getDictionaryTree() throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.getDictionaryTree();
	}

	
	@Override
	public boolean addDictionary(Dictionary dictionary) throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.addDictionary(dictionary);
	}

	
	@Override
	public boolean deleteDictionary(String dictionaryId) throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.deleteDictionary(dictionaryId);
	}

	
	@Override
	public boolean updateDictionary(Dictionary dictionary) throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.updateDictionary(dictionary);
	}

	
	@Override
	public Dictionary getDictionaryById(String dictionaryId) throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.getDictionaryById(dictionaryId);
	}

	
	@Override
	public List<Dictionary> getDictionaryByUpDicId(String upDictionaryId) throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.getDictionaryByUpDicId(upDictionaryId);
	}

	
	@Override
	public List<Dictionary> getDictionaryByConditon(Map<String, Object> condition) throws SQLException {
		// TODO Auto-generated method stub
		return dictionaryMapper.getDictionaryByConditon(condition);
	}

	
	@Override
	public String getMaxDictionaryId(String upDictionaryId) throws SQLException {
		String nextId = dictionaryMapper.getMaxDictionaryId(upDictionaryId);
		if (nextId == null) {
			nextId = upDictionaryId + "001";
		} else if (Integer.parseInt(nextId) / 100 < 1000) {
			nextId = Integer.toString(Integer.parseInt(nextId) + 100);
		} else {
			nextId = Integer.toString(Integer.parseInt(nextId) + 1);
		}
		return nextId;
	}
	
}