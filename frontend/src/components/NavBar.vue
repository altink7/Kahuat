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
              <div v-if="user">
                <router-link to="/home" @click="logout">{{ user.name }} (logout)</router-link>
              </div>
              <div v-else>
                <router-link to="/login">Login</router-link>
              </div><br>
                <router-link to="/about">About</router-link>
            </div>
        </div>
    </nav>
</template>

<script setup>
import { ref, watchEffect } from 'vue';
const user = ref(JSON.parse(localStorage.getItem('user')));

watchEffect(() => {
  console.log('User changed:', user);
});
</script>

<script>
import { googleLogout } from "vue3-google-login"

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
      logout() {
        localStorage.removeItem('user');
        googleLogout();
        this.$router.push('/login');
        window.location.reload();
      }
    },
};
</script>
  