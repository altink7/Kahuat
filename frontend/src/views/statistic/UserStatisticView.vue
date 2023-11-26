<template>
  <div v-if="user == null">
    <h1>Statistics</h1>
    <p>You need to be logged in to see the Statistics.</p>
  </div>
  <div v-else>
    <div class="home">
      <h1>Energize Your Education!</h1>
      <div v-if="statistic">
        <div v-for="(value, key) in statistic" :key="key">
          <strong>{{ key }}:</strong> {{ value }}
        </div>
      </div>
      <div v-else>
        <p>Loading statistics...</p>
      </div>
    </div>
  </div>
</template>

<script>
import EndpointService from "@/services/server/EndpointService";
import {useAppStore} from "@/services/store/appStore";

export default {
  data() {
    return {
      user: useAppStore().getUser(),
      statistic: null,
    };
  },
  mounted() {
    this.fetchStatistics();
  },
  methods: {
    fetchStatistics() {
      if(this.user == null) {
        return;
      }

      EndpointService.get('users/emails/' + this.user.email)
          .then((response) => {
            EndpointService.get('users/statistics/' + response.data.id)
                .then((response) => {
                  this.statistic = response.data;
                })
                .catch((error) => {
                  console.log(error);
                });
          })
          .catch((error) => {
            console.log(error);
          });
    },
  },
};
</script>
