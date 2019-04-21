package mylibrary.model;

import mylibrary.annotation.Table;

@Table("Book")
public class Book {
    // 条形码
    // 13
    private Long bookId;

    private String bookName;

    private String author;
    // 出版社
    private String publisher;

    private Double bookPrice;
    // 分类
    private String classify;
    // 书架
    private String bookShelf;

    private Long bookISBN;

    private String bookStatus;
    // 入库时间
    private String enterLibTime;

    public Book() {}

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(Double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public String getClassify() {
        return classify;
    }

    public void setClassify(String classify) {
        this.classify = classify;
    }

    public String getBookShelf() {
        return bookShelf;
    }

    public void setBookShelf(String bookShelf) {
        this.bookShelf = bookShelf;
    }

    public Long getBookISBN() {
        return bookISBN;
    }

    public void setBookISBN(Long bookISBN) {
        this.bookISBN = bookISBN;
    }

    public String getBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(String bookStatus) {
        this.bookStatus = bookStatus;
    }

    public String getEnterLibTime() {
        return enterLibTime;
    }

    public void setEnterLibTime(String enterLibTime) {
        this.enterLibTime = enterLibTime;
    }
}
