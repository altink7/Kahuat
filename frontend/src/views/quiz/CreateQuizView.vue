<template>
    <div class="home">
        <h1>Create Quiz!</h1>
    </div>
    <CategoryMolecule @categoryClicked="handleCategoryClicked"/>
</template>

<script>
import CategoryMolecule from '@/components/molecules/CategoryMolecule.vue';
import {useAppStore} from "@/services/store/appStore";


export default {
    components: {
        CategoryMolecule
    },

  methods: {
    handleCategoryClicked(category) {
      const store = useAppStore();
      store.setSelectedCategory(category);

      this.$router.push({
        name: "create-question",
        params: { category: category },
      });
    }
  }
};
</script>

