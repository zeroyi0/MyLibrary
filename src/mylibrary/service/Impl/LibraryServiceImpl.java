package mylibrary.service.Impl;

import mylibrary.common.LibraryStatus;
import mylibrary.dao.BookMapper;
import mylibrary.dao.BorBkMapper;
import mylibrary.model.Book;
import mylibrary.model.BorBk;
import mylibrary.model.User;
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
}
