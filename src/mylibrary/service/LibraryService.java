package mylibrary.service;

import mylibrary.model.Book;

import java.util.List;

public interface LibraryService {

    public Book findBkById(Long bookId);

    public int getPageNum();

    public List quaryAllBook(Integer index);

    public List searchBook(String condition, String content);

    public boolean deleteBk(Long bookId);
}
