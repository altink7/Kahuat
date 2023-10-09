<template>
  <div class="home">
    <h1>Let's Play!</h1>
  </div>
  <div>
    <div class="container">
      <div class="text-center mt-2">
          <h2 v-if="timer > 0">Time left: {{ timer }} seconds</h2>
          <p v-else>Time's up!</p>
        </div>
      <div v-if="quizData !== null">
        <div :key="currentQuestion.id">
          <QuestionComponent
            :question="currentQuestion.question"
            :answerA="currentQuestion.answerOptions[0] == null ? '' : currentQuestion.answerOptions[0].answer.answer"
            :answerB="currentQuestion.answerOptions[1] == null ? '' : currentQuestion.answerOptions[1].answer.answer"
            :answerC="currentQuestion.answerOptions[2] == null ? '' : currentQuestion.answerOptions[2].answer.answer"
            :answerD="currentQuestion.answerOptions[3] == null ? '' : currentQuestion.answerOptions[3].answer.answer"
          />
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
    },
  },
  methods: {
    searchQuiz(quizId) {
      axios
        .get(`http://localhost:5000/api/quizzes/${quizId}`)
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
