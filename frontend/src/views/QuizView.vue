<template>
  <div class="home">
    <h1>Let's Play!</h1>
  </div>
  <div class="points">
    <h2>Points: {{ points }}</h2>
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
        <div :key="currentQuestion.id">
          <QuestionComponent :question="currentQuestion.question"
            :answerA="currentQuestion.answerOptions[0] == null ? {} : currentQuestion.answerOptions[0]"
            :answerB="currentQuestion.answerOptions[1] == null ? {} : currentQuestion.answerOptions[1]"
            :answerC="currentQuestion.answerOptions[2] == null ? {} : currentQuestion.answerOptions[2]"
            :answerD="currentQuestion.answerOptions[3] == null ? {} : currentQuestion.answerOptions[3]"
            @answer-clicked="handleAnswerClicked"/>
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
import EndpointService from "@/services/EndpointService";

export default {
  name: "QuizView",
  data() {
    return {
      quizData: null,
      currentQuestionIndex: 0,
      timer: 15,
      points: 0,
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
      EndpointService.get(`quizzes/${quizId}`)
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
      this.points = this.points + this.timer * 10;
      if (this.currentQuestionIndex < this.quizData.questions.length - 1) {
        this.currentQuestionIndex++;
        this.resetTimer();
      } else if (this.points > 0){
        this.$router.push({
          name: "rankings",
          query: { requestId: this.requestId, points: this.points },
        });
        console.log("End of quiz reached. Redirecting to rankings. (points: " + this.points + ")"+ " (requestId: " + this.requestId + "))");

        //reset points
        this.points = 0;
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
    handleAnswerClicked(answerInfo) {
      console.log(answerInfo);
      if (answerInfo.isCorrect) {
        console.log("Correct answer!");
        this.points = this.points + 150;
        this.nextQuestion();
      } else {
        console.log("Wrong answer!");
        this.nextQuestion();
      }
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
