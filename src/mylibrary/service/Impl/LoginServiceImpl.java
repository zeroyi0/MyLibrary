package mylibrary.service.Impl;

import mylibrary.common.LoginStatus;
import mylibrary.dao.UserMapper;
import mylibrary.model.User;
import mylibrary.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private UserMapper userMapper;

//    private LoginMapper loginMapper = MybatisUtils.getMapper(LoginMapper.class);

    @Override
    public boolean findByUserName(String userName) {
        User user = userMapper.findUserByName(userName);
        if (user != null) {
            return true;
        }
        return false;
    }

    @Override
    public boolean findByUserName(String userName, String email) {
        User user = findUserByName(userName);
        if (email.equals(user.getEmail())) {
            return true;
        }
        return false;
    }

    @Override
    public User findUserByName(String userName) {
        return userMapper.findUserByName(userName);
    }

    @Override
    public boolean findByUserId(Long userId) {
        User user = userMapper.findByUserId(userId);
        if (user != null) {
            return true;
        }
        return false;
    }

    @Override
    public List findAllUser() {
        List list = userMapper.findAllUsers();
        if (list != null) {
            return list;
        }
        return null;
    }

    @Override
    public int check(User user) {
        User dbUser = userMapper.findUserByName(user.getUserName());
        if (dbUser == null) {
            return LoginStatus.USER_NOT_EXIST;
        }
        if (!dbUser.getPassWord().equals(user.getPassWord())) {
            return LoginStatus.PASSWORD_WRONG;
        }
        return LoginStatus.SUCCESS;
    }

    @Override
    public List findAllAdmin() {
        return userMapper.findAllAdmin("管理员");
    }
}
