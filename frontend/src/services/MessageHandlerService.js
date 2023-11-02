import { createToaster } from "@meforma/vue-toaster";

const toaster = createToaster({ /* options */ });


/**
 * Funktion um eine Fehlermeldung anzuzeigen.
 * @param errorMessage - Fehlermeldung, die angezeigt werden soll.
 */
export function handleError(errorMessage) {

    toaster.error(errorMessage, {
        position: "top",
        duration: false,
        queue: true,
        max: 1
    })
}

/**
 * Funktion um eine Erfolgsmeldung anzuzeigen.
 * @param successMessage - Erfolgsmeldung, die angezeigt werden soll.
 */
export function handleSuccess(successMessage) {
    toaster.success(successMessage, {
        position: "top",
        duration: false,
        queue: true,
        max: 1
    })
}
