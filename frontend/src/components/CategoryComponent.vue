<template>
  <div class="home">
    <h1>Choose a category</h1>
  </div>
  <div class="button-container justify-content-evenly">
    <button @click="handleCategoryClick('Sports')" class="category-button">Sports</button>
    <button @click="handleCategoryClick('Geography')" class="category-button">Geography</button>
  </div>
  <div class="button-container justify-content-evenly">
    <button @click="handleCategoryClick('History')" class="category-button">History</button>
    <button @click="handleCategoryClick('Culture')" class="category-button">Culture</button>
  </div>
  <div class="button-container justify-content-evenly">
    <button @click="handleCategoryClick('Science')" class="category-button">Science</button>
    <button @click="handleCategoryClick('Nature')" class="category-button">Nature</button>
  </div>
</template>

<script>
export default {
  name: "CategoryComponent",
  props: {
    pathTo: {
      type: String,
      default: "/lobby",
    },
  },
  emits: ['categoryClicked'],
  methods: {
    handleCategoryClick(category) {
      this.$emit('categoryClicked', category);
    }
  }
};
</script>
