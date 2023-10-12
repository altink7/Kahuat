<template>
  <div class="home">
    <h1>Let's Play!</h1>
  </div>
  <div>
    <div class="container">
      <div class="progress">
        <div class="progress-bar" role="progressbar" :style="{ width: timer * 6.6666666667 + '%' }" aria-valuenow="25"
          aria-valuemin="0" aria-valuemax="100">
          {{ timer }}
        </div>
      </div>
      <div v-if="quizData !== null">
        <!-- Quiz availability -->
        <div class="quiz-availability">
          <b>{{ remainingAvailability }}</b>
        </div>

        <div :key="currentQuestion.id">
          <QuestionComponent :question="currentQuestion.question"
            :answerA="currentQuestion.answerOptions[0] == null ? '' : currentQuestion.answerOptions[0].answer.answer"
            :answerB="currentQuestion.answerOptions[1] == null ? '' : currentQuestion.answerOptions[1].answer.answer"
            :answerC="currentQuestion.answerOptions[2] == null ? '' : currentQuestion.answerOptions[2].answer.answer"
            :answerD="currentQuestion.answerOptions[3] == null ? '' : currentQuestion.answerOptions[3].answer.answer" />
        </div>
        <br>
        <button class="btn btn-primary" @click="nextQuestion">Next</button>
      </div>
      <div v-else>
        <p>Quiz data is loading...</p>
      </div>
    </div>
  </div>
</template>

<script>
import QuestionComponent from "@/components/QuestionComponent.vue";
import axios from "axios";

export default {
  name: "QuizView",
  data() {
    return {
      quizData: null,
      currentQuestionIndex: 0,
      timer: 15,
      timerInterval: null,
    };
  },
  computed: {
    currentQuestion() {
      return this.quizData.questions[this.currentQuestionIndex];
    }, remainingAvailability() {
      if (this.quizData && this.quizData.startDate) {
        // Calculate the end date based on start date + 1 week (604800000 milliseconds) dateformat: date: 2023-10-12
        console.log(this.quizData.startDate)
        const endDate = new Date(this.quizData.startDate);
        endDate.setTime(endDate.getTime() + 604800000);
        const remainingTime = endDate.getTime() - Date.now();
        console.log(remainingTime);
        if (remainingTime > 0) {
          const days = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
          const hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
          return `Quiz available for: ${days} days and ${hours} hours`;
        } else {
          return "Quiz expired";
        }
      }
      return "Unknown";
    },
  },
  methods: {
    searchQuiz(quizId) {
      axios
        .get(`http://localhost:8081/api/quizzes/${quizId}`)
        .then((response) => {
          this.quizData = response.data;
          this.startTimer();
        })
        .catch((error) => {
          console.log(error);
          this.quizData = { questions: [] };
        });
    },
    nextQuestion() {
      if (this.currentQuestionIndex < this.quizData.questions.length - 1) {
        this.currentQuestionIndex++;
        this.resetTimer();
      } else {
        // TODO wenn alle Fragen durch sind sollten wir ein POST request an den Server schicken
        // mit der quizId, userId und der Anzahl der richtigen Antworten, inklusive berechnete Zeit
        // als response sollten wir dann die Statistik bekommen inkl punkte und das zeigen wir dann an
        console.log("End of quiz reached.");
      }
    },
    startTimer() {
      this.timerInterval = setInterval(() => {
        if (this.timer > 0) {
          this.timer--;
        } else {
          // wenn die Zeit abgelaufen ist, dann soll die naechste Frage angezeigt werden
          this.nextQuestion();
        }
      }, 1000);
    },
    resetTimer() {
      clearInterval(this.timerInterval);
      this.timer = 15;
      this.startTimer();
    },
  },
  props: {
    requestId: {
      type: String,
      required: true,
    },
  },
  components: {
    QuestionComponent,
  },
  mounted() {
    console.log(this.requestId);
    this.searchQuiz(this.requestId);
  },
};
</script>
