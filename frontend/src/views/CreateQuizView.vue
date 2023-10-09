<template>
    <div class="home">
        <h1>Create Quiz!</h1>
    </div>
    <CategoryComponent pathTo="/create-question"/>
</template>

<script>
import CategoryComponent from '@/components/CategoryComponent.vue';

export default {
    components: {
        CategoryComponent
    },
};
</script>
  
  