<template>
  <div class="home">
    <h1>Quiz Lobby</h1>
  </div>
  <div v-if="showQuizEntry">
    <QuizEntryMolecule @start-quiz="startQuiz" />
  </div>
  <div v-else>
    <div class="button-container justify-content-evenly">
        <div v-for="quizId in quizIdsArray" :key="quizId">
          <button class="action-button" @click="showQuizEntryView(quizId)" :class="{ 'expired': isQuizExpired(quizId) }"
            :style="getButtonStyle(quizStartDates[quizId], quizDurations[quizId])"
            :disabled="isQuizExpired(quizId) || quizStartDates[quizId] === 'Loading...'">
            <span v-if="quizTitles[quizId]" class="quiz-title">{{ quizTitles[quizId] }}</span>
            <hr v-if="quizTitles[quizId]">
            <span class="quiz-id">{{ quizId }}</span>
            <br>
            {{ getFormattedStartDate(quizStartDates[quizId]) }}
          </button>
        </div>
    </div>
    <div v-if="quizIdsArray.length === 0">
      <p>No quizzes available for this category.</p>
    </div>
  </div>
</template>

<script>
import {
  getButtonStyle,
  getFormattedStartDate,
  isQuizExpired,
  loadQuizDurations,
  loadQuizStartDates, loadQuizTitles,
  startQuiz
} from "@/services/quiz/QuizLobbyService";
import QuizEntryMolecule from "@/components/molecules/QuizEntryMolecule.vue";
import {useAppStore} from "@/services/store/appStore";

export default {
  name: "LobbyView",
  props: ["quizIds"],
  components: {
    QuizEntryMolecule,
  },
  data() {
    return {
      quizIdsArray: [],
      quizStartDates: {},
      quizDurations: {},
      quizTitles: {},
      showQuizEntry: false,
      selectedQuizId: null,
    };
  },
  created() {
    if (this.quizIds) {
      this.quizIdsArray = this.quizIds.split(",");
      this.loadQuizStartDates();
      this.loadQuizDurations();
      this.loadQuizTitles();
    }
  },
  methods: {
    async loadQuizStartDates() {
      this.quizStartDates = loadQuizStartDates(this.quizIdsArray).then((result) => {
        this.quizStartDates = result;
      }).catch((error) => {
        console.log(error);
      });
    },
    async loadQuizDurations() {
      this.quizDurations = loadQuizDurations(this.quizIdsArray).then((result) => {
        this.quizDurations = result;
        console.log("Quiz durations: " + this.quizDurations);
      }).catch((error) => {
        console.log(error);
      });
    },
    async loadQuizTitles() {
      this.quizTitles = loadQuizTitles(this.quizIdsArray).then((result) => {
        this.quizTitles = result;
        console.log("Quiz titles: " + this.quizTitles);
      }).catch((error) => {
        console.log(error);
      });
    },
    isQuizExpired(quizId) {
      return isQuizExpired(this.quizStartDates, quizId);
    },
    showQuizEntryView(quizId) {
      this.selectedQuizId = quizId;
      this.showQuizEntry = true;
    },
    startQuiz(nickname) {
      this.showQuizEntry = false;
      useAppStore().setNickname(nickname);
      startQuiz(this.$router, this.isQuizExpired, this.selectedQuizId );
    },

    getButtonStyle(startDate, duration) {
      return getButtonStyle(startDate, duration);
    },

    getFormattedStartDate(startDate) {
      console.log("getFormattedStartDate: " + startDate);
      return getFormattedStartDate(startDate);
    },
  },
};
</script>