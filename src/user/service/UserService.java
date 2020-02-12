package user.service;

import user.dao.UserDao;
import user.dto.UserDto;
import user.exception.EmailAlreadyExists;

public class UserService {
	private UserDao userDao;

	public UserService() {
		userDao = new UserDao();
	}

	public UserDto findUserByNameAndPassword(String userName, String password) {
		return userDao.findByUserNameAndPassword(userName, password);
	}

	public boolean create(String email, String password) {
		boolean isCreated =false;
		if (!userDao.isEmailAlreadyExists(email)) {
			isCreated = userDao.create(email, password);
		} else {
			throw new EmailAlreadyExists("Email Already exists");
		}
		return isCreated;
	}
}
