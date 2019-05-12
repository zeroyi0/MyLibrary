package mylibrary.service.Impl;

import mylibrary.common.LibraryStatus;
import mylibrary.dao.BookMapper;
import mylibrary.model.Book;
import mylibrary.service.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class LibraryServiceImpl implements LibraryService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public Book findBkById(Long bookId) {
        Book book = bookMapper.findBookById(bookId);
        return book;
    }

    @Override
    public int getPageNum() {
        int num = bookMapper.getPageNum();
        int pageNum = num / 15 ;
        if (num % 15 > 0) {
            pageNum++;
        }
        return pageNum;
    }

    @Override
    public List quaryAllBook(Integer index) {
        index = 0 + index * 15;
        List list = bookMapper.findAllBook(index);
        if (list.size() > 0) {
            return list;
        }
        return null;
    }

    @Override
    public List searchBook(String condition, String content) {
        content = "%" + content + "%";
        List list = bookMapper.findSomeBook(condition, content);
        if (list.size() > 0) { //这里可以不用判断，直接返回
            return list;
        }
        return null;
    }

    @Override
    public boolean deleteBk(Long bookId) {
        return bookMapper.deleteBook(bookId);
    }

    @Override
    public boolean changeBk(Book book) {
        return bookMapper.updateBk(book);
    }

    @Override
    public int addNewBk(Book book) {
        // 图书ID已存在
        if (bookMapper.findBookById(book.getBookId()) != null) {
            return LibraryStatus.BOOKID_HAS_EXIST;
        }
        Date date = new Date();
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String enterLibTime = df.format(date);
        book.setEnterLibTime(enterLibTime);
        if (bookMapper.addBook(book)) {
            return LibraryStatus.BORROW_SUCCESS;
        }
        return LibraryStatus.BORROW_ERROR;
    }
}
