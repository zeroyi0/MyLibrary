package mylibrary.service.Impl;

import mylibrary.common.LibraryStatus;
import mylibrary.dao.BookMapper;
import mylibrary.model.Book;
import mylibrary.service.LibraryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LibraryServiceImpl implements LibraryService {
    @Autowired
    private BookMapper bookMapper;

    @Override
    public int borrowBkById(Long bookId) {
        Book book = bookMapper.findBookById(bookId);
        if (book != null) {
            return LibraryStatus.BORROW_SUCCESS;
        }
        return LibraryStatus.BORROW_ERROR;
    }

    @Override
    public Book findBkById(Long bookId) {
        return null;
    }

    @Override
    public List quaryAllBook() {
        List list = bookMapper.findAllBook();
        if (list.size() > 0) {
            return list;
        }
        return null;
    }
}
