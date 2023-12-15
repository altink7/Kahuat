package at.technikum.springrestbackend.controller;

import at.technikum.springrestbackend.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

@Component
@RequestMapping("/api/test")
public class UtilityController extends Controller{
    private final QuizService quizService;
    private final QuestionService questionService;
    private final UserService userService;
    private final UserStatisticService userStatisticService;
    private final AnswerService answerService;

    @Autowired
    public UtilityController(QuizService quizService, QuestionService questionService, UserService userService, UserStatisticService userStatisticService, AnswerService answerService) {
        this.quizService = quizService;
        this.questionService = questionService;
        this.userService = userService;
        this.userStatisticService = userStatisticService;
        this.answerService = answerService;
    }

    @RequestMapping("/init")
    public void init() {
        //create quiz
    }
}
