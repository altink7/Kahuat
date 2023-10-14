import axios from "axios";

const BASE_URL = "http://localhost:8081/api";

/**
 * Service for making API calls
 * @type {{get(*): *, post(*, *): *, put(*, *): *, delete(*): *}}
 * @private {string} BASE_URL - The base URL for the API
 */
export default {

    /**
     * Get data from the API
     */
    get(endpoint) {
        return axios
            .get(`${BASE_URL}/${endpoint}`);
    },

    /**
     * Post data to the API
     */
    post(endpoint, data) {
        return axios
            .post(`${BASE_URL}/${endpoint}`, data);
    },

    /**
     * Put data to the API
     */
    put(endpoint, data) {
        return axios
            .put(`${BASE_URL}/${endpoint}`, data);
    },

    /**
     * Delete data from the API
     */
    delete(endpoint) {
        return axios
            .delete(`${BASE_URL}/${endpoint}`);
    }

};
