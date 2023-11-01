<template>
  <div class="ms-2 me-auto">
    <div class="fw-bold">Nickname: {{ nickname }}</div>
    <div class="fw-bold">Duration: {{ duration }}s</div>
  </div>
</template>

<script>
export default {
  props: {
    nickname: String,
    duration: String,
  },
};
</script>
