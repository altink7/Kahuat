package at.technikum.springrestbackend.model.user;

import at.technikum.springrestbackend.model.AbstractEntity;
import jakarta.persistence.*;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity(name = "user")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "user_type", discriminatorType = DiscriminatorType.STRING)
@EntityListeners(AuditingEntityListener.class)
public class User extends AbstractEntity implements UserAware {
    @Column(name = "email", unique = true)
    private String email;

    @Override
    public Long getUserId() {
        return this.getId();
    }

    @Override
    public void setUserId(Long userId) {
        this.setId(userId);
    }

    @Override
    public String getEmail() {
        return this.email;
    }

    @Override
    public void setEmail(String email) {
        this.email = email;
    }
}
