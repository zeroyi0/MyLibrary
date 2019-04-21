package mylibrary.model;

import mylibrary.annotation.Table;
import mylibrary.annotation.TableField;

@Table("BookUser")
public class User {
    @TableField("u_id")
    private Long userId;
    @TableField("u_name")
    private String userName;
    @TableField("u_pwd")
    private String passWord;
    @TableField("u_identity")
    private String identity;
    @TableField("u_mailBox")
    private String email;

    public User() {}

    public User(Long userId, String userName, String passWord, String identity, String email) {
        this.userId = userId;
        this.userName = userName;
        this.passWord = passWord;
        this.identity = identity;
        this.email = email;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
