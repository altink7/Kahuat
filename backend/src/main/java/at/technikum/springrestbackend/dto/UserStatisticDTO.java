package at.technikum.springrestbackend.dto;

import at.technikum.springrestbackend.model.Category;
import at.technikum.springrestbackend.model.Quiz;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.Map;

@Data
@JsonIgnoreProperties({"bestRatedQuiz"})
public class UserStatisticDTO {
    private Long id;
    private Long userId;
    private int points;
    private int playedQuizzes;
    private double averagePointsPerQuiz;
    private double averagePointsPerQuestion;
    private Category favoriteCategory;
    private Map<Category, Integer> pointsPerCategory;
    private Map<Category, Double> averagePointsPerCategory;
    private Category mostPlayedCategory;
    private Quiz bestRatedQuiz;
}
