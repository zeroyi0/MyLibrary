package mylibrary.dao;

import mylibrary.model.Book;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    public boolean addBook(Book book);

    public boolean deleteBook(Long bookId);

    public boolean updateBk(Book book);
    // 查
    public Book findBookById(Long bookId);

    public Integer getPageNum();

    public List<Book> findAllBook(Integer index);
    // 搜索书
    public List<Book> findSomeBook(@Param("condition") String condition, @Param("content") String content);

}
