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

    private String userSex;

    private String registerTime;

    public User() {}

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

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(String registerTime) {
        this.registerTime = registerTime;
    }
}
