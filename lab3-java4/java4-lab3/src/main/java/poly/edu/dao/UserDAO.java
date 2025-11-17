package poly.edu.dao;

import java.util.List;

import poly.edu.model.User;

public interface UserDAO {
	User findById(String id);

	List<User> findAll();

	User create(User entity);

	void update(User entity);

	User deleteById(String id);

	User findByIdOrEmail(String uidOrEmail);
}