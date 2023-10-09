<template>
  <div>
    <audio id="track" ref="audio" autoplay loop>
      <source :src="currentTrack" type="audio/mpeg">
    </audio>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentTrack: require('@/assets/sound/audio.mp3')
    };
  },
  methods: {
    playMusic(src) {
      this.$refs.audio.src = src;
      this.$refs.audio.play();
    },
    changeTrack(track) {
      this.currentTrack = track;
      this.playMusic(this.currentTrack);
    },
  },
};
</script>
