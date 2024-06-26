package at.technikum.springrestbackend.model;

import at.technikum.springrestbackend.model.user.User;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.proxy.HibernateProxy;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity(name = "quiz")
@JsonIgnoreProperties({"userStatistic"})
public class Quiz implements Serializable {

    @Id
    @GeneratedValue(generator = "custom-id", strategy = GenerationType.AUTO)
    @GenericGenerator(name = "custom-id", strategy = "at.technikum.springrestbackend.model.generator.QuizIdGenerator")
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "title")
    private String title;

    @ManyToOne
    @JoinColumn(name = "creator_id")
    private User creator;

    @OneToMany(mappedBy = "quiz")
    private List<Participant> participants;


    @Column(name = "kategorie")
    private Category kategorie;

    @OneToMany(mappedBy = "quiz", cascade = CascadeType.REMOVE)
    @ToString.Exclude
    private List<Question> questions;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "duration")
    private int duration;

    @ManyToOne
    @JoinColumn(name = "user_statistic_id")
    private UserStatistic userStatistic;

    @CreationTimestamp
    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ? ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        Quiz quiz = (Quiz) o;
        return getId() != null && Objects.equals(getId(), quiz.getId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() : getClass().hashCode();
    }
}
