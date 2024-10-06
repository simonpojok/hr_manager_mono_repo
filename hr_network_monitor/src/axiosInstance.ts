import axios from 'axios';

const axiosInstance = axios.create({
    baseURL: 'http://localhost:8000',
    headers: {
        'Content-Type': 'application/json',
    },
});

axiosInstance.interceptors.request.use(
    (config) => {
        console.log(config);
        if (['/api/auth/token/'].includes(config.url as string)) {
            const token = localStorage.getItem('auth_token');
            if (token && JSON.parse(token).access_token) {
                config.headers.Authorization = `Bearer ${JSON.parse(token).access_token}`;
            }
        }

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
        if (error.response && error.response.status === 401) {
            console.error('Unauthorized, logging out...');
        }
        return Promise.reject(error);
    }
);

export default axiosInstance;
