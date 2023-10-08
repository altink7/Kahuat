<template>
    <div class="home">
        <h1>Choose a category</h1>
    </div>
    <CategoryComponent pathTo = "/quiz"/>
</template>

<script>
import CategoryComponent from "@/components/CategoryComponent.vue";


export default {
    components: {
        CategoryComponent,
    },
};
</script>

