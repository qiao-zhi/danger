package danger.mapper.queryView;

import danger.bean.queryView.DangerSidingFollow;
import danger.bean.queryView.DangerSidingFollowExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DangerSidingFollowMapper {
    int countByExample(DangerSidingFollowExample example);

    int deleteByExample(DangerSidingFollowExample example);

    int insert(DangerSidingFollow record);

    int insertSelective(DangerSidingFollow record);

    List<DangerSidingFollow> selectByExample(DangerSidingFollowExample example);

    int updateByExampleSelective(@Param("record") DangerSidingFollow record, @Param("example") DangerSidingFollowExample example);

    int updateByExample(@Param("record") DangerSidingFollow record, @Param("example") DangerSidingFollowExample example);
}