import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import AboutView from '../views/info/AboutView.vue'
import LoginView from '../views/user/LoginView.vue'
import RegisterView from '../views/user/RegisterView.vue'
import CategoryView from '../views/CategoryView.vue'
import QuizView from '../views/quiz/QuizView.vue'
import CreateQuizView from '../views/quiz/CreateQuizView.vue'
import RankingsView from '../views/RankingsView.vue'
import CreateQuestionView from '../views/quiz/CreateQuestionView.vue'
import SearchQuizView from '../views/quiz/SearchQuizView.vue'
import LobbyView from "../views/quiz/LobbyView.vue";
import PrivacyView from '../views/info/PrivacyView.vue'
import FaqView from '../views/info/FaqView.vue'
import ImprintView from '../views/info/ImprintView.vue'
import ContactView from '../views/info/ContactView.vue'


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
    component: CreateQuizView
  },
  {
    path: '/rankings',
    name: 'rankings',
    component: RankingsView,
    props: (route) => ({ requestId: route.query.requestId, points: route.query.points }),
  },
  {
    path: '/create-question',
    name: 'create-question',
    component: CreateQuestionView
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
    path: '/privacy',
    name: 'privacy',
    component: PrivacyView
  },
  {
    path: '/faq',
    name: 'faq',
    component: FaqView
  },
  {
    path: '/imprint',
    name: 'imprint',
    component: ImprintView
  },
  {
    path: '/contact',
    name: 'contact',
    component: ContactView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
