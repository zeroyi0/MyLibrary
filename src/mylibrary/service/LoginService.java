package mylibrary.service;

import mylibrary.model.User;

import java.util.List;

public interface LoginService {

    public boolean findByUserName(String userName);
    public boolean findByUserName(String userName, String email);
    public User findUserByName(String userName);

    public boolean findByUserId(Long userId);

    public List findAllUser();

    public int check(User user);

    public List findAllAdmin();
}
