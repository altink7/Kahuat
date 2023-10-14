<template>
  <div class="d-flex justify-content-center align-items-center">
    <div class="card question">
      <div class="card-body">
        <h1 class="card-title text-center">Question</h1>
        <h3>{{ question }}</h3>
      </div>
    </div>
  </div>

  <div class="button-container justify-content-center">
    <button class="answer-button answerA" @click="checkAnswer(answerA)">{{ answerA === null ? '' : answerA.answer.answer }}</button>
    <button class="answer-button answerB" @click="checkAnswer(answerB)">{{ answerB === null ? '' : answerB.answer.answer }}</button>
  </div>
  <div class="button-container justify-content-center">
    <button class="answer-button answerC" @click="checkAnswer(answerC)">{{ answerC === null ? '' : answerC.answer.answer }}</button>
    <button class="answer-button answerD" @click="checkAnswer(answerD)">{{ Object.keys(answerD).length === 0 ? '' : answerD.answer.answer }}</button>
  </div>

</template>

<script>
export default {
  name: "QuestionComponent",
  emits: ["answer-clicked"],
  props: {
    question: {
      type: String,
      default: "this Question is not available yet",
      required: true,
    },
    answerA: {
      type: Object,
      default: null,
      required: true,
    },
    answerB: {
      type: Object,
      default: null,
      required: true,
    },
    answerC: {
      type: Object,
      default: null,
      required: true,
    },
    answerD: {
      type: Object,
      default: null,
      required: true,
    },
  },

  methods: {
    checkAnswer(option) {
      console.log(option);
      this.$emit("answer-clicked", {
        isCorrect: option.correct,
      });
    },
  },
};
</script>
