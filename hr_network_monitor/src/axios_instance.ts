import axios from 'axios';

const baseURL = process.env.NEXT_PUBLIC_BASE_URL;

const axiosInstance = axios.create({
    baseURL: baseURL,
    timeout: 10000,
    headers: {
        'Content-Type': 'application/json',
    },
});

export const unAuthAxiosInstance = axios.create({
    baseURL: baseURL,
    timeout: 10000,
    headers: {
        'Content-Type': 'application/json',
    },
});

axiosInstance.interceptors.request.use(
    (config) => {
        const token = localStorage.getItem('auth_token');

        if (token) {
            const credentials = JSON.parse(token);
            config.headers['Authorization'] = `Bearer ${credentials.access}`;
        }

        console.log(config.headers)

        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

axiosInstance.interceptors.response.use(
    (response) => {
        return response;
    },
    (error) => {
        console.error(error);
        if (error.response && error.response.status === 401) {
            console.log('Unauthorized - Redirecting to login');
            localStorage.removeItem('authToken');
            window.location.href = '/login';
        }

        return Promise.reject(error);
    }
);

export default axiosInstance;
