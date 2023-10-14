<template>
  <div class="container">
    <h1>Quiz Lobby</h1>
    <div class="button-container">
      <div class="row justify-content-evenly">
        <div v-for="quizId in quizIdsArray" :key="quizId" class="col-6">
          <button
              class="quiz-button" @click="startQuiz(quizId)"
              :class="{ 'expired': isQuizExpired(quizId) }"
              :style="getButtonStyle(quizStartDates[quizId])"
              :disabled="isQuizExpired(quizId) || quizStartDates[quizId] === 'Loading...'">
            {{ quizId }}
            <br>
            {{ getFormatedStartDate(quizStartDates[quizId]) }}
          </button>
        </div>
      </div>
    </div>
    <div v-if="quizIdsArray.length === 0">
      <p>No quizzes available for this category.</p>
    </div>
  </div>
</template>

<script>
import { calculateQuizAvailability } from "@/services/QuizAvailabilityService";
import axios from "axios";

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
      for (const quizId of this.quizIdsArray) {
        try {
          const response = await axios.get(`http://localhost:8081/api/quizzes/${quizId}`);
          this.quizStartDates[quizId] = calculateQuizAvailability(response.data.startDate);
        } catch (error) {
          this.quizStartDates[quizId] = "Availability could not be loaded.";
        }
      }
    },
    isQuizExpired(quizId) {
      return this.quizStartDates[quizId] === "Quiz expired";
    },
    startQuiz(quizId) {
      if (!this.isQuizExpired(quizId)) {
        this.$router.push({
          name: "quiz",
          params: { requestId: quizId },
        });
      }
    },
    getButtonStyle(startDate) {
      if (!startDate || startDate === "Loading...") {
        return {};
      }
      const [days, hours] = startDate.split('/');
      const totalHours = parseInt(days) * 24 + parseInt(hours);
      const progress = Math.round((totalHours / 168) * 100);

      // ohne Transparenz ist besser, sonst ist schwierig zu lesen
      const greenColor = '#42b883';
      const redColor = '#ff4d4d';
      const lightGrayColor = 'rgba(0,0,0,0)';

      if(progress < 20){
        return {
          background: `linear-gradient(to right, ${redColor} ${progress}%, ${lightGrayColor} ${progress}%)`,
        };
      }else {
        return {
          background: `linear-gradient(to right, ${greenColor} ${progress}%, ${lightGrayColor} ${progress}%)`,
        };
      }
    },
    getFormatedStartDate(startDate) {
      if (!startDate) {
        return '';
      }

      if(startDate === "Loading..." || startDate === "Quiz expired") {
        return startDate;
      }

      const [days, hours] = startDate.split('/');

      if(days === '0') {
        return `${hours} hours`;
      } else {
        return `${days} days ${hours} hours`;
      }
    },
  },
};
</script>
