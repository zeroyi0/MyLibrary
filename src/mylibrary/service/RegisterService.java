package mylibrary.service;

import mylibrary.model.User;

public interface RegisterService {

    public int addUser(User user);

    public boolean chgIdentity(Long userId, String identity);
}
