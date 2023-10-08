<template>
    <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
            <router-link to="/">
                <a class="navbar-brand"><img src="../assets/logo.png" width="60" height="60">
                </a></router-link>
            <button class="navbar-toggler" type="button" @click="toggleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-evenly text-center" :class="{ 'show': isNavbarOpen }"
                id="navbarSupportedContent">
                <router-link to="/">Home</router-link><br>
                <router-link to="/login">Login</router-link><br>
                <router-link to="/about">About</router-link>

            </div>
        </div>
    </nav>
</template>

<!-- Navbar.vue -->

  
<script>
export default {
    data() {
        return {
            isNavbarOpen: false,
        };
    },
    methods: {
        toggleNavbar() {
            this.isNavbarOpen = !this.isNavbarOpen;
        },
    },
};
</script>
  
<style scoped>
/* Add custom CSS styles here */
</style>
  