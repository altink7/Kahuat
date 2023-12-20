<template>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="input-group mb-3">
          <input type="text" class="form-control form-control-game-pin" placeholder="Game PIN" v-model="searchQuery" />
          <div class="input-group-append">
            <button class="btn btn-primary" @click="searchQuiz">Enter</button>
          </div>
        </div>
        <button class="btn btn-secondary" @click="generateQRCode">Generate QR Code</button>
      </div>
    </div>

    <div v-if="!showQRCode">
      <CategoryMolecule @categoryClicked="handleCategoryClicked" />
    </div>

    <div v-else class="qr-code-container">
      <img :src="qrCodeImageUrl" alt="QR Code" class="qr-code" />
    </div>
  </div>
</template>

<script>
import CategoryMolecule from "@/components/molecules/CategoryMolecule.vue";
import { handleError } from "@/services/MessageHandlerService";
import EndpointService from "@/services/server/EndpointService";
import QRCode from "qrcode";

export default {
  name: "SearchQuizView",
  data() {
    return {
      searchQuery: "",
      quiz: "",
      showQRCode: false,
      qrCodeImageUrl: "",
    };
  },
  methods: {
    searchQuiz() {
      EndpointService.get(`quizzes/${this.searchQuery}`)
        .then((response) => {
          if (response.status === 200) {
            this.quiz = response.data;
            console.log(this.quiz);

              this.$router.push({
                name: "lobby",
                params: {quizIds: this.quiz.id},
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
    generateQRCode() {
      EndpointService.get(`quizzes/${this.searchQuery}`)
          .then((response) => {
            if (response.status === 200) {
              this.quiz = response.data;
              const frontendWebURL = process.env.FRONTEND_WEB_URL || "http://localhost:8080";
              const qrCodeURL = `${frontendWebURL}/lobby/${this.quiz.id}`;

              QRCode.toDataURL(qrCodeURL, (err, url) => {
                if (err) {
                  console.error("Error while generating QR code:", err);
                  handleError("An error occurred while generating QR code.");
                } else {
                  this.qrCodeImageUrl = url;
                  this.showQRCode = true;
                }
              });

            } else {
              handleError("No quiz found. Generate QR Code is only available when a quiz exists.");
            }
          })
          .catch((error) => {
            console.error("Error while fetching quiz:", error);
            handleError("An error occurred while fetching the quiz.");
          });
    },
    handleCategoryClicked(category) {
      EndpointService.get(`quizzes/categories/${category.toUpperCase()}`)
        .then((response) => {
          if (response.data.length === 0) {
            // This is the case when no quizzes were found for the category
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
  components: { CategoryMolecule },
};
</script>
