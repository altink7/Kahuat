<template>
  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div id="error-message" class="alert alert-danger text-center d-none">
          <h1>Error</h1>
          <p>Quiz does not exist.</p>
        </div>
        <div class="input-group mb-3">
          <input type="text" class="form-control" placeholder="Search for a quiz" v-model="searchQuery" />
        </div>
        <div class="input-group-append">
          <button class="btn btn-primary" @click="searchQuiz">Search</button>
        </div>
      </div>
    </div>

    <CategoryComponent @categoryClicked="handleCategoryClicked" />

  </div>
</template>

<script>
import CategoryComponent from "@/components/CategoryComponent.vue";
import axios from "axios";
import { handleError } from "@/services/MessageHandlerService"; // Import the error handling function

export default {
  name: "SearchQuizView",
  data() {
    return {
      searchQuery: "",
      quiz: "",
    };
  },
  methods: {
    searchQuiz() {
      axios
          .get(`http://localhost:8081/api/quizzes/${this.searchQuery}`)
          .then((response) => {
            if (response.status === 200) {
              this.quiz = response.data;
              console.log(this.quiz);

              this.$router.push({
                name: "lobby",
                params: { quizIds: this.quiz.id },
              });
            } else {
              handleError("Quiz does not exist.");
            }
          })
          .catch((error) => {
            console.error("Error while fetching quiz:", error);
            handleError("An error occurred while fetching the quiz.");
          });
    },
    handleCategoryClicked(category) {
      axios
          .get(`http://localhost:8081/api/quizzes/categories/${category.toUpperCase()}`)
          .then((response) => {
            if (response.data.length === 0) {
              // das ist der Fall, wenn keine Quizze fuer die Kategorie gefunden wurden
              handleError("No quizzes found for this category.");
            } else {
              const quizIds = response.data.map((quiz) => quiz.id).join(",");
              this.$router.push({
                name: "lobby",
                params: { quizIds },
              });
            }
          })
          .catch((error) => {
            console.error("Error while fetching quizzes by category:", error);
            handleError("An error occurred while fetching quizzes by category.");
          });
    },
  },
  components: { CategoryComponent },
};
</script>