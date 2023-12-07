// appStore.js

import { defineStore } from 'pinia';

export const useAppStore = defineStore('appStore', {
    state: () => ({
        selectedCategory: String,
        requestId: Number,
        points: Number,
        quizDuration: Number,
        nickname: String,
        user: null,
        userId: Number,
    }),

    actions: {
        setSelectedCategory(category) {
            this.setAndSave('selectedCategory', category);
        },
        setRequestId(requestId) {
            this.setAndSave('requestId', requestId);
        },
        setPoints(points) {
            this.setAndSave('points', points);
        },
        setQuizDuration(quizDuration) {
            this.setAndSave('quizDuration', quizDuration);
        },
        setNickname(nickname) {
            this.setAndSave('nickname', nickname);
        },
        setUser(user) {
            this.setAndSave('user', user);
        },
        setUserId(userId) {
            this.setAndSave('userId', userId);
        },
        clearUser() {
            this.setAndSave('user', null);
        },
        getSelectedCategory() {
            this.loadFromLocalStorage();
            return this.selectedCategory;
        },
        getRequestId() {
            this.loadFromLocalStorage();
            return this.requestId;
        },
        getPoints() {
            this.loadFromLocalStorage();
            return this.points;
        },
        getQuizDuration() {
            this.loadFromLocalStorage();
            return this.quizDuration;
        },
        getNickname() {
            this.loadFromLocalStorage();
            return this.nickname;
        },
        getUser() {
            this.loadFromLocalStorage();
            return this.user;
        },
        getUserId() {
            this.loadFromLocalStorage();
            return this.userId;
        },

        initializeApp() {
            this.loadFromLocalStorage();
        },

        setAndSave(key, value) {
            this[key] = value;
            this.saveToLocalStorage();
        },

        saveToLocalStorage() {
            const stateData = this.$state;
            localStorage.setItem('appStore', JSON.stringify(stateData));
        },

        loadFromLocalStorage() {
            try {
                const savedState = localStorage.getItem('appStore');
                if (savedState) {
                    this.$state = JSON.parse(savedState);
                }
            } catch (error) {
                console.error('Error loading from localStorage:', error);
            }
        },
    },
});
