<template>
  <div class="home">
    <h1>Admin Dashboard</h1>
    <div class="container d-flex justify-content-center align-items-center">
      <div class="card searchForm">
        <div class="card-body">
          <div class="admin-filter col-4 mb-3">
            <select class="form-control" v-model="searchFor">
              <option value="none">Search for: -</option>
              <option value="user">Search for: User</option>
              <option value="quiz">Search for: Quiz</option>
            </select>
          </div>
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search..." aria-label="Search"
                   v-model="searchQuery">
            <button class="btn search-button" @click="search">Search</button>
          </div>
        </div>
      </div>
    </div>

    <!-- how the searched user profile should be displayed -->
    <div v-if="fetchedUser">
      <div class="user-container d-flex">
        <div class="user-card">
          <div class="profile-header d-flex align-items-center">
            <img src="../../assets/default-profile-pic.webp" alt="Profile Picture" class="profile-pic" />
            <h1 class="auth-title">Profile</h1>
          </div>
          <form class="auth-form" @submit.prevent="updateUserProfile">
            <div class="row mb-2">
              <div class="from-group col-md-3">
                <label class="form-label" for="salutation">Gender</label>
                <select class="form-control" id="salutation" name="salutation" v-model="fetchedUser.salutation">
                  <option value="none">-</option>
                  <option value="MALE">Male</option>
                  <option value="FEMALE">Female</option>
                  <option value="OTHER">Other</option>
                </select>
              </div>
              <div class="col-md-4">
                <label class="form-label" for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" v-model="fetchedUser.firstName" required>
              </div>
              <div class="col-md-5">
                <label class="form-label" for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" v-model="fetchedUser.lastName" required>
              </div>
            </div>
            <div class="mb-2">
              <label class="form-label" for="email">E-Mail-Adress</label>
              <input type="email" class="form-control" id="email" v-model="fetchedUser.email" required>
            </div>
            <div>
              <label class="form-label" for="country">Country</label>
              <select class="form-control" id="country" name="country" v-model="fetchedUser.country">
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
              <button type="button" class="btn delete-button" @click="deleteUser">Delete Account</button>
            </div>
          </form>
        </div>
      </div>
    </div>

    <!-- Quiz Section -->
    <div v-if="fetchedQuiz" class="quiz-details">
      <div class="button-container justify-content-evenly">
        <div class="quiz-card d-flex flex-column justify-content-center align-items-center">
          {{ fetchedQuiz.id}}
          <div>
            <button class="btn quiz-button">Edit</button>
            <button class="btn quiz-button" @click="deleteQuiz(fetchedQuiz.id)">Delete</button>

          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import EndpointService from "@/services/server/EndpointService";
import {handleError, handleSuccess} from "@/services/MessageHandlerService";

export default {
  data() {
    return {
      searchFor: 'none',
      searchQuery: "",
      quiz: "",
      user: "",
      fetchedQuiz: null,
      fetchedUser: null,
      showPasswordFields: false,
    };
},
  methods: {
    togglePasswordDropdown() {
      this.showPasswordFields = !this.showPasswordFields;
    },
    search() {
      if (this.searchFor === 'quiz') {
        this.searchQuiz();
      } else if (this.searchFor === 'user') {
        this.searchUser();
      }
    },
    searchQuiz() {
      EndpointService.get(`quizzes/${this.searchQuery}`)
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
            handleError("An error occurred while fetching the quiz.");
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
    searchUser() {
      EndpointService.get(`users/${(this.searchQuery)}`)
          .then(response => {
            if (response.status === 200) {
              this.fetchedUser = response.data;
              console.log(this.fetchedUser);
            } else {
              handleError("User does not exist.");
            }
          })
          .catch(error => {
            console.error("Error while fetching user:", error);
            handleError("An error occurred while fetching the user.");
          });
    },

    updateUserProfile() {
      if (this.fetchedUser.password !== this.fetchedUser.confirmPassword) {
        handleError('Passwords do not match.');
        return;
      }

      let updatedUserData = {
        salutation: this.fetchedUser.salutation,
        firstName: this.fetchedUser.firstName,
        lastName: this.fetchedUser.lastName,
        email: this.fetchedUser.email,
        country: this.fetchedUser.country,
      };
      if (this.showPasswordFields) {
        updatedUserData.password = this.user.password;
      }

      EndpointService.put(`users/${this.fetchedUser.id}`, updatedUserData)
          .then(response => {
            if (response.status === 200) {
              handleSuccess("User has been updated successfully");
              console.log('User profile updated successfully.');
              this.fetchedUser = { ...this.fetchedUser, ...response.data };
            } else {
              handleError('Failed to update user profile.');
            }
          })
          .catch(error => {
            console.error('Error while updating user profile:', error);
            handleError('An error occurred while updating the user profile.');
          });
    },
    deleteUser() {
      EndpointService.delete(`users/${this.fetchedUser.id}`)
          .then(response => {
            if (response.status === 200 || response.status === 204) {
              handleSuccess("User has been deleted");
              console.log('User deleted successfully');
              this.fetchedUser = null;
            } else {
              handleError('Failed to delete user.');
            }
          })
          .catch(error => {
            console.error('Error while deleting user:', error);
            handleError('An error occurred while deleting the user.');
          });
    },

  }
};
</script>

