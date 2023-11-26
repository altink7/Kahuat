<template>
  <div id="app">
    <NavBar />
    <div class="main-content">
      <div class="container">
        <router-view></router-view>
      </div>
    </div>
    <FooterComponent />
    <MusicPlayer ref="musicPlayer" />
  </div>
</template>

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