package danger.mapper.queryView;

import danger.bean.queryView.DangerSpot;
import danger.bean.queryView.DangerSpotExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DangerSpotMapper {
    int countByExample(DangerSpotExample example);

    int deleteByExample(DangerSpotExample example);

    int insert(DangerSpot record);

    int insertSelective(DangerSpot record);

    List<DangerSpot> selectByExample(DangerSpotExample example);

    int updateByExampleSelective(@Param("record") DangerSpot record, @Param("example") DangerSpotExample example);

    int updateByExample(@Param("record") DangerSpot record, @Param("example") DangerSpotExample example);
}