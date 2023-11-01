<template>
  <div>
    <rankings-molecule :quizId="quizId"></rankings-molecule>
  </div>
</template>

<script>
import RankingsMolecule from "@/components/molecules/RankingsMolecule.vue";
import {useAppStore} from "@/services/store/appStore";

export default {
  components: {
    RankingsMolecule,
  },
  data() {
    const store = useAppStore();
    return {
      quizId: store.getRequestId()
    };
  },
};
</script>
