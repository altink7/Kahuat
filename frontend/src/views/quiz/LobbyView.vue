<template>
  <div class="home">
    <h1>Quiz Lobby</h1>
  </div>
  <div class="button-container justify-content-evenly">
    <div v-for="quizId in quizIdsArray" :key="quizId">
      <button class="action-button" @click="startQuiz(quizId)" :class="{ 'expired': isQuizExpired(quizId) }"
        :style="getButtonStyle(quizStartDates[quizId])"
        :disabled="isQuizExpired(quizId) || quizStartDates[quizId] === 'Loading...'">
        {{ quizId }}
        <br>
        {{ getFormattedStartDate(quizStartDates[quizId]) }}
      </button>
    </div>
  </div>
  <div v-if="quizIdsArray.length === 0">
    <p>No quizzes available for this category.</p>
  </div>
</template>

<script>
import { loadQuizStartDates, isQuizExpired, startQuiz, getButtonStyle, getFormattedStartDate } from "@/services/quiz/QuizLobbyService";

export default {
  name: "LobbyView",
  props: ["quizIds"],
  data() {
    return {
      quizIdsArray: [],
      quizStartDates: {},
    };
  },
  created() {
    if (this.quizIds) {
      this.quizIdsArray = this.quizIds.split(",");
      this.loadQuizStartDates();
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

    isQuizExpired(quizId) {
      return isQuizExpired(this.quizStartDates, quizId);
    },

    startQuiz(quizId) {
      startQuiz(this.$router, this.isQuizExpired, quizId);
    },

    getButtonStyle(startDate) {
      return getButtonStyle(startDate);
    },

    getFormattedStartDate(startDate) {
      console.log("getFormattedStartDate: " + startDate);
      return getFormattedStartDate(startDate);
    },
  },
};
</script>