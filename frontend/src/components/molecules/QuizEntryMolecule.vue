<template>
  <div class="quiz-entry">
      <div class="nickname mt-2">
        <h3>Enter a name</h3>
      </div>
      <textarea class="form-control-nickname"
                v-model="nickname"
                placeholder="Name"
                @input="clearErrorMessage">
      </textarea>
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
        handleError('Please enter a name')
      } else {
        this.$emit('start-quiz', this.nickname);
      }
    },
  },
};
</script>