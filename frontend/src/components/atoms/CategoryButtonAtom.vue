<template>
  <button @click="handleClick" class="category-button">{{ category }}</button>
</template>

<script>
export default {
  props: {
    category: String,
  },
  methods: {
    handleClick() {
      this.$emit('categoryClicked', this.category);
    },
  },
};
</script>
