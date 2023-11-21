<template>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <!-- Logo as a link to the home page -->
      <router-link to="/" class="navbar-brand">
        <img src="../assets/logo.png" alt="Kahuat Logo" class="nav-img">
      </router-link>

      <!-- Toggler for mobile view -->
      <button class="navbar-toggler" type="button" @click="toggleNavbar">
        <span></span>
        <span></span>
        <span></span>
      </button>

      <!-- Navbar Links -->
      <div class="collapse navbar-collapse justify-content-evenly text-center" :class="{ 'show': isNavbarOpen }">
        <router-link to="/" class="nav-link">Home</router-link>
        <router-link to="/login" class="nav-link">Login</router-link>
        <router-link to="/about" class="nav-link">About</router-link>
      </div>
    </div>
  </nav>
</template>

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
            const navbarToggler = this.$el.querySelector('.navbar-toggler');
            navbarToggler.classList.toggle('active');
        },
    },
};
</script>