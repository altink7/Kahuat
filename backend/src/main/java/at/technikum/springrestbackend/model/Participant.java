package at.technikum.springrestbackend.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Getter
@Setter
@ToString
@Entity(name = "participant")
@EntityListeners(AuditingEntityListener.class)
public class Participant extends AbstractEntity {

    @ManyToOne
    @JoinColumn(name = "quiz_id")
    @ToString.Exclude
    private Quiz quiz;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "nickname")
    private String nickname;

    @Column(name = "points")
    private int points;

    @Column(name = "quizDuration")
    private double participantQuizDuration;

    public Participant() {
    }

    public Participant(Participant participant) {
        this.quiz = participant.quiz;
        this.userId = participant.userId;
        this.nickname = participant.nickname;
        this.points = participant.points;
        this.participantQuizDuration = participant.participantQuizDuration;
    }
}
