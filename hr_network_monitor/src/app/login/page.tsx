'use client';

import React, {useState} from "react";
import {Formik, Field, Form, ErrorMessage} from 'formik';
import * as Yup from 'yup';
import {UserIcon} from "@heroicons/react/16/solid";
import {useRouter} from "next/navigation";
import {unAuthAxiosInstance} from "@/axios_instance";

const LoginPage = () => {
    const router = useRouter();
    const [isLoading, setIsLoading] = useState<boolean>(false);
    const [error, setError] = useState<Error | null>(null);
    const [credential, setCredentials] = useState(null);

    const handleLoginUser = (credential: { username: string, password: string }) => {
        setIsLoading(true);
        unAuthAxiosInstance.post('/api/auth/token/', credential)
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

    if (credential) {
        router.push('/dashboard');
    }

    console.log(error)

    return (
        <div className="flex justify-center items-center h-screen bg-gray-100">
            <div className="w-full max-w-sm p-6 bg-white rounded-lg shadow-md">
                <div className="flex justify-center mb-6">
                    <div className="bg-blue-100 p-4 rounded-full">
                        <UserIcon className="h-12 w-12 text-blue-500"/>
                    </div>
                </div>
                <Formik
                    initialValues={{username: '', password: ''}}
                    validationSchema={Yup.object({
                        username: Yup.string()
                            .max(15, 'Must be 15 characters or less')
                            .required('Username is required'),
                        password: Yup.string()
                            .min(6, 'Password must be at least 6 characters')
                            .required('Password is required'),
                    })}
                    onSubmit={(values) => {
                        handleLoginUser(values);
                    }}
                >
                    {() => (
                        <Form>
                            <div className="mb-4">
                                <label htmlFor="username" className="block text-sm font-medium text-gray-700">
                                    Username
                                </label>
                                <Field
                                    name="username"
                                    type="text"
                                    className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                />
                                <ErrorMessage name="username" component="div" className="text-red-500 text-sm mt-1"/>
                            </div>

                            <div className="mb-4">
                                <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                                    Password
                                </label>
                                <Field
                                    name="password"
                                    type="password"
                                    className="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                                />
                                <ErrorMessage name="password" component="div" className="text-red-500 text-sm mt-1"/>
                            </div>

                            <div>
                                <button
                                    type="submit"
                                    disabled={isLoading}
                                    className="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
                                >
                                    {isLoading ? 'Logging in...' : 'Login'}
                                </button>
                            </div>
                        </Form>
                    )}
                </Formik>
            </div>
        </div>
    );
}

export default LoginPage;
