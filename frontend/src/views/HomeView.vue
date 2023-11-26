<template>
  <div class="home">
    <h1>Energize Your Education!</h1>
  </div>
  <div class="button-container justify-content-evenly">
    <router-link to="/search-quiz" v-slot="{ navigate }">
      <button @click="navigate" class="action-button">Play</button>
    </router-link>
  </div><br>
  <div class="button-container justify-content-evenly">
    <div v-if="user">
      <router-link to="/create-quiz" v-slot="{ navigate }">
        <button @click="navigate" class="action-button">Create Quiz</button>
      </router-link>
    </div>
    <router-link to="/rankings" v-slot="{ navigate }">
      <button @click="navigate" class="action-button">Rankings</button>
    </router-link>

    <div v-if="user">
      <router-link to="/user-statistics" v-slot="{ navigate }">
        <button @click="navigate" class="action-button">User Statistic</button>
      </router-link>
    </div>

  </div>
</template>
<script setup>
import {useAppStore} from "@/services/store/appStore";
const appStore = useAppStore();
const user = appStore.getUser() == null ? null : appStore.getUser();
</script>