package mylibrary.dao;

import mylibrary.model.Book;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    public Book findBookById(Long bookId);

    public List findAllBook();
}
