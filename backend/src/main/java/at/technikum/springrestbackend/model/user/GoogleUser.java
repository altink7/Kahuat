package at.technikum.springrestbackend.model.user;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Getter
@Setter
@ToString
@Entity
@DiscriminatorValue("GOOGLE_USER")
@EntityListeners(AuditingEntityListener.class)
public class GoogleUser extends User {
    // google user
}
