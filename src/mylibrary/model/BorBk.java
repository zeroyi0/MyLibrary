package mylibrary.model;

public class BorBk {

    private Long borId;

    private String borrowTime;

    private User user;

    private Book book;

    private String isReturnBk;

    private String shouldReturn;

    private String returnTime;
    // 续借次数
    private Integer renew;
    // 逾期未归还
    private String notReturnOnTime;

    public BorBk() {}

    public Long getBorId() {
        return borId;
    }

    public void setBorId(Long borId) {
        this.borId = borId;
    }

    public String getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getIsReturnBk() {
        return isReturnBk;
    }

    public void setIsReturnBk(String isReturnBk) {
        this.isReturnBk = isReturnBk;
    }

    public String getShouldReturn() {
        return shouldReturn;
    }

    public void setShouldReturn(String shouldReturn) {
        this.shouldReturn = shouldReturn;
    }

    public String getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(String returnTime) {
        this.returnTime = returnTime;
    }

    public Integer getRenew() {
        return renew;
    }

    public void setRenew(Integer renew) {
        this.renew = renew;
    }

    public String getNotReturnOnTime() {
        return notReturnOnTime;
    }

    public void setNotReturnOnTime(String notReturnOnTime) {
        this.notReturnOnTime = notReturnOnTime;
    }
}
