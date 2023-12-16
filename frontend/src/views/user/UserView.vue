<template>
  <div class="container">
    <div class="row">
      <div v-if="editQuizVisible" class="col-8">
        <div class="user-container">
          <div class="user-card">
            <div class="profile-header d-flex align-items-center">
              <h1 class="auth-title">Edit Quiz</h1>
            </div>
            <form class="auth-form" @submit.prevent="saveQuizChanges">
              <!-- Date Input -->
              <div class="mb-3">
                <label for="editQuizDate" class="form-label">Select Start Date</label>
                <input type="date" class="form-control" id="editQuizDate" v-model="fetchedQuiz.editQuizDate">
              </div>

              <!-- Duration Input -->
              <div class="mb-3">
                <label for="editQuizDuration" class="form-label">Enter Duration (in days)</label>
                <input type="number" class="form-control" id="editQuizDuration" v-model="fetchedQuiz.editQuizDuration">
              </div>

              <div class="form-actions">
                <button type="submit" class="btn update-button">Save Changes</button>
                <button type="button" class="btn cancel-button" @click="cancelEditQuiz">Cancel</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="col-8" v-else-if="user.firstName">
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
                  <select  v-model="user.salutation" class="form-control" id="salutation">
                    <option value="none">-</option>
                    <option value="MALE">Male</option>
                    <option value="FEMALE">Female</option>
                    <option value="OTHER">Other</option>
                  </select>
                </div>

                <div class="col-md-4">
                  <label class="form-label" for="firstName">First Name</label>
                  <input type="text" class="form-control" id="firstName" v-model="user.firstName" placeholder="Max" required>
                </div>

                <div class="col-md-5">
                  <label class="form-label" for="lastName">Last Name</label>
                  <input type="text"  class="form-control" id="lastName" v-model="user.lastName"  placeholder="Mustermann" required>
                </div>
              </div>

              <div class="mb-2">
                <label class="form-label" for="email">E-Mail Address</label>
                <input type="email"  class="form-control" id="email" v-model="user.email"  placeholder="max.mustermann@gmail.com" required>
              </div>

              <div>
                <label class="form-label" for="country">Country</label>
                <select v-model="user.country"  class="form-control" id="country">
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
                    <input type="password"  v-model="user.password" class="form-control" id="password" placeholder="********" minlength="8" required>
                  </div>
                  <div class="mb-2">
                    <label class="form-label" for="confirm-password">Confirm New Password</label>
                    <input type="password" v-model="user.confirmPassword" class="form-control" id="confirm-password" placeholder="********" minlength="8" required>
                  </div>
                </div>
              </div>

              <div class="form-actions">
                <button type="submit" class="btn update-button">Update Profile</button>
                <button type="button" class="btn delete-button" @click="deleteUser">Delete Account</button>
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
        <div v-if="fetchedQuiz" class="quiz-details">
        <div class="button-container justify-content-evenly">
          <div class="quiz-card d-flex flex-column justify-content-center align-items-center">
            {{ fetchedQuiz.id}}
            <div>
              <button class="btn quiz-button" @click="editQuiz()"> Edit</button>
              <button class="btn quiz-button" @click="deleteQuiz(fetchedQuiz.id)">Delete</button>

            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>
</template>

<script>
import {handleError, handleSuccess} from "@/services/MessageHandlerService";
import EndpointService from "@/services/server/EndpointService";
import {useAppStore} from "@/services/store/appStore";
import router from "@/router";

