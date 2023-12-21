<template>
  <div class="auth-container">
    <div class="auth-card">
      <h1 class="auth-title">Login</h1>
      <form class="auth-form" @submit.prevent="loginUser">
        <div class="form-group">
          <label class="form-label" for="username">User Name/E-Mail</label>
          <input v-model="email" type="text" class="form-control" id="username" placeholder="Enter your username or email">
        </div>
        <div class="form-group mt-3">
          <label class="form-label" for="password">Password</label>
          <input v-model="password" type="password" class="form-control" id="password" placeholder="Enter your password" minlength="8">
        </div>
        <div class="form-actions">
          <button type="submit" class="btn btn-primary">Login</button>
          <button @click="goToRegister" class="btn btn-secondary" type="button">Register</button>
        </div>
        <hr>
        <GoogleLoginComponent :callback="handleGoogleLogin" />
      </form>
    </div>
  </div>
</template>

<script setup>
import GoogleLoginComponent from "@/components/GoogleLoginComponent.vue";
import {decodeCredential} from "vue3-google-login";
import {useAppStore} from "@/services/store/appStore";
import EndpointService from "@/services/server/EndpointService";
import {handleError} from "@/services/MessageHandlerService";
import router from "@/router";

let email = "";
let password = "";

const loginUser  = async () => {
  try {
    const response = await EndpointService.get(`users/login/${email}/${password}`);
    console.log(response);
    useAppStore().setUser(response.data);

    router.afterEach(() => {
      location.reload();
    });

    router.push('/');
  } catch (error) {
    handleError("Unable to login")
    console.error('Error during login:', error);
  }
};

const goToRegister = () => {
  router.push('/register');
};

const handleGoogleLogin = (response) => {
  if (response.error) {
    console.error('Error during login:', response.error);
  } else {
    const userData = decodeCredential(response.credential);
    useAppStore().setUser(userData);

    router.afterEach(() => {
      location.reload();
    });

    router.push('/');
  }
};
</script>