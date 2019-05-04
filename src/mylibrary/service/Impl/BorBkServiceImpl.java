package mylibrary.service.Impl;

import mylibrary.common.LibraryStatus;
import mylibrary.dao.BorBkMapper;
import mylibrary.model.Book;
import mylibrary.model.BorBk;
import mylibrary.model.User;
import mylibrary.service.BorBkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
@Service
public class BorBkServiceImpl implements BorBkService {

    @Autowired
    private BorBkMapper borBkMapper;

    // nowTime
    private String nowTime() {
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime = df.format(date);
        return nowTime;
    }

    @Override
    public List findAllBorBk(Long userId) {
        return borBkMapper.findAllBorBk(userId);
    }
    // 借书
    @Override
    public int borrowBkById(Long bookId, Long userId) {
        BorBk borBk = new BorBk();
        // time
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Calendar cal = Calendar.getInstance(); //nowTime
        cal.add(Calendar.DATE, 30);
        Date dateSR = cal.getTime();
        String borrowTime = nowTime();
        String shouldReturn = df.format(dateSR);
        // 填内容
        borBk.setBorrowTime(borrowTime);
        User user = new User();
        user.setUserId(userId);
        borBk.setUser(user);
        Book book = new Book();
        book.setBookId(bookId);
        borBk.setBook(book);
        borBk.setIsReturnBk("未归还");
        borBk.setShouldReturn(shouldReturn);
        if (borBkMapper.addBorBook(borBk)) {
            return LibraryStatus.BORROW_SUCCESS;
        }
        return LibraryStatus.BORROW_ERROR;
    }

    @Override
    public List borBkAgain(Long userId) {
        // 查找所有未归还的书
        List list = borBkMapper.findBkNotReturn(userId, "未归还");
        return list;
    }

    @Override
    public boolean borAgain(Long borId, Integer renew) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 30);
        Date date = cal.getTime();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String shouldReturn = df.format(date);
        int row = borBkMapper.updateBorBk(borId, shouldReturn, renew);
        if (row == 1) {
            return true;
        }
        return false;
    }

    @Override
    public boolean returnBk(Long borId) {
        String returnTime = nowTime();
        int row = borBkMapper.updateBorBk2(borId, returnTime, "已归还");
        if (row == 1) {
            return true;
        }
        return false;
    }

    @Override
    public List notReturnOnTime(Long userId) {
        String nowTime = nowTime();
        return borBkMapper.findNotReturnOnTime(userId, nowTime);
    }
}
