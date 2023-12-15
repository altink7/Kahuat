<template>
  <div class="rankings-container d-flex justify-content-center align-items-center">
    <div class="rankings">
      <ol class="list-group list-group-numbered">
        <li v-for="participant in participants" :key="participant.id" class="list-group-item d-flex justify-content-between align-items-start">
          <quiz-info-atom
              :duration="participant.participantQuizDuration"
              :nickname="participant.nickname"/>
          <score-atom :points="participant.points"></score-atom>
        </li>
      </ol>
    </div>
  </div>
</template>

<script>
import QuizInfoAtom from "@/components/atoms/QuizInfoAtom.vue";
import ScoreAtom from "@/components/atoms/ScoreAtom.vue";
import EndpointService from "@/services/server/EndpointService";

export default {
  name: "RankingsMolecule",
  props: {
    quizId: {
      type: Number,
      required: true,
    },
  },
  components: {
    QuizInfoAtom,
    ScoreAtom,
  },
  data() {
    return {
      participants: [],
    };
  },
  methods: {
    async fetchParticipants() {
      try {
        console.log("Fetching participants..."+"/quizzes/"+this.quizId+"/participants");
        const response = await EndpointService.get(`quizzes/${this.quizId}/participants`);
        this.participants = response.data;
        console.log("Participants:", this.participants);
      } catch (error) {
        console.error("Error fetching participants:", error);
      }
    },
  },
  mounted() {
    this.fetchParticipants();
  },
};
</script>
