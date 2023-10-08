<template>
    <div class="home">
        <h1>Choose a category</h1>
    </div>
    <div class="button-container justify-content-evenly">
        <router-link :to="pathTo" v-slot="{ navigate }">
            <button @click="navigate" class="category-button">Sports</button>
        </router-link>
        <router-link :to="pathTo" v-slot="{ navigate }">
            <button @click="navigate" class="category-button">Geography</button>
        </router-link>
    </div><br>
    <div class="button-container justify-content-evenly">
        <router-link :to="pathTo" v-slot="{ navigate }">
            <button @click="navigate" class="category-button">History</button>
        </router-link>
        <router-link :to="pathTo" v-slot="{ navigate }">
            <button @click="navigate" class="category-button">Culture</button>
        </router-link>
    </div>
    <div class="button-container justify-content-evenly">
        <router-link :to="pathTo" v-slot="{ navigate }">
            <button @click="navigate" class="category-button">Science</button>
        </router-link>
        <router-link :to="pathTo" v-slot="{ navigate }">
            <button @click="navigate" class="category-button">Nature</button>
        </router-link>
    </div>
</template>

<script>
export default {
    name: "CategoryComponent",
    props: {
        pathTo: {
            type: String,
            default: "/quiz",
        },
    }
};
</script>
