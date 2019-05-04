package mylibrary.dao;

import mylibrary.model.BorBk;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface BorBkMapper {

    public boolean addBorBook(BorBk borBk);

    public List<BorBk> findAllBorBk(Long userId);

    public List<BorBk> findBkNotReturn(Long userId, String isReturnBk);

    public int updateBorBk(Long borId, String shouldReturn, Integer renew);

    public int updateBorBk2(Long borId, String returnTime, String isReturn);

    public List findNotReturnOnTime(Long userId, String nowTime);
}
