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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

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
    private List<Quiz> quizList;


    @Column(name = "points")
    private int points;

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

    public List<Quiz> getQuizList() {
        if (quizList == null) {
            return new ArrayList<>();
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
}
