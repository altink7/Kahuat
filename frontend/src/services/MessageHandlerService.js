/**
 * Funktion um eine Fehlermeldung anzuzeigen.
 * @param errorMessage - Fehlermeldung, die angezeigt werden soll.
 */
export function handleError(errorMessage) {
    const errorMessageElement = document.getElementById('error-message');
    if (errorMessageElement) {
        errorMessageElement.textContent = errorMessage;
        errorMessageElement.classList.remove('d-none');
        setTimeout(() => {
            errorMessageElement.classList.add('d-none');
        }, 3000);
    }
}

/**
 * Funktion um eine Erfolgsmeldung anzuzeigen.
 * @param successMessage - Erfolgsmeldung, die angezeigt werden soll.
 */
export function handleSuccess(successMessage) {
    const successMessageElement = document.getElementById('success-message');
    if (successMessageElement) {
        successMessageElement.textContent = successMessage;
        successMessageElement.classList.remove('d-none');
        setTimeout(() => {
            if (successMessageElement != null) {
                successMessageElement.classList.add('d-none');
            }
        }, 3000);
    }
}
