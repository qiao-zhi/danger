package danger.mapper.queryView;

import danger.bean.queryView.DangerSiding;
import danger.bean.queryView.DangerSidingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DangerSidingMapper {
    int countByExample(DangerSidingExample example);

    int deleteByExample(DangerSidingExample example);

    int insert(DangerSiding record);

    int insertSelective(DangerSiding record);

    List<DangerSiding> selectByExample(DangerSidingExample example);

    int updateByExampleSelective(@Param("record") DangerSiding record, @Param("example") DangerSidingExample example);

    int updateByExample(@Param("record") DangerSiding record, @Param("example") DangerSidingExample example);
}