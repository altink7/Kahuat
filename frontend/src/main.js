import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import 'bootstrap/dist/css/bootstrap.min.css';
import './assets/style.css';
import { createPinia } from 'pinia';
import vue3GoogleLogin from 'vue3-google-login'
import { useAppStore} from "@/services/store/appStore";
import {checkAuth} from "@/services/auth/NavGuard";

const app = createApp(App);
const pinia = createPinia();

// navigation guard for routes
checkAuth();

app.use(pinia);
app.use(router);
app.use(vue3GoogleLogin, { clientId: '102228032768-b6b40gt5l4m8mlruc87sbq7rite9jltu.apps.googleusercontent.com' });
app.use((app) => {
    const appStore = useAppStore();
    appStore.initializeApp();
    app.config.globalProperties.$appStore = appStore;
});
app.mount('#app');