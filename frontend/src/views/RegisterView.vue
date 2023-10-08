<template>
  <div class="d-flex justify-content-center">
    <div class="card registerForm login-card">
      <div class="card-body">
        <div id="success-message" class="alert alert-success text-center d-none">
          <h1>Success</h1>
          <p>User has been created successfully</p>
        </div>
        <div id="error-message" class="alert alert-danger text-center d-none">
          <h1>Error</h1>
          <p>User registration failed. Please try again later.</p>
        </div>
        <h2 class="card-title text-center">Register</h2>
        <form @submit.prevent="handleSubmit">
          <div class="row mb-2">
            <div class="col-md-2">
              <label for="salutation">Salutation</label>
              <select v-model="user.salutation" class="form-control" id="salutation" name="salutation">
                <option value="MALE">Male</option>
                <option value="FEMALE">Female</option>
                <option value="OTHER">Other</option>
              </select>
            </div>
            <div class="col-md-5">
              <label for="firstName">First Name</label>
              <input v-model="user.firstName" type="text" class="form-control" id="firstName" placeholder="Max">
            </div>
            <div class="col-md-5">
              <label for="lastName">Last Name</label>
              <input v-model="user.lastName" type="text" class="form-control" id="lastName" placeholder="Mustermann">
            </div>
          </div>
          <div class="mb-2">
            <label for="email">E-Mail-Adress</label>
            <input v-model="user.email" type="email" class="form-control" id="email" placeholder="max.muster@gmail.com">
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
              minlength="8">
          </div>
          <div class="mb-2">
            <label for="confirm-password">Confirm Password</label>
            <input v-model="confirmPassword" type="password" class="form-control" id="confirm-password"
              placeholder="********" minlength="8">
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
import axios from 'axios';

export default {
  data() {
    return {
      user: {
        salutation: 'MALE',
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
      if (this.user.password !== this.confirmPassword) {
        document.getElementById('error-message').classList.remove('d-none');
        setTimeout(() => {
          document.getElementById('error-message').classList.add('d-none');
        }, 3000);

        return;
      }

      try {
        const formData = {
          salutation: this.user.salutation,
          firstName: this.user.firstName,
          lastName: this.user.lastName,
          email: this.user.email,
          password: this.user.password,
          country: this.user.country,
          role: 'USER',
        };
        const response = await axios.post('http://localhost:5000/api/users/create', formData);

        if (response.status === 201) {
          document.getElementById('success-message').classList.remove('d-none');
          this.user = {
            salutation: 'MALE',
            firstName: '',
            lastName: '',
            email: '',
            password: '',
            country: 'none',
          };
          this.confirmPassword = '';

          setTimeout(() => {
            document.getElementById('success-message').classList.add('d-none');
            this.goToLogin();
          }, 2000);
        } else {
          document.getElementById('error-message').classList.remove('d-none');
          setTimeout(() => {
            document.getElementById('error-message').classList.add('d-none');
          }, 2000);
        }

      } catch (error) {
        console.error('Error:', error);
        document.getElementById('error-message').classList.remove('d-none');
        setTimeout(() => {
          document.getElementById('error-message').classList.add('d-none');
        }, 2000);
      }
    },
    goToLogin() {
      this.$router.push('/login');
    },
  },
};
</script>