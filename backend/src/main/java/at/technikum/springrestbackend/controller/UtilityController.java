package at.technikum.springrestbackend.controller;

import at.technikum.springrestbackend.model.Category;
import at.technikum.springrestbackend.model.Question;
import at.technikum.springrestbackend.model.Quiz;
import at.technikum.springrestbackend.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.List;

@Component
@RequestMapping("/api/test")
public class UtilityController extends Controller{
    private final QuizService quizService;
    private final QuestionService questionService;
    private final UserService userService;

    @Autowired
    public UtilityController(QuizService quizService, QuestionService questionService, UserService userService) {
        this.quizService = quizService;
        this.questionService = questionService;
        this.userService = userService;
    }

    @RequestMapping("/init")
    public void init() {
        quizService.createQuiz(getQuiz());
    }

    private Quiz getQuiz() {
        Quiz quiz = new Quiz();
        quiz.setCreator(userService.getAllUsers().stream().findAny().orElse(null));
        quiz.setKategorie(Category.SPORTS);
        quiz.setDuration(100);
        quiz.setQuestions(getQuestionList());
        return quiz;
    }

    private List<Question> getQuestionList() {
        List<Question> questions = questionService.getAllQuestions();
        Collections.shuffle(questions);

        if(questions.size() < 10){
            return questions;
        }

        return questions.subList(0, 10);

    }
}
