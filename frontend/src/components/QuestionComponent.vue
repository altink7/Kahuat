<template>
  <div class="d-flex justify-content-center align-items-center">
    <div class="card question">
      <div class="card-body">
        <div class="timer-bar" :style="{ width: timerWidth }"></div>
        <h3>{{ question }}</h3>
      </div>
    </div>
  </div>

  <div class="button-container justify-content-center">
    <button class="answer-button answerA" @click="checkAnswer(answerA)">{{ Object.keys(answerA).length === 0 ? '' :
      answerA.answer.answer }}</button>
    <button class="answer-button answerB" @click="checkAnswer(answerB)">{{ Object.keys(answerB).length === 0 ? '' :
      answerB.answer.answer }}</button>
  </div>
  <div class="button-container justify-content-center">
    <button class="answer-button answerC" @click="checkAnswer(answerC)">{{ Object.keys(answerC).length === 0 ? '' :
      answerC.answer.answer }}</button>
    <button class="answer-button answerD" @click="checkAnswer(answerD)">{{ Object.keys(answerD).length === 0 ? '' :
      answerD.answer.answer }}</button>
  </div>
</template>

<script>
export default {
  name: "QuestionComponent",
  emits: ["answer-clicked"],
  props: {
    question: {
      type: String,
      default: "This question is not available yet",
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
    timerDuration: {
      type: Number,
      default: 15, // 15 seconds by default
    },
  },
  data() {
    return {
      timerWidth: "100%",
    };
  },
  methods: {
    checkAnswer(option) {
      console.log(option);
      this.$emit("answer-clicked", {
        isCorrect: option.correct,
      });
    },

    startTimer() {
      const timerInterval = 100;
      const totalSteps = this.timerDuration * 1000 / timerInterval;
      let step = 0;

      const timer = setInterval(() => {
        if (step < totalSteps) {
          this.timerWidth = `${((totalSteps - step) / totalSteps) * 100}%`;
          step++;
        } else {
          clearInterval(timer);
        }
      }, timerInterval);
    },
  },
  mounted() {
    this.startTimer();
  },
};
</script>
