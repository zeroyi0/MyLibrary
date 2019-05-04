package mylibrary.dao;

import mylibrary.model.Book;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookMapper {

    // 增删改

    // 查
    public Book findBookById(Long bookId);

    public Integer getPageNum();

    public List<Book> findAllBook(Integer index);
    // 搜索书
    public List<Book> findSomeBook(@Param("condition") String condition, @Param("content") String content);

    public boolean deleteBook(Long bookId);
}
