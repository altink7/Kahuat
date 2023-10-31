<template>
  <div class="container d-flex justify-content-center align-items-center">
    <div class="rankings">
      <ol class="list-group list-group-numbered">
        <li class="list-group-item d-flex justify-content-between align-items-start">
          <quiz-info-atom
              :quizId="dataFromStore.requestId"
              :duration="dataFromStore.duration"
              :category="dataFromStore.category"
          ></quiz-info-atom>
          <score-atom :points="dataFromStore.points"></score-atom>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
import { useAppStore } from "@/services/store/appStore";
import QuizInfoAtom from "@/components/atoms/QuizInfoAtom.vue";
import ScoreAtom from "@/components/atoms/ScoreAtom.vue";

export default {
  name: "RankingsMolecule",
  components: {
    QuizInfoAtom,
    ScoreAtom,
  },
  computed: {
    dataFromStore() {
      const store = useAppStore();
      return {
        requestId: this.fromIntOrEmpty(store.getRequestId()),
        points: this.fromIntOrEmpty(store.getPoints()),
        category: this.fromStringOrEmpty(store.getSelectedCategory()),
        duration: this.fromIntOrEmpty(store.getQuizDuration()),
      };
    },
  },
  methods: {
    fromIntOrEmpty(value) {
      if(isNaN(value)) {
        return "";
      }
      return value ? value.toString() : "";
    },
    fromStringOrEmpty(value) {
      if(typeof value !== "string") {
        return "";
      }
      return parseInt(value);
    },
  },
};
</script>
