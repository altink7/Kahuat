package at.technikum.springrestbackend.repository;

import at.technikum.springrestbackend.model.user.GoogleUser;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface GoogleUserDao extends JpaRepository<GoogleUser, Long> {
    Optional<GoogleUser> findByEmail(String email);
}
