package at.technikum.springrestbackend.dto;

import at.technikum.springrestbackend.model.Category;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
@JsonIgnoreProperties({"userStatistic"})
public class QuizDTO {

    private String id;

    private UserDTO creatorId;

    private Category kategorie;

    @NotNull(message = "A quiz needs questions!")
    private List<QuestionDTO> questions;

    private LocalDate startDate;

    @Max(365)
    @Positive
    private int duration;

    private String title;

}