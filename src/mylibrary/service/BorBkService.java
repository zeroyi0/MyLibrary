package mylibrary.service;

import java.util.List;

public interface BorBkService {

    public List findAllBorBk(Long userId);

    public int borrowBkById(Long bookId, Long userId);

    public List borBkAgain(Long userId);

    public boolean borAgain(Long borId, Integer renew);

    public boolean returnBk(Long borId);

    public List notReturnOnTime(Long userId);
}
