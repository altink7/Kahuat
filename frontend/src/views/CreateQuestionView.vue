<template>
    <div class="home">
        <h1>Create Question & Answers</h1>
    </div>
    <div>
        <div v-for="index in questionComponentsCount" :key="index">
            <CreateQuestionComponent />
        </div>
        <button class="new-question-button" @click="addQuestion">+</button>
        <div class="container">
            <router-view></router-view>
        </div>
    </div>
</template>
  
<script>
import CreateQuestionComponent from "@/components/CreateQuestionComponent.vue";

export default {
    components: {
        CreateQuestionComponent,
    },
    data() {
        return {
            questionComponentsCount: 1,

        };
    },
    methods: {
        addQuestion() {
            this.questionComponentsCount++;
        },
    },
};
</script>
  