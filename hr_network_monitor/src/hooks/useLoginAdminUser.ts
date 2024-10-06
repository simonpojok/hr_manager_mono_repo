import {useState} from "react";
import axiosInstance from "../axiosInstance.ts";

const useLoginAdminUser = () => {
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [error, setError] = useState<Error | null>(null);
    const [credential, setCredentials] = useState({});

    const handleLoginUser = (credential: {username: string, password: string}) => {
        setIsLoading(true);
        axiosInstance.post('/api/auth/token/', credential)
            .then((res) => res.data)
            .then((data) => {
                setCredentials(data);
                localStorage.setItem("auth_token", JSON.stringify(data));
                setIsLoading(false);
            })
            .catch((err) => {
                setError(err);
                setIsLoading(false);
            })

    }

    return {handleLoginUser, isLoading, error, credential}
}

export default useLoginAdminUser;
