package at.technikum.springrestbackend.serviceimpl;

import at.technikum.springrestbackend.exceptions.UserNotFoundException;
import at.technikum.springrestbackend.model.user.GoogleUser;
import at.technikum.springrestbackend.model.user.User;
import at.technikum.springrestbackend.model.user.AppUser;
import at.technikum.springrestbackend.model.user.UserAware;
import at.technikum.springrestbackend.repository.GoogleUserDao;
import at.technikum.springrestbackend.repository.UserDao;
import at.technikum.springrestbackend.repository.AppUserDao;
import at.technikum.springrestbackend.service.UserService;
import at.technikum.springrestbackend.validator.annotation.ValidateWith;
import at.technikum.springrestbackend.validator.modelvalidator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Implementation of the UserService interface
 */
@Service
public class UserServiceImpl implements UserService {
    private final AppUserDao appUserDao;

    private final GoogleUserDao googleUserDao;
    private final UserDao userDao;

    @Autowired
    public UserServiceImpl(AppUserDao appUserDao, GoogleUserDao googleUserDao,
                           UserDao userDao) {
        this.appUserDao = appUserDao;
        this.googleUserDao = googleUserDao;
        this.userDao = userDao;
    }

    @Override
    public List<AppUser> getAllUsers() {
        return appUserDao.findAll();
    }

    @Override
    public AppUser getUserById(Long userId) {
        return appUserDao.findById(userId).orElseThrow(UserNotFoundException::new);
    }

    @Override
    public User getUserByEmail(String email) {
        return userDao.findByEmail(email).orElseThrow(UserNotFoundException::new);
    }

    @Override
    public boolean deleteUser(Long userId) {
        return appUserDao.findById(userId).map(user -> {
            appUserDao.delete(user);
            return true;
        }).orElse(false);
    }

    @ValidateWith(UserValidator.class)
    public AppUser createUser(AppUser appUser) {
        return appUserDao.save(appUser);
    }

    @Override
    public AppUser updateUser(Long userId, AppUser appUser) {
        return appUserDao.findById(userId).map(u -> {
            u.setFirstName(appUser.getFirstName());
            u.setLastName(appUser.getLastName());
            u.setEmail(appUser.getEmail());
            u.setPassword(appUser.getPassword());
            return appUserDao.save(u);
        }).orElseThrow(UserNotFoundException::new);
    }

    @Override
    public UserAware createGoogleUser(GoogleUser user) {
        return this.googleUserDao.save(user);
    }

    @Override
    public UserAware getGoogleUserByEmail(String email) {
        return this.googleUserDao.findByEmail(email).orElseThrow(UserNotFoundException::new);
    }
}
