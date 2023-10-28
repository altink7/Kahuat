<template>
    <div class="home">
        <h1>Create Quiz!</h1>
    </div>
    <CategoryComponent @categoryClicked="handleCategoryClicked"/>
</template>

<script>
import CategoryComponent from '@/components/CategoryComponent.vue';

export default {
    components: {
        CategoryComponent
    },
  methods: {
    handleCategoryClicked(category) {
      this.$router.push({
        name: "create-question",
        params: { category: category },
      });
    }
  }
};
</script>

