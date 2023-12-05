<template>
  <div v-if="user == null">
    <h1>Statistics</h1>
    <p>You need to be logged in to see the Statistics.</p>
  </div>
  <div v-else>
    <div class="home">
      <h1>Energize Your Education!</h1>
    </div>
      <div v-if="statistic">
        <p>Number of quizzes played: {{ statistic.playedQuizzes }}</p>
        <p>Number of average Points per Quiz: {{ statistic.averagePointsPerQuiz }}</p>
        <p>Number of average Points per Question: {{ statistic.averagePointsPerQuestion }}</p>
        <p>Favorite Category: {{ statistic.favoriteCategory }}</p>
        <p>Most played Category: {{ statistic.mostPlayedCategory }}</p>
        <hr>
        <div>
          <p>Points Per Category:</p>
          <ul>
            <li v-for="(points, category) in statistic.pointsPerCategory" :key="category">
              {{ category }}: {{ points }}
            </li>
          </ul>
        </div>

        <div>
          <p>Average Points Per Category:</p>
          <ul>
            <li v-for="(averagePoints, category) in statistic.averagePointsPerCategory" :key="category">
              {{ category }}: {{ averagePoints }}
            </li>
          </ul>
        </div>
      </div>
      <div v-else>
        <p>Loading statistics...</p>
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
