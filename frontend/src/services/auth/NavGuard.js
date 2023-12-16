import router from "@/router";
import {useAppStore} from "@/services/store/appStore";
import {handleError} from "@/services/MessageHandlerService";

/**
 * This function checks if the user is logged in and if the user has the role ADMIN.
 * If the user is not logged in, he will be redirected to the login page.
 * If the user is logged in, but does not have the role ADMIN, he will be redirected to the home page.
 */
export function checkAuth() {
    router.beforeEach((to, from, next) => {
        const store = useAppStore();
        const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
        const requiresAdmin = to.matched.some(record => record.meta.requiresAdmin);
        const user = store.getUser() == null ? null : store.getUser();

        // ist der User nicht eingeloggt und die Seite erfordert Authentifizierung
        // wird er auf die Login-Seite weitergeleitet
        if (requiresAuth && !user) {
            next({name: 'login'});
            handleError("You must be logged in to see this page.");
        } else {
            // ist der User eingeloggt, hat aber nicht die Rolle ADMIN und die Seite erfordert Admin-Rechte
            // wird er auf die Home-Seite weitergeleitet, ohne Fehlermeldung anzuzeigen,
            // da er nie auf diese Seite gelangen sollte
            const admin = user == null ? false : user.role == null ? false : user.role === "ADMIN";
            if (requiresAdmin && !admin) {
                next({name: 'home'});
            }

            next();
        }
    });
}