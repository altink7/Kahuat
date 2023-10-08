<template>
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div id="error-message" class="alert alert-danger text-center d-none">
            <h1>Error</h1>
            <p>Quiz does not exist.</p>
          </div>
          <div class="input-group mb-3">
            <input
              type="text"
              class="form-control"
              placeholder="Search for a quiz"
              v-model="searchQuery"/>
          </div>
          <div class="input-group-append">
              <button class="btn btn-primary" @click="searchQuiz">Search</button>
            </div>
        </div>
      </div>
      
      <CategoryComponent />

    </div>
  </template>

<script>
import CategoryComponent from "@/components/CategoryComponent.vue";
import axios from "axios";

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
              .get(`http://localhost:5000/api/quizzes/${this.searchQuery}`)
              .then((response) => {
                if(response.status == 200){
                  this.quiz = response.data;
                  console.log(this.quiz)

                  this.$router.push({
                    name: "quiz",
                    params: { requestId: this.quiz.id },
                  });

                }
                else{
                  document.getElementById('error-message').classList.remove('d-none');
                  setTimeout(() => {
                    if(document.getElementById('error-message') != null){
                      document.getElementById('error-message').classList.add('d-none');
                    }
                  }, 3000);
                }
            })
            .catch((error) => {
              console.error("Error while fetching quiz:", error);
              document.getElementById('error-message').classList.remove('d-none');
                setTimeout(() => {
                    if(document.getElementById('error-message') != null){
                      document.getElementById('error-message').classList.add('d-none');
                    }
                }, 3000);
            });
        }, 
    },
    components: { CategoryComponent }
};
</script>

  