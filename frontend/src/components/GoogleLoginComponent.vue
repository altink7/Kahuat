<template>
  <GoogleLogin :callback="callback"/>
</template>

<script setup>
import {decodeCredential, GoogleLogin} from "vue3-google-login";
import {useAppStore} from "@/services/store/appStore";
import router from "@/router";

const appStore = useAppStore();

const callback = (response) => {
  const userData = decodeCredential(response.credential);
  appStore.setUser(userData);

  console.log("User data", appStore.getUser());
  router.push({name: 'home'});
}
</script>