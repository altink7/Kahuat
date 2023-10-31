import { defineStore } from 'pinia';

export const useAppStore = defineStore('appStore', {
    state: () => ({
        selectedCategory: String,
        requestId: Number,
        points: Number,
        quizDuration: Number,
    }),

    actions: {
        setSelectedCategory(category) {
            this.selectedCategory = category;
        },
        getSelectedCategory() {
            return this.selectedCategory;
        },
        setRequestId(requestId) {
            this.requestId = requestId;
        },
        getRequestId() {
            return this.requestId;
        },
        setPoints(points) {
            this.points = points;
        },
        getPoints() {
            return this.points;
        },
        setQuizDuration(quizDuration) {
            this.quizDuration = quizDuration;
        },
        getQuizDuration() {
            return this.quizDuration;
        },
    },
});
