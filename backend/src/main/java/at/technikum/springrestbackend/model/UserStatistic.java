package at.technikum.springrestbackend.model;

import at.technikum.springrestbackend.model.calculator.UserStatisticsCalculator;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.proxy.HibernateProxy;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.io.Serializable;
import java.util.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity(name = "user_statistic")
@EntityListeners(AuditingEntityListener.class)
public class UserStatistic extends AbstractEntity implements Serializable {

    @Column(name = "user_id", nullable = false)
    private Long userId;

    @ManyToMany
    @ToString.Exclude
    private Set<Quiz> quizList;

    @Transient
    private int playedQuizzes;

    @Transient
    private double averagePointsPerQuiz;

    @Transient
    private double averagePointsPerQuestion;

    @Transient
    private Category favoriteCategory;

    @Transient
    private Map<Category, Integer> pointsPerCategory;

    @Transient
    private Map<Category, Double> averagePointsPerCategory;

    @Transient
    private Category mostPlayedCategory;

    @Transient
    private Quiz bestRatedQuiz;

    public void calculateTransientFields() {
        UserStatisticsCalculator.calculate(this);
    }

    public Set<Quiz> getQuizList() {
        if (quizList == null) {
            return new HashSet<>();
        }
        return quizList;
    }

    @Override
    public final boolean equals(Object o) {
        if (this == o) return true;
        if (o == null) return false;
        Class<?> oEffectiveClass = o instanceof HibernateProxy ? ((HibernateProxy) o).getHibernateLazyInitializer().getPersistentClass() : o.getClass();
        Class<?> thisEffectiveClass = this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass() : this.getClass();
        if (thisEffectiveClass != oEffectiveClass) return false;
        UserStatistic that = (UserStatistic) o;
        return getId() != null && Objects.equals(getId(), that.getId());
    }

    @Override
    public final int hashCode() {
        return this instanceof HibernateProxy ? ((HibernateProxy) this).getHibernateLazyInitializer().getPersistentClass().hashCode() : getClass().hashCode();
    }

    public Double getPoints() {
        return getQuizList().stream().mapToDouble(quiz -> quiz.getParticipants().stream()
                .filter(participant -> participant.getUserId() != null)
                .filter(participant -> participant.getUserId().equals(userId))
                .mapToDouble(Participant::getPoints)
                .sum()).sum();
    }
}
