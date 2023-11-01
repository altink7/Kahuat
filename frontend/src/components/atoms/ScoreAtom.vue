<template>
  <div class="d-flex flex-column align-items-center">
    <div class="fw-bold">Score</div>
    <p class="badge rounded-pill">{{ points }}</p>
  </div>
</template>

<script>
export default {
  props: {
    points: String,
  },
};
</script>
