<template>
  <div class="d-flex justify-content-center align-items-center">
    <div class="card question">
      <div class="card-body">
        <h1 class="card-title text-center">Question</h1>
        <form id="question-form" class="question-form" action="" method="POST">
          <div class="row">
            <div class="form-group">
              <textarea class="form-control-question" @input="adjustTextareaHeight" v-model="question" required></textarea>
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
    <div class="answer-option answerA" :class="{ 'correct-answer': answers.A.isCorrect }" @click="toggleCorrect('A')">
      <textarea class="form-control-answer"
                @input="adjustTextareaHeight"
                @click.stop="noop"
                v-model="answers.A.text"
                placeholder="Answer a">
      </textarea>
    </div>
    <div class="answer-option answerB" :class="{ 'correct-answer': answers.B.isCorrect }" @click="toggleCorrect('B')">
      <textarea class="form-control-answer"
                @input="adjustTextareaHeight"
                @click.stop="noop"
                v-model="answers.B.text"
                placeholder="Answer b">
      </textarea>
    </div>
  </div>
  <div class="button-container justify-content-center">
    <div class="answer-option answerC" :class="{ 'correct-answer': answers.C.isCorrect }" @click="toggleCorrect('C')">
      <textarea class="form-control-answer"
                @input="adjustTextareaHeight"
                @click.stop="noop"
                v-model="answers.C.text"
                placeholder="Answer c">
      </textarea>
    </div>
    <div class="answer-option answerD" :class="{ 'correct-answer': answers.D.isCorrect }" @click="toggleCorrect('D')">
      <textarea class="form-control-answer"
                @input="adjustTextareaHeight"
                @click.stop="noop"
                v-model="answers.D.text"
                placeholder="Answer d">
      </textarea>
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
      return {
        question: this.question,
        answerOptions: Object.values(this.answers).map((answer) => ({
          answer: answer.text,
          correct: answer.isCorrect,
        })),
        category: useAppStore().getSelectedCategory()?.toUpperCase() || "",
      };
    },

    adjustTextareaHeight(event) {
      const textarea = event.target;
      textarea.style.height = 'auto';
      textarea.style.height = textarea.scrollHeight + 'px';
    },

    toggleCorrect(answerKey) {
      this.answers[answerKey].isCorrect = !this.answers[answerKey].isCorrect;
    },
  },
};
</script>