<template>
  <div class="ms-2 me-auto">
    <div class="fw-bold">Quiz ID: {{ quizId }}</div>
    <div class="fw-bold">Duration: {{ duration }}s</div>
    <div class="fw-bold">Category: {{ category }}</div>
  </div>
</template>

<script>
export default {
  props: {
    quizId: String,
    duration: String,
    category: String,
  },
};
</script>
