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
