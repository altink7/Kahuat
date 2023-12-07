<template>
  <div class="container">
    <div class="row">
      <div class="col-8">
        <div class="user-container">
          <div class="user-card">
            <div class="profile-header d-flex align-items-center">
              <img src="../../assets/default-profile-pic.webp" alt="Profile Picture" class="profile-pic" />
              <h1 class="auth-title">Profile</h1>
            </div>
            <form class="auth-form" @submit.prevent="updateUserProfile">

              <div class="row mb-2">
                <div class="form-group col-md-3">
                  <label class="form-label" for="salutation">Gender</label>
                  <select  class="form-control" id="salutation">
                    <option value="none">-</option>
                    <option value="MALE">Male</option>
                    <option value="FEMALE">Female</option>
                    <option value="OTHER">Other</option>
                  </select>
                </div>

                <div class="col-md-4">
                  <label class="form-label" for="firstName">First Name</label>
                  <input type="text"  class="form-control" id="firstName" placeholder="Max" required>
                </div>

                <div class="col-md-5">
                  <label class="form-label" for="lastName">Last Name</label>
                  <input type="text"  class="form-control" id="lastName" placeholder="Mustermann" required>
                </div>
              </div>

              <div class="mb-2">
                <label class="form-label" for="email">E-Mail Address</label>
                <input type="email"  class="form-control" id="email" placeholder="max.mustermann@gmail.com" required>
              </div>

              <div>
                <label class="form-label" for="country">Country</label>
                <select class="form-control" id="country">
                  <option value="none">-</option>
                  <option value="AT">Austria</option>
                  <option value="BE">Belgium</option>
                  <option value="BG">Bulgaria</option>
                  <option value="DK">Denmark</option>
                  <option value="DE">Germany</option>
                  <option value="EE">Estonia</option>
                  <option value="FI">Finland</option>
                  <option value="FR">France</option>
                  <option value="GR">Greece</option>
                  <option value="IE">Ireland</option>
                  <option value="IT">Italy</option>
                  <option value="LV">Latvia</option>
                  <option value="LT">Lithuania</option>
                  <option value="LU">Luxembourg</option>
                  <option value="MT">Malta</option>
                  <option value="NL">Netherlands</option>
                  <option value="PL">Poland</option>
                  <option value="PT">Portugal</option>
                  <option value="RO">Romania</option>
                  <option value="SE">Sweden</option>
                  <option value="SK">Slovakia</option>
                  <option value="SI">Slovenia</option>
                  <option value="ES">Spain</option>
                  <option value="CZ">Czech Republic</option>
                  <option value="HU">Hungary</option>
                  <option value="GB">Great Britain</option>
                  <option value="CY">Cyprus</option>
                </select>
              </div>

              <div>
                <label class="form-label password-toggle" :class="{ open: showPasswordFields }" @click="togglePasswordDropdown">
                  Change Password
                </label>
                <div v-if="showPasswordFields">
                  <div class="mb-2">
                    <label class="form-label" for="password">New Password</label>
                    <input type="password"  class="form-control" id="password" placeholder="********" minlength="8" required>
                  </div>
                  <div class="mb-2">
                    <label class="form-label" for="confirm-password">Confirm New Password</label>
                    <input type="password" class="form-control" id="confirm-password" placeholder="********" minlength="8" required>
                  </div>
                </div>
              </div>

              <div class="form-actions">
                <button type="submit" class="btn update-button">Update Profile</button>
                <button type="button" class="btn delete-button">Delete Account</button>
              </div>
            </form>
          </div>
        </div>
      </div>

      <div class="col-4 search-bar">
        <div class="card">
          <div class="card-body">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Search for my quizzes"
                     aria-label="Search for quizzes" v-model="searchQuery">
              <button class="btn search-button" @click="searchQuiz">Search</button>
            </div>
          </div>
        </div>
        <!-- ToDo: Should be a molecule -->
        <div class="button-container justify-content-evenly">
          <div class="quiz-card d-flex flex-column justify-content-center align-items-center">
            Quiz id
            <div>
              <button class="btn quiz-button">Play</button>
              <button class="btn quiz-button">Edit</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { handleError } from "@/services/MessageHandlerService";
import EndpointService from "@/services/server/EndpointService";


export default {
  name: "UserView",
  data() {
    return {
      searchQuery: "",
      quiz: "",
      showPasswordFields: false,
    };
  },
  methods: {
    togglePasswordDropdown() {
      this.showPasswordFields = !this.showPasswordFields;
    },
    searchQuiz() {
      EndpointService.get(`quizzes/${this.searchQuery}`)
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
  },
};
</script>
