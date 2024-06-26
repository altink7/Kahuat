<template>
  <div class="home">
    <h1>Let's Play!</h1>
  </div>
  <div class="points">
    <p class="badge rounded-pill">{{ points }} Points</p>
  </div>
  <div v-if="quizData !== null">
    <div :key="currentQuestion.id">
      <QuestionComponent :question="currentQuestion.question"
        :answerA="currentQuestion.answerOptions[0] == null ? {} : currentQuestion.answerOptions[0]"
        :answerB="currentQuestion.answerOptions[1] == null ? {} : currentQuestion.answerOptions[1]"
        :answerC="currentQuestion.answerOptions[2] == null ? {} : currentQuestion.answerOptions[2]"
        :answerD="currentQuestion.answerOptions[3] == null ? {} : currentQuestion.answerOptions[3]"
        :timerDuration="timer"
        :image-src="imageSrc"
        @answer-clicked="handleAnswerClicked" />
    </div>
    <br>
    <button class="btn btn-primary" @click="nextQuestion">Next</button>
  </div>
  <div v-else>
    <p>Quiz is loading...</p>
  </div>
</template>

<script>
import QuestionComponent from "@/components/QuestionComponent.vue";
import EndpointService from "@/services/server/EndpointService";
import {useAppStore} from "@/services/store/appStore";

export default {
  name: "QuizView",
  data() {
    return {
      quizData: null,
      currentQuestionIndex: 0,
      timer: 15,
      points: 0,
      timerInterval: null,
      quizStartTime: null,
      playing: true,
      imageSrc: null,
      loadingImage: false,
    };
  },
  computed: {
    currentQuestion() {
      return this.quizData.questions[this.currentQuestionIndex];
    },
  },
  methods: {
    searchQuiz(quizId) {
      this.quizStartTime = Date.now();
      EndpointService.get(`quizzes/${quizId}`)
          .then((response) => {
            this.quizData = response.data;
            console.log(this.quizData);
            this.getPictureFromQuestionId(this.quizData.questions[0].id);
          })
        .catch((error) => {
          console.log(error);
          this.quizData = { questions: [] };
          this.imageSrc = null;
        });
    },
    nextQuestion() {
      if (this.currentQuestionIndex < this.quizData.questions.length - 1) {
        this.currentQuestionIndex++;
        this.getPictureFromQuestionId(this.currentQuestion.id);

        this.resetTimer();
      } else if (this.playing) {

        const quizEndTime = Date.now();
        const quizDuration = (quizEndTime - this.quizStartTime) / 1000;

        const store = useAppStore();

        store.setQuizDuration(quizDuration);
        store.setPoints(this.points);
        store.setRequestId(this.requestId);
        store.setSelectedCategory(this.quizData.kategorie);
        //get user id from local storage
        const userData = store.getUser();

        if(userData != null) {
          EndpointService.get(`users/emails/${userData.email}`)
              .then((response) => {
                console.log("ReSPONSe:" + response);
                store.setUser(response.data);
                store.setUserId(response.data.id);
              })
              .catch((error) => {
                console.log(error);
              });
        }

        const participant = {
          userId: store.getUserId(),
          nickname: store.getNickname(),
          points: store.getPoints(),
          participantQuizDuration: store.getQuizDuration(),
        };

        EndpointService.post(`quizzes/${this.requestId}/addParticipant`, participant)
            .then((response) => {
              console.log(store.getNickname() + " has finished the quiz. (points: " + this.points + ")" + " (requestId: " + this.requestId + ")");
              console.log(response);

              this.$router.push({
                name: "rankings",
              });
            })
            .catch((error) => {
              console.log(error);
            });


        console.log("End of quiz reached. Redirecting to rankings. (points: " + this.points + ")" + " (requestId: " + this.requestId + "))");

        this.quizStartTime = null;
        this.playing = false;

        setTimeout(() => {
          this.points = 0;
        }, 1000);
      }
    },
    startTimer() {
      this.timerInterval = setInterval(() => {
        if (this.timer > 0) {
          this.timer--;
        } else {
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
        this.points = this.points + 150 + (this.timer * 10);
        this.nextQuestion();
      } else {
        console.log("Wrong answer!");
        this.points += 0;
        this.nextQuestion();
      }
    },
    getPictureFromQuestionId(questionId) {
      this.imageSrc = `http://localhost:8081/api/quizzes/questions/${questionId}/image`;
    }

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

    this.playing = true;
    this.searchQuiz(this.requestId);
  },
};
</script>
