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

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Objects;

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
            if(question.getFile() != null) {
                saveFile(question.getFile(), question.getId().toString());
            }

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
        checkIfUserLoggedIn(participant, quiz);

        Quiz quizForNewUser = checkIfUserExists(participant, quiz);
        if (quizForNewUser != null){
            return quizForNewUser;
        }

        Quiz quizUserAlreadyHasPlayed = checkIfUserAlreadyPlayed(participant, quiz);
        return Objects.requireNonNullElseGet(quizUserAlreadyHasPlayed, () -> saveSimpleQuiz(participant, quiz));
    }

    private Quiz saveSimpleQuiz(Participant participant, Quiz quiz) {
        participant.setQuiz(quiz);
        participantDao.save(participant);
        quiz.getParticipants().add(participant);
        return quizDao.save(quiz);
    }

    private Quiz checkIfUserAlreadyPlayed(Participant participant, Quiz quiz) {
        if(quiz.getParticipants().stream()
                        .filter(p -> p.getUserId() != null)
                        .anyMatch(p -> p.getUserId().equals(participant.getUserId()))){
            participant.setQuiz(quiz);
            participantDao.save(participant);

            if(participant.getUserId() != null){
                UserStatistic userStatistic = userStatisticDao.findByUserId(participant.getUserId()).orElseThrow();
                userStatistic.getQuizList().add(quiz);
                userStatisticDao.save(userStatistic);
            }
            return quiz;
        }
        return null;
    }

    private Quiz checkIfUserExists(Participant participant, Quiz quiz) {
        if (!isParticipantExists(participant, quiz)) {
            Participant newParticipant = new Participant(participant);
            newParticipant.setQuiz(quiz);
            participantDao.save(newParticipant);
            quiz.getParticipants().add(newParticipant);

            if(newParticipant.getUserId() != null){
                UserStatistic userStatistic = userStatisticDao.findByUserId(newParticipant.getUserId()).orElseThrow();
                userStatistic.getQuizList().add(quiz);
                userStatisticDao.save(userStatistic);
            }
            return quizDao.save(quiz);
        }
        return null;
    }

    private void checkIfUserLoggedIn(Participant participant, Quiz quiz) {
        //Wenn Participant registriert ist, dann wird er in die Statistik aufgenommen
        if(participant.getUserId() !=  null) {
            User user = userDao.findById(participant.getUserId()).orElseThrow();
            UserStatistic userStatistic;
            if(userStatisticDao.findByUserId(user.getUserId()).isEmpty()){
                userStatistic = new UserStatistic();
                userStatistic.setUserId(user.getUserId());
                userStatistic.getQuizList().add(quiz);
            } else {
                userStatistic = userStatisticDao.findByUserId(user.getUserId()).orElseThrow();
            }
            userStatisticDao.save(userStatistic);
        }
    }

    private static boolean isParticipantExists(Participant participant, Quiz quiz) {
        return quiz.getParticipants().stream()
                .anyMatch(p -> p.getUserId() != null && p.getUserId().equals(participant.getUserId()));
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

    @Override
    public List<Quiz> getAllQuizzesByCreator(String email) {
        long userId = appUserDao.findByEmail(email).orElseThrow().getUserId();
        return quizDao.findByCreatorId(userId).orElseThrow(QuizNotFoundException::new);
    }

    @Override
    public Quiz updateQuizStartDateAndDuration(String id, LocalDate parse, int duration) {
        Quiz quiz = quizDao.findById(id).orElseThrow(QuizNotFoundException::new);
        quiz.setStartDate(parse);
        quiz.setDuration(duration);
        return quizDao.save(quiz);
    }

    @Override
    public byte[] getQuestionImage(Long questionId) {
        String fileName = "Question" + questionId + "_background.png";
        String projectDirectory = System.getProperty("user.dir");
        String directoryPath = projectDirectory + "/src/main/resources/static/images";
        Path fileDirectoryPath = Paths.get(directoryPath, fileName);

        log.info("File Path: " + fileDirectoryPath.toAbsolutePath());

        if(!Files.exists(fileDirectoryPath)) {
            return null;
        }

        try {
            return Files.readAllBytes(fileDirectoryPath);
        } catch (IOException e) {
            throw new RuntimeException("Error reading image file", e);
        }
    }

    private void saveFile(byte[] fileBytes, String name) {
        String fileName = "Question" + name + "_background.png";
        String projectDirectory = System.getProperty("user.dir");
        String directoryPath = projectDirectory + "/src/main/resources/static/images";
        Path fileDirectoryPath = Paths.get(directoryPath, fileName);
        String filePath = fileDirectoryPath.toString();

        try {
            Files.createDirectories(Paths.get(directoryPath));
            Files.write(Paths.get(filePath), fileBytes);
            log.info("File saved: " + filePath);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        log.info("Absolute File Path: " + fileDirectoryPath.toAbsolutePath());
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
