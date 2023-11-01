<template>
  <div class="d-flex justify-content-center align-items-center">
    <div class="card question">
      <div class="card-body">
        <h1 class="card-title text-center">Question</h1>
        <form id="question-form" class="question-form" action="" method="POST">
          <div class="row">
            <div class="form-group">
              <textarea class="form-control-question" v-model="question" required></textarea>
            </div>
            <div>
              <p>Mark the correct answers</p>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="button-container justify-content-center">
    <div class="answer-option answerA">
      <input type="text" v-model="answers.A.text" placeholder="Answer a">
      <input type="checkbox" v-model="answers.A.isCorrect">
    </div>
    <div class="answer-option answerB">
      <input type="text" v-model="answers.B.text" placeholder="Answer b">
      <input type="checkbox" v-model="answers.B.isCorrect">
    </div>
  </div>
  <div class="button-container justify-content-center">
    <div class="answer-option answerC">
      <input type="text" v-model="answers.C.text" placeholder="Answer c">
      <input type="checkbox" v-model="answers.C.isCorrect">
    </div>
    <div class="answer-option answerD">
      <input type="text" v-model="answers.D.text" placeholder="Answer d">
      <input type="checkbox" v-model="answers.D.isCorrect">
    </div>
  </div>
</template>

<script>
import {useAppStore} from "@/services/store/appStore";

export default {
  data() {
    return {
      question: "",
      answers: {
        A: { text: "", isCorrect: false },
        B: { text: "", isCorrect: false },
        C: { text: "", isCorrect: false },
        D: { text: "", isCorrect: false },
      },
    };
  },

  methods: {
    getQuestionFromForm() {
      let store = useAppStore();
      return {
        question: this.question,
        answerOptions: Object.values(this.answers).map((answer) => ({
          answer: answer.text,
          correct: answer.isCorrect,
        })),
        category: store.getSelectedCategory()?.toUpperCase() || "",
      };
    },
  },
};
</script>
