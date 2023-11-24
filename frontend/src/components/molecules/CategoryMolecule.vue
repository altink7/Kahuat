<template>
  <div class="category mt-2">
    <h3>Choose a category</h3>
  </div>
  <div class="button-container justify-content-evenly">
    <CategoryButtonAtom @categoryClicked="handleCategoryClick" category="Sports" />
    <CategoryButtonAtom @categoryClicked="handleCategoryClick" category="Geography" />
    <CategoryButtonAtom @categoryClicked="handleCategoryClick" category="History" />
    <CategoryButtonAtom @categoryClicked="handleCategoryClick" category="Culture" />
    <CategoryButtonAtom @categoryClicked="handleCategoryClick" category="Science" />
    <CategoryButtonAtom @categoryClicked="handleCategoryClick" category="Nature" />
  </div>
</template>

<script>
import CategoryButtonAtom from "@/components/atoms/CategoryButtonAtom.vue";

export default {
  name: "CategoryMolecule",
  props: {
    pathTo: {
      type: String,
      default: "/lobby",
    },
  },
  components: {
    CategoryButtonAtom,
  },
  methods: {
    handleCategoryClick(category) {
      this.$emit('categoryClicked', category);
    },
  },
};
</script>