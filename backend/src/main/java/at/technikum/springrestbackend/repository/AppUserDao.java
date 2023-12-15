package at.technikum.springrestbackend.repository;

import at.technikum.springrestbackend.model.user.AppUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface AppUserDao extends JpaRepository<AppUser, Long> {
    Optional<AppUser> findByEmail(String email);
}
