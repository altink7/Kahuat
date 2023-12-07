package at.technikum.springrestbackend.model.calculator;

import at.technikum.springrestbackend.model.*;

import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;

public class UserStatisticsCalculator {

    private UserStatisticsCalculator() {
        // Utility class
    }

    public static void calculate(UserStatistic userStatistic) {
        if (userStatistic != null) {
            userStatistic.setPlayedQuizzes(calculatePlayedQuizzes(userStatistic));
            userStatistic.setAveragePointsPerQuiz(calculateAveragePoints(userStatistic));
            userStatistic.setAveragePointsPerQuestion(calculateAveragePointsPerQuestion(userStatistic));
            userStatistic.setPointsPerCategory(calculatePointsPerCategory(userStatistic));
            userStatistic.setAveragePointsPerCategory(calculateAveragePointsPerCategory(userStatistic));
            userStatistic.setFavoriteCategory(calculateFavoriteCategory(userStatistic, Quiz::getKategorie));
            userStatistic.setMostPlayedCategory(calculateMostPlayedCategory(userStatistic, Quiz::getKategorie));
            userStatistic.setBestRatedQuiz(calculateExtremum(userStatistic.getQuizList(),
                    Comparator.comparingDouble(quiz -> calculatePointsPerQuestion(quiz, userStatistic))));
        }
    }

    private static int calculatePlayedQuizzes(UserStatistic userStatistic) {
        return Optional.ofNullable(userStatistic.getQuizList()).map(Set::size).orElse(0);
    }

    private static double calculateAveragePoints(UserStatistic userStatistic) {
        return Optional.ofNullable(userStatistic.getQuizList())
                .filter(quizList -> !quizList.isEmpty())
                .map(quizList -> userStatistic.getPoints() / (double) quizList.size())
                .orElse(0.0);
    }

    private static double calculateAveragePointsPerQuestion(UserStatistic userStatistic) {
        return Optional.ofNullable(userStatistic.getQuizList())
                .filter(quizList -> !quizList.isEmpty())
                .map(quizList -> {
                    int totalQuestions = quizList.stream().mapToInt(quiz -> quiz.getQuestions().size()).sum();
                    return userStatistic.getPoints() / (double) totalQuestions;
                })
                .orElse(0.0);
    }


    private static Map<Category, Integer> calculatePointsPerCategory(UserStatistic userStatistic) {
        return Optional.ofNullable(userStatistic.getQuizList())
                .orElse(Collections.emptySet())
                .stream()
                .flatMap(quiz -> quiz.getParticipants().stream()
                        .filter(participant -> userStatistic.getUserId().equals(participant.getUserId()))
                        .map(participant -> Map.entry(quiz.getKategorie(), participant.getPoints())))
                .collect(Collectors.groupingBy(Map.Entry::getKey, Collectors.summingInt(Map.Entry::getValue)));
    }

    private static Map<Category, Double> calculateAveragePointsPerCategory(UserStatistic userStatistic) {
        Map<Category, Integer> pointsPerCategory = calculatePointsPerCategory(userStatistic);
        return pointsPerCategory.entrySet()
                .stream()
                .collect(Collectors.toMap(Map.Entry::getKey, entry -> (double) entry.getValue() / userStatistic.getPlayedQuizzes()));
    }

    private static <T> T calculateExtremum(Set<T> list, Comparator<T> comparator) {
        return Optional.ofNullable(list)
                .orElse(Collections.emptySet())
                .stream()
                .max(comparator)
                .orElse(null);
    }

    private static <T> T calculateExtremum(List<T> list, Comparator<T> comparator) {
        return Optional.ofNullable(list)
                .orElse(Collections.emptyList())
                .stream()
                .max(comparator)
                .orElse(null);
    }

    private static Category calculateFavoriteCategory(UserStatistic userStatistic, Function<Quiz, Category> classifier) {
        return calculateExtremum(getCategories(userStatistic, classifier), Comparator.comparingInt(Category::getValue));
    }

    private static Category calculateMostPlayedCategory(UserStatistic userStatistic, Function<Quiz, Category> classifier) {
        return calculateExtremum(getCategories(userStatistic, classifier), Comparator.comparingInt(Category::getValue).reversed());
    }

    private static List<Category> getCategories(UserStatistic userStatistic, Function<Quiz, Category> classifier) {
        return Optional.ofNullable(userStatistic.getQuizList())
                .orElse(Collections.emptySet())
                .stream()
                .map(classifier)
                .collect(Collectors.toList());
    }

    private static double calculatePointsPerQuestion(Quiz quiz, UserStatistic userStatistic) {
        int totalQuestions = quiz.getQuestions().size();
        return userStatistic.getPoints() / (double) totalQuestions;
    }
}
