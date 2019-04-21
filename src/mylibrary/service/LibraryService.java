package mylibrary.service;

import mylibrary.model.Book;

import java.util.List;

public interface LibraryService {

    public int borrowBkById(Long bookId);

    public Book findBkById(Long bookId);

    public List quaryAllBook();
}
