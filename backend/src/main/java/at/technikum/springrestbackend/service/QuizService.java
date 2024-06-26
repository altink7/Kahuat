package at.technikum.springrestbackend.service;

import at.technikum.springrestbackend.dto.ParticipantDTO;
import at.technikum.springrestbackend.dto.QuizDTO;
import at.technikum.springrestbackend.model.Category;
import at.technikum.springrestbackend.model.Participant;
import at.technikum.springrestbackend.model.Question;
import at.technikum.springrestbackend.model.Quiz;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public interface QuizService {

    /**
     * Get a quiz by id
     *
     * @param id the quiz id
     * @return the quiz
     */
    Quiz getQuizById(String id);

    /**
     * Get all quizzes matching the category
     *
     * @param category the category
     * @return the list of Quizzes with the Category
     */
    List<Quiz> getQuizzesByCategory(Category category);

    /**
     * Create a new quiz
     *
     * @param quiz quiz
     * @return the created quiz
     */
    Quiz createQuiz(Quiz quiz);

    /**
     * Get all quizzes
     *
     * @return the list of quizzes
     */
    List<Quiz> getAllQuizzes();

    /**
     * Get all questions by quiz id
     *
     * @param id the quiz id
     * @return the list of questions
     */
    List<Question> getAllQuestionsByQuizId(String id);

    /**
     * Update the quiz by id and add Participant to the quiz
     */
    Quiz addParticipantToQuiz(String id, Participant participant);

    /**
     * Delete a quiz by id
     *
     * @param id the quiz id
     * @return true if the quiz was deleted, false otherwise
     */
    boolean deleteQuiz(String id);

    /**
     * Sort the participants by their score and time
     */
    List<ParticipantDTO> sortParticipantsByScoreAndTime(List<ParticipantDTO> participants);

    /**
     * Randomize order of questions and answers
     */
    QuizDTO randomizeQuiz(QuizDTO quizDTO);

    /**
     * Get all quizzes by creator
     * @param email the email of the creator
     * @return the list of quizzes
     */
    List<Quiz> getAllQuizzesByCreator(String email);

    /**
     *  Update the quiz start date and duration
     * @param id the quiz id
     * @param parse the start date
     * @param duration the duration
     * @return the updated quiz
     */
    Quiz updateQuizStartDateAndDuration(String id, LocalDate parse, int duration);

    /**
     * Get the image of a question
     * @param questionId the question id
     * @return the image
     */
    byte[] getQuestionImage(Long questionId);

}
