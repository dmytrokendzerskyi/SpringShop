package ua.com.shop.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ua.com.shop.dao.UserDao;
import ua.com.shop.entity.User;

@Component("userValidator")
public class UserValidator  implements Validator{

	
	@Autowired
	private UserDao userDao;
	
	
	public void validate(Object object) throws Exception{
		User user =  (User)object ;
		
		if(user.getEmail().isEmpty()){
			throw new UserValidationException(UserValidationMassages.EMPTY_EMAIL_FIELD);
		}
		if(userDao.findByEmail(user.getEmail())!=null){
			throw new UserValidationException(UserValidationMassages.EMAIL_ALREADY_EXIST);
		}
		if(user.getPassword().isEmpty()){
			throw new UserValidationException(UserValidationMassages.EMPTY_PASSWORD_FIELD);
		}
		if(user.getName().isEmpty()){
			throw new UserValidationException(UserValidationMassages.EMPTY_NAME_FIELD);
		}
		if(user.getSurname().isEmpty()){
			throw new UserValidationException(UserValidationMassages.EMPTY_SURNAME_FIELD);
		}
		/*if(userDao.findByEmail(user.getEmail()) == null){
			throw new UserValidationException(UserValidationMassages.THIS_EMAIL_IS_NOT_FOUND);
		}*/
	}
	
}
