<template>
  <div>
    <div class="container d-flex justify-content-center align-items-center">
      <div class="card loginForm login-card">
        <div class="card-body">
          <h2 class="card-title text-center">Login</h2>
          <form>
            <div class="form-group">
              <label for="username">User Name/E-Mail</label>
              <input type="text" class="form-control" id="username" placeholder="Max/max.muster@gmail.com">
            </div>
            <div class="form-group">
              <label for="password">Passwort</label>
              <input type="password" class="form-control" id="password" placeholder="********" minlength="8">
            </div>
            <div class="button-container justify-content-evenly">
              <button type="submit" class="btn btn-primary card-button">Login</button>
              <router-link to="/register" v-slot="{ navigate }">
                <button @click="navigate" class="btn btn-primary card-button">Register</button>
              </router-link>
            </div>
            <hr>

            <GoogleLoginComponent :callback="handleGoogleLogin" />

          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import {decodeCredential} from "vue3-google-login";

const router = useRouter();

const handleGoogleLogin = (response) => {
  if (response.error) {
    console.error('Error during login:', response.error);
  } else {
    const userData = decodeCredential(response.credential);
    localStorage.setItem('user', JSON.stringify(userData));
    router.push('home');
    window.location.reload();
  }
};
</script>

<script>

import {defineComponent} from "vue";
import GoogleLoginComponent from "@/components/GoogleLoginComponent.vue";

export default defineComponent({
  components: {GoogleLoginComponent}
})
</script>