package mylibrary.dao;

import mylibrary.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

// 仓库 存放东西的地方
@Repository
public interface UserMapper {
    // 增删改
    public boolean addUser(User user);

    public int updateIdentity(Long userId, String identity);
    // 查询
    public User findUserByName(@Param("userName") String userName);

    public User findByUserId(Long userId);

    public List<User> findAllUsers();

    public List<User> findAllAdmin(@Param("identity") String identity);
}