export default {
  name: "UserView",
  data() {
    return {
      searchQuery: "",
      quiz: "",
      fetchedQuiz: null,
      showPasswordFields: false,
      user: {
        id: null,
        salutation: "",
        firstName: "",
        lastName: "",
        email: "",
        country: "",
        password: "",
        confirmPassword: "",
      },
      editQuizVisible: false,
      updateQuizData: {
        startDate: "",
        duration: 0,
      },
    };
  },
  created() {
    this.loadUserData();
  },
  methods: {
    togglePasswordDropdown() {
      this.showPasswordFields = !this.showPasswordFields;
    },

    loadUserData() {
      const appStore = useAppStore();
      const userData = appStore.getUser();

      if (userData) {
        this.user.id = userData.id;
        this.user.salutation = userData.salutation;
        this.user.firstName = userData.firstName;
        this.user.lastName = userData.lastName;
        this.user.email = userData.email;
        this.user.country = userData.country;
      } else {
        console.error('No user data found in appStore');
      }
    },

    updateUserProfile() {
      if (this.showPasswordFields && this.user.password !== this.user.confirmPassword) {
        handleError('Passwords do not match.');
        return;
      }

      let updatedUserData = {
        salutation: this.user.salutation,
        firstName: this.user.firstName,
        lastName: this.user.lastName,
        email: this.user.email,
        country: this.user.country,
      };

      if (this.showPasswordFields) {
        updatedUserData.password = this.user.password;
      }

      EndpointService.put(`users/${this.user.id}`, updatedUserData)
          .then(response => {
            if (response.status === 200) {
              const appStore = useAppStore();
              appStore.setUser(response.data);
              this.user = { ...this.user, ...response.data };
              handleSuccess("User has been updated successfully");
              console.log('Profile updated successfully.');
            } else {
              handleError('Failed to update profile.');
            }
          })
          .catch(error => {
            console.error('Error while updating profile:', error);
            handleError('An error occurred while updating the profile.');
          });
    },

    deleteUser() {
      if (confirm("Are you sure you want to delete your account? This action cannot be undone.")) {
        EndpointService.delete(`users/${this.user.id}`)
            .then(response => {
              if (response.status === 200 || response.status === 204) {
                console.log("Account deleted successfully.");
                this.logout();
                handleSuccess("Account deleted successfully.");
              } else {
                handleError("Error deleting account.");
              }
            })
            .catch(error => {
              console.error("Error deleting account:", error);
              handleError("An error occurred while deleting the account.");
            });
      }
    },
    logout() {
      useAppStore().setUser(null);
      router.afterEach(() => {
        location.reload();
      });
      this.$router.push({
        name: "home",
      });
    },

    searchQuiz() {
      let email = useAppStore().getUser().email ?? "";
      EndpointService.get(`quizzes/creator/${email}/${this.searchQuery}`)
          .then((response) => {
            if (response.status === 200) {
              this.fetchedQuiz = response.data;
              console.log(this.fetchedQuiz);
            } else {
              handleError("Quiz does not exist.");
            }
          })
          .catch((error) => {
            console.error("Error while fetching quiz:", error);
            handleError("Quiz not found.");
          });
    },

    deleteQuiz(quizId) {
      EndpointService.delete(`quizzes/${quizId}`)
          .then(response => {
            if (response.status === 200 || response.status === 204) {
              console.log('Quiz deleted successfully');
              handleSuccess("Quiz deleted successfully");
            } else {
              handleError('Failed to delete quiz.');
            }
          })
          .catch(error => {
            console.error('Error while deleting quiz:', error);
            handleError('An error occurred while deleting the quiz.');
          });
    },
    editQuiz() {
      console.log("edit quiz");
      this.editQuizVisible = true;
      console.log("edit quiz visible: " + this.editQuizVisible);
    },
    cancelEditQuiz() {
      this.editQuizVisible = false;
    },
    saveQuizChanges() {
      // Validate and save quiz changes
      if (this.validateQuiz()) {
        const quizId = this.fetchedQuiz.id;

        this.updateQuizData.startDate = this.fetchedQuiz.editQuizDate;
        this.updateQuizData.duration = this.fetchedQuiz.editQuizDuration;

        // Continue with your save logic...
        EndpointService.put(`quizzes/${quizId}/startDate/${this.updateQuizData.startDate}/duration/${this.updateQuizData.duration}`)

            .then((response) => {
              if (response.status === 200) {
                console.log('Quiz updated successfully');
                handleSuccess("Quiz updated successfully");
                this.cancelEditQuiz();
              } else {
                handleError('Failed to update quiz.');
              }
            })
            .catch((error) => {
              console.error('Error while updating quiz:', error);
              handleError('An error occurred while updating the quiz.');
            });
      }
    },

    validateQuiz() {
      if (this.fetchedQuiz.editQuizDate === "") {
        handleError("Please select a date");
        return false;
      }

      if (this.fetchedQuiz.editQuizDuration === "") {
        handleError("Please enter a duration");
        return false;
      }

      let today = new Date();
      let startDate = new Date(this.fetchedQuiz.editQuizDate);
      if (startDate > today) {
        handleError("Start date should not be in the future");
        return false;
      }

      return true;
    },
  },
};
</script>
