<template>
  <div class="d-flex justify-content-center">
    <div class="card registerForm login-card">
      <div class="card-body">
        <h2 class="card-title text-center">Register</h2>
        <form @submit.prevent="handleSubmit">
          <div class="row mb-2">
            <div class="col-md-2">
              <label for="salutation">Salutation</label>
              <select v-model="user.salutation" class="form-control" id="salutation" name="salutation">
                <option value="none">-</option>
                <option value="MALE">Male</option>
                <option value="FEMALE">Female</option>
                <option value="OTHER">Other</option>
              </select>
            </div>
            <div class="col-md-5">
              <label for="firstName">First Name</label>
              <input v-model="user.firstName" type="text" class="form-control" id="firstName" placeholder="Max" required>
            </div>
            <div class="col-md-5">
              <label for="lastName">Last Name</label>
              <input v-model="user.lastName" type="text" class="form-control" id="lastName" placeholder="Mustermann" required>
            </div>
          </div>
          <div class="mb-2">
            <label for="email">E-Mail-Adress</label>
            <input v-model="user.email" type="email" class="form-control" id="email" placeholder="max.muster@gmail.com"
              required>
          </div>
          <div>
            <label for="country">Country</label>
            <select v-model="user.country" class="form-control" id="country" name="country">
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
          <div class="mb-2">
            <label for="password">Password</label>
            <input v-model="user.password" type="password" class="form-control" id="password" placeholder="********"
              minlength="8" required>
          </div>
          <div class="mb-2">
            <label for="confirm-password">Confirm Password</label>
            <input v-model="confirmPassword" type="password" class="form-control" id="confirm-password"
              placeholder="********" minlength="8" required>
          </div>
          <br>
          <div class="mb-2">
            <button type="submit" class="form-control btn btn-primary card-button">Register</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { registerUser } from "@/services/user/UserRegisterService";

export default {
  data() {
    return {
      user: {
        salutation: 'none',
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        country: 'none',
      },
      confirmPassword: '',
    };
  },
  methods: {
    async handleSubmit() {
      await registerUser(this.user, this.confirmPassword, this.$router).then((result) => {
        if (result) {
          this.goToLogin();
        }
      });
    },
    goToLogin() {
      setTimeout(() => {
        this.$router.push({
          name: "login",
        });
      }, 3000);
    },
  },
};
</script>
