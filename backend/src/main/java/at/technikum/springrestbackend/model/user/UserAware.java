package at.technikum.springrestbackend.model.user;

import java.io.Serializable;

/**
 * Interface for user aware entities.
 *
 */
public interface UserAware extends Serializable {
    Long getUserId();

    void setUserId(Long userId);

    String getEmail();

    void setEmail(String email);
}
