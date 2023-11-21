<template>
  <div>
    <NavBar />
    <div class="container">
      <router-view></router-view>
    </div>
    <FooterComponent />
    <MusicPlayer ref="musicPlayer" />
  </div>
</template>

<script setup>
import {useAppStore} from "@/services/store/appStore";
import {watchEffect} from "vue";
import router from "@/router";

const appStore = useAppStore();
const user = appStore.getUser();

watchEffect(() => {
  if (user) {
    router.push({name: 'home'});
  }
});
</script>

<script>
import NavBar from '@/components/NavBar.vue';
import FooterComponent from '@/components/FooterComponent.vue';
import MusicPlayer from '@/components/MusicPlayer.vue';

export default {
  components: {
    NavBar,
    FooterComponent,
    MusicPlayer,
  }
};
</script>
