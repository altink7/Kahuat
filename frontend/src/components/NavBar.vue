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
        <div v-if="appUser">
          <router-link to="User" class="nav-link" >Profile</router-link>
        </div>
        <div v-if="appUser">
          <router-link to="/" class="nav-link" @click="logout">Logout</router-link>
        </div>
        <div v-else>
          <router-link to="/login" class="nav-link">Login</router-link>
        </div>
        <router-link to="/about" class="nav-link">About</router-link>
      </div>
    </div>
  </nav>
</template>

<script setup>
import {watchEffect} from 'vue';
import EndpointService from "@/services/server/EndpointService";
import * as MessageHandler from "@/services/MessageHandlerService";

const appUser = useAppStore().getUser();

watchEffect(() => {
  console.log('User changed:', appUser);

  if (appUser == null || appUser.email == null) {
    return;
  }

  function createGoogleUser() {
    const email = appUser.email;
    console.log('email:' + email);

    EndpointService.post('users/createGoogleUser', {email: email}).then((response) => {
      console.log(response);
      useAppStore().setUser(response.data)
    }).catch((error) => {
      console.log(error);
    });
  }

  EndpointService.get('users/googleUsers/' + appUser.email).then((response) => {
    console.log(response);
    if (response.data.length !== 0) {
      console.log('User already exists');
    } else {
      createGoogleUser();
    }
  }).catch((response) => {
    if (response.response.status === 404) {
      createGoogleUser();
    } else if (response.response.status === 500) {
      MessageHandler.handleError("Error while checking if appUser exists");
    }
  });

});
</script>

<script>
import {googleLogout} from "vue3-google-login"
import {useAppStore} from "@/services/store/appStore";
import router from "@/router";

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
      logout() {
        useAppStore().setUser(null);
        googleLogout();

        router.afterEach(() => {
          location.reload();
        });

        this.$router.push('/login');
      }
    },
};
</script>