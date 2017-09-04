package danger.mapper.queryView;

import danger.bean.queryView.DangerSidingFollowRecheck;
import danger.bean.queryView.DangerSidingFollowRecheckExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DangerSidingFollowRecheckMapper {
    int countByExample(DangerSidingFollowRecheckExample example);

    int deleteByExample(DangerSidingFollowRecheckExample example);

    int insert(DangerSidingFollowRecheck record);

    int insertSelective(DangerSidingFollowRecheck record);

    List<DangerSidingFollowRecheck> selectByExample(DangerSidingFollowRecheckExample example);

    int updateByExampleSelective(@Param("record") DangerSidingFollowRecheck record, @Param("example") DangerSidingFollowRecheckExample example);

    int updateByExample(@Param("record") DangerSidingFollowRecheck record, @Param("example") DangerSidingFollowRecheckExample example);
}