package mylibrary.service.Impl;

import mylibrary.common.RegisterStatus;
import mylibrary.dao.UserMapper;
import mylibrary.model.User;
import mylibrary.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int  addUser(User user) {
        // 用户已存在
        if (userMapper.findUserByName(user.getUserName()) != null) {
            return RegisterStatus.USER_HAS_EXIST;
        }
        // 添加成功
        if (userMapper.addUser(user)) {
            return RegisterStatus.SUCCESS;
        }
        return RegisterStatus.FAIL;
    }
}
