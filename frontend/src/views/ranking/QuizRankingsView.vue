<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Search for a quiz" v-model="searchQuery" />
        </div>
        <div class="input-group-append">
          <button class="btn btn-primary" @click="searchQuizOnInputChange">Search</button>
        </div>
      </div>
    </div>

    <rankings-molecule :key="quizId" :quizId="quizId"></rankings-molecule>
  </div>
</template>

<script>
import RankingsMolecule from "@/components/molecules/RankingsMolecule.vue";
import { useAppStore } from "@/services/store/appStore";
import EndpointService from "@/services/server/EndpointService";
import { handleError, handleSuccess } from "@/services/MessageHandlerService";

export default {
  components: {
    RankingsMolecule,
  },
  methods: {
    searchQuiz() {
      EndpointService.get(`quizzes/${this.searchQuery}/participants`)
          .then((response) => {
            if (response.status === 200) {
              this.quizId = this.searchQuery;
              handleSuccess("Quiz found. Rankings are displayed below.");
            } else {
              handleError("Quiz does not exist.");
            }
          })
          .catch((error) => {
            console.error("Error while fetching quiz:", error);
            handleError("An error occurred while fetching the quiz.");
          });
    },
    searchQuizOnInputChange() {
      if (this.isValidNumber(this.searchQuery)) {
        this.searchQuiz();
      }
    },
    isValidNumber(value) {
      return !isNaN(value);
    },
  },
  data() {
    const store = useAppStore();
    return {
      quizId: store.getRequestId(),
      searchQuery: "",
    };
  },
};
</script>
