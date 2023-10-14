<template>
  <div class="Home">
    <h1>Your Score</h1>
    <p>Request ID: {{ requestId }}</p>
    <p> <b>Points: {{ points }}</b></p>
  </div>
</template>

<script>
export default {
  name: "RankingsView",
  props: {
    requestId: String,
    points: String,
  },
};
</script>

  