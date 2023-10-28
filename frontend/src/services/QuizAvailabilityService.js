/**
 * Berechnet die verbleibende Zeit bis zum Ablauf des Quizzes
 * @param startDate - Startdatum des Quizzes
 * @returns {string} - Verbleibende Zeit bis zum Ablauf des Quizzes in Tagen/Stunden
 */
export const calculateQuizAvailability = (startDate) => {
    if (startDate) {
        const endDate = new Date(startDate);
        endDate.setTime(endDate.getTime() + 604800000); // Add 1 week in milliseconds
        const remainingTime = endDate.getTime() - Date.now();

        if (remainingTime > 0) {
            const days = Math.floor(remainingTime / (1000 * 60 * 60 * 24));
            const hours = Math.floor((remainingTime % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            return `${days}/${hours}`;
        } else {
            return "Quiz expired";
        }
    }
    return "Unknown";
};
