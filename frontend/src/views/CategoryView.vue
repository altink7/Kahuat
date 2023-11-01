<template>
    <div class="home">
        <h1>Choose a category</h1>
    </div>
    <CategoryMolecule pathTo = "/quiz"/>
</template>

<script>
import CategoryMolecule from "@/components/molecules/CategoryMolecule.vue";


export default {
    components: {
        CategoryMolecule,
    },
};
</script>

