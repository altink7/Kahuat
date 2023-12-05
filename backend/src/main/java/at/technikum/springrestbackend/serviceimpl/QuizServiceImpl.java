package at.technikum.springrestbackend.serviceimpl;

import at.technikum.springrestbackend.dto.AnswerOptionDTO;
import at.technikum.springrestbackend.dto.ParticipantDTO;
import at.technikum.springrestbackend.dto.QuestionDTO;
import at.technikum.springrestbackend.dto.QuizDTO;
import at.technikum.springrestbackend.exceptions.QuestionNotFoundException;
import at.technikum.springrestbackend.exceptions.QuizNotFoundException;
import at.technikum.springrestbackend.model.*;
import at.technikum.springrestbackend.model.user.User;
import at.technikum.springrestbackend.repository.*;
import at.technikum.springrestbackend.service.QuizService;
import jakarta.transaction.Transactional;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * Implementation of the QuizService interface
 */
@Log4j2
@Service
public class QuizServiceImpl implements QuizService {
    private final UserStatisticDao userStatisticDao;
    private final ParticipantDao participantDao;
    private final QuizDao quizDao;
    private final QuestionDao questionDao;
    private final AnswerOptionDao answerOptionDao;
    private final AnswerDao answerDao;
    private final AppUserDao appUserDao;
    private final UserDao userDao;

    @Autowired
    public QuizServiceImpl(QuizDao quizDao, QuestionDao questionDao, AnswerOptionDao answerOptionDao, AnswerDao answerDao, AppUserDao appUserDao,
                           ParticipantDao participantDao,
                           UserStatisticDao userStatisticDao, UserDao userDao) {
        this.quizDao = quizDao;
        this.questionDao = questionDao;
        this.answerOptionDao = answerOptionDao;
        this.answerDao = answerDao;
        this.appUserDao = appUserDao;
        this.participantDao = participantDao;
        this.userStatisticDao = userStatisticDao;
        this.userDao = userDao;
    }


    @Override
    public Quiz getQuizById(String id) {
        return quizDao.findById(id).orElseThrow(QuestionNotFoundException::new);
    }

    @Override
    public List<Quiz> getQuizzesByCategory(Category category) {
        return quizDao.findByKategorie(category).orElseThrow(QuizNotFoundException::new);
    }

    @Override
    @Transactional
    public Quiz createQuiz(Quiz quiz) {
        log.info("Creating quiz: " + quiz);
        String creatorEmail = quiz.getCreator().getEmail();

        User creator = userDao.findByEmail(creatorEmail).orElseGet(() -> {
            User newUser = new User();
            newUser.setEmail(creatorEmail);
            return userDao.save(newUser);
        });

        Quiz persistedQuiz = quizDao.save(quiz);

        persistedQuiz.setCreator(creator);
        quiz.getQuestions().forEach(question -> {
            question.setQuiz(quiz);
            questionDao.save(question);

            question.getAnswerOptions().forEach(answerOption -> {
                Answer answer = answerOption.getAnswer();
                answerDao.save(answer);
                answerOption.setQuestion(question);
                answerOptionDao.save(answerOption);
            });
        });
        return persistedQuiz;
    }

    @Override
    public List<Quiz> getAllQuizzes() {
        return quizDao.findAll();
    }

    @Override
    public List<Question> getAllQuestionsByQuizId(String id) {
        return quizDao.findById(id).orElseThrow(QuizNotFoundException::new).getQuestions();
    }

    @Override
    public Quiz addParticipantToQuiz(String id, Participant participant) {
        Quiz quiz = quizDao.findById(id).orElseThrow(QuizNotFoundException::new);
        //Wenn Participant registriert ist, dann wird er in die Statistik aufgenommen
        if(participant.getUserId() !=  null) {
            User user = userDao.findById(participant.getUserId()).orElseThrow();
            UserStatistic userStatistic;
            if(userStatisticDao.findByUserId(user.getUserId()).isEmpty()){
                userStatistic = new UserStatistic();
                userStatistic.setUserId(user.getUserId());
            } else {
                userStatistic = userStatisticDao.findByUserId(user.getUserId()).orElseThrow();
            }

            userStatistic.getQuizList().add(quiz);

            userStatistic.setPoints(userStatistic.getPoints() + participant.getPoints());

            userStatisticDao.save(userStatistic);
        }

        if(quiz.getParticipants().contains(participant)){
            return quiz;
        }

        participant.setQuiz(quiz);
        participantDao.save(participant);
        quiz.getParticipants().add(participant);
        return quizDao.save(quiz);
    }

    @Override
    public boolean deleteQuiz(String id) {
        return quizDao.findById(id).map(this::deleteQuiz).orElse(false);
    }

    @Override
    public List<ParticipantDTO> sortParticipantsByScoreAndTime(List<ParticipantDTO> participants) {
        participants.sort((o1, o2) -> {
            if (o1.getPoints() == o2.getPoints()) {
                return Double.compare(o1.getParticipantQuizDuration(), o2.getParticipantQuizDuration());
            } else {
                return Integer.compare(o2.getPoints(), o1.getPoints());
            }
        });

        return participants;
    }

    @Override
    public QuizDTO randomizeQuiz(QuizDTO quizDTO) {
        List<QuestionDTO> questions = quizDTO.getQuestions();

        if(questions == null || questions.isEmpty()) {
            return quizDTO;
        }

        Collections.shuffle(questions);

        questions.forEach(question -> {
            List<AnswerOptionDTO> answerOptions = question.getAnswerOptions();
            Collections.shuffle(answerOptions);
            question.setAnswerOptions(answerOptions);
        });

        quizDTO.setQuestions(questions);

        return quizDTO;
    }

    /**
     * Delete a quiz
     *
     * @param quiz the quiz
     * @return true if deleted
     */
    private boolean deleteQuiz(Quiz quiz) {
        quizDao.delete(quiz);
        return true;
    }
}
