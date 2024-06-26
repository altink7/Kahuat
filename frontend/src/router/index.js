import {createRouter, createWebHistory} from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AboutView from '../views/info/AboutView.vue'
import LoginView from '../views/user/LoginView.vue'
import RegisterView from '../views/user/RegisterView.vue'
import CategoryView from '../views/CategoryView.vue'
import QuizView from '../views/quiz/QuizView.vue'
import CreateQuizView from '../views/quiz/CreateQuizView.vue'
import RankingsView from '../views/ranking/QuizRankingsView.vue'
import CreateQuestionView from '../views/quiz/CreateQuestionView.vue'
import SearchQuizView from '../views/quiz/SearchQuizView.vue'
import LobbyView from "../views/quiz/LobbyView.vue";
import FaqView from '../views/info/FaqView.vue'
import ContactView from '../views/info/ContactView.vue'
import UserStatisticView from "@/views/statistic/UserStatisticView.vue";
import UserView from "@/views/user/UserView.vue";
import AdminView from "@/views/user/AdminView.vue";


const routes = [
    {
        path: '/',
        name: 'home',
        component: HomeView
    },
    {
        path: '/about',
        name: 'about',
        component: AboutView
    },
    {
        path: '/login',
        name: 'login',
        component: LoginView
    },
    {
        path: '/register',
        name: 'register',
        component: RegisterView
    },
    {
        path: '/category',
        name: 'category',
        component: CategoryView
    },
    {
        path: '/quiz/:requestId',
        name: 'quiz',
        props: true,
        component: QuizView
    },
    {
        path: '/create-quiz',
        name: 'create-quiz',
        component: CreateQuizView,
        meta: { requiresAuth: true },
    },
    {
        path: '/rankings',
        name: 'rankings',
        component: RankingsView,
        props: (route) => ({requestId: route.query.requestId, points: route.query.points, route: route.query.duration}),
    },
    {
        path: '/create-question',
        name: 'create-question',
        component: CreateQuestionView,
        meta: { requiresAuth: true },
    },
    {
        path: '/search-quiz',
        name: 'search-quiz',
        component: SearchQuizView
    },
    {
        path: '/lobby/:quizIds',
        name: 'lobby',
        component: LobbyView,
        props: true,
    },
    {
        path: '/faq',
        name: 'faq',
        component: FaqView
    },
    {
        path: '/contact',
        name: 'contact',
        component: ContactView
    },
    {
        path: '/user-statistics',
        name: 'user-statistics',
        component: UserStatisticView,
        meta: { requiresAuth: true },
    },
    {
        path: '/user',
        name: 'user',
        component: UserView,
        meta: { requiresAuth: true },
    },
    {
        path: '/admin',
        name: 'admin',
        component: AdminView,
        meta: { requiresAuth: true, requiresAdmin: true },
    }
]

const router = createRouter({
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router