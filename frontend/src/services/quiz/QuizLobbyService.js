import { calculateQuizAvailability } from "@/services/QuizAvailabilityService";
import EndpointService from "@/services/server/EndpointService";

/**
 * Load quiz start dates for an array of quiz IDs.
 *
 * @param {Array} quizIdsArray - An array of quiz IDs.
 * @returns {Object} An object containing quiz start dates.
 */
export async function loadQuizStartDates(quizIdsArray) {
    const quizStartDates = {};

    for (const quizId of quizIdsArray) {
        try {
            const response = await EndpointService.get(`quizzes/${quizId}`);
            console.log("Response: ", response.data);
            quizStartDates[quizId] = calculateQuizAvailability(response.data.startDate, response.data.duration);
        } catch (error) {
            quizStartDates[quizId] = "Availability could not be loaded.";
        }
    }

    return quizStartDates;
}

/**
 * Check if a quiz is expired based on its start date.
 *
 * @param {Object} quizStartDates - An object containing quiz start dates.
 * @param {string} quizId - The ID of the quiz to check.
 * @returns {boolean} True if the quiz is expired, false otherwise.
 */
export function isQuizExpired(quizStartDates, quizId) {
    return quizStartDates[quizId] === "Quiz expired";
}

/**
 * Start a quiz if it's not expired.
 *
 * @param {Object} router - The Vue Router instance.
 * @param {Function} isQuizExpired - A function to check if a quiz is expired.
 * @param {string} quizId - The ID of the quiz to start.
 */
export function startQuiz(router, isQuizExpired, quizId) {
    if (!isQuizExpired(quizId)) {
        router.push({
            name: "quiz",
            params: { requestId: quizId },
        });
    }
}

/**
 * Get the CSS style for a button based on the progress of the quiz start date.
 *
 * @param {string} startDate - The formatted start date of the quiz.
 * @returns {Object} An object representing the CSS style.
 */
export function getButtonStyle(startDate) {
    if (!startDate || startDate === "Loading...") {
        return {};
    }
    const [days, hours] = startDate.split('/');
    const totalHours = parseInt(days) * 24 + parseInt(hours);
    const progress = Math.round((totalHours / 168) * 100);

    const greenColor = '#42b883';
    const redColor = '#ff4d4d';
    const lightGrayColor = 'rgba(0,0,0,0)';

    if (progress < 20) {
        return {
            background: `linear-gradient(to right, ${redColor} ${progress}%, ${lightGrayColor} ${progress}%)`,
        };
    } else {
        return {
            background: `linear-gradient(to right, ${greenColor} ${progress}%, ${lightGrayColor} ${progress}%)`,
        };
    }
}

/**
 * Get a formatted start date to display in the button.
 *
 * @param {string} startDate - The formatted start date of the quiz.
 * @returns {string} The formatted start date as a string.
 */
export function getFormattedStartDate(startDate) {
    if (!startDate) {
        return '';
    }

    if (startDate === "Loading..." || startDate === "Quiz expired") {
        return startDate;
    }

    const [days, hours] = startDate.split('/');

    if (days === '0') {
        return `${hours} hours`;
    } else {
        return `${days} days ${hours} hours`;
    }
}
