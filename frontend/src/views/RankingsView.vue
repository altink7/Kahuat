<template>
  <div class="container d-flex justify-content-center align-items-center">
    <div class="rankings">
      <ol class="list-group list-group-numbered">
        <li class="list-group-item d-flex justify-content-between align-items-start">
          <div class="ms-2 me-auto">
            <div class="fw-bold">Quiz ID: {{ requestId }}</div>
            <div class="fw-bold">Category: {{ category }}</div>
            <div class="fw-bold">Duration: {{duration}}</div>
          </div>
          <div class="d-flex flex-column align-items-center">
            <div class="fw-bold">Score</div>
            <p class="badge rounded-pill">{{points}}</p>

          </div>
        </li>
      </ol>
    </div>
  </div>
</template>


<script>
export default {
  name: "RankingsView",
  props: {
    requestId: String,
    points: String,
    category: String,
    duration: Number,
  },
};
</script>

