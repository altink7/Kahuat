<template>
  <div class="quiz-entry">
    <h1>Enter Your Nickname</h1>
    <input v-model="nickname" placeholder="Nickname" @input="clearErrorMessage" />
    <hr>
    <button @click="startQuiz" class="btn btn-primary card-button">Start Quiz</button>
  </div>
</template>

<script>
import {handleError} from "@/services/MessageHandlerService";

export default {
  data() {
    return {
      nickname: '',
      errorMessage: '',
    };
  },
  methods: {
    clearErrorMessage() {
      this.errorMessage = '';
    },
    startQuiz() {
      if (this.nickname.trim() === '') {
        handleError('Please enter a nickname')
      } else {
        this.$emit('start-quiz', this.nickname);
      }
    },
  },
};
</script>
