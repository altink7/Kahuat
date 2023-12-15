package at.technikum.springrestbackend.service;

import at.technikum.springrestbackend.model.user.AppUser;
import at.technikum.springrestbackend.model.user.GoogleUser;
import at.technikum.springrestbackend.model.user.User;
import at.technikum.springrestbackend.model.user.UserAware;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    /**
     * Get all users
     *
     * @return the list of users
     */
    List<AppUser> getAllUsers();

    /**
     * Get a user by id
     *
     * @param userId the user id
     * @return the user
     */
    AppUser getUserById(Long userId);

    /**
     * Get a user by email
     *
     * @param email the email
     * @return the user
     */
    User getUserByEmail(String email);

    /**
     * Delete a user by id
     *
     * @param userId the user id
     * @return true if the user was deleted, false otherwise
     */
    boolean deleteUser(Long userId);

    /**
     * Create a new user
     *
     * @param appUser the user
     * @return the created user
     */
    AppUser createUser(AppUser appUser);

    /**
     * Update a user
     *
     * @param userId the user id
     * @param appUser   the user
     * @return the updated user
     */
    AppUser updateUser(Long userId, AppUser appUser);

    /**
     * Create a new user aware
     */
    UserAware createGoogleUser(GoogleUser user);

    /**
     * Get a user aware by email
     */
    UserAware getGoogleUserByEmail(String email);

}
