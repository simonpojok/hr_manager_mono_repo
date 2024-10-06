'use client';

import {useEffect, useState} from "react";
import {INetworkRequest} from "@/types/network_statistic/network_request";
import {INetworkRequestLogData} from "@/types/network_statistic/network_request_log";
import axiosInstance from "@/axios_instance";

const NetworkLogDashboardPage = () => {
    const [selectedRequest, setSelectedRequest] = useState<INetworkRequest | null>(null);
    const [data, setData] = useState<INetworkRequestLogData | null>(null);

    useEffect(() => {
        axiosInstance.get('/api/statistics/requests')
            .then(res => res.data)
            .then(data => {
                setData(data)
            })
    }, [])

    return (
        <div className="p-4 w-[80vw] mx-auto"> {/* This line centers and makes width 80% of the viewport */}
            {/* Statistics Section */}
            <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
                <div className="bg-blue-100 text-blue-700 p-4 rounded-lg shadow-md text-center">
                    <h2 className="text-2xl font-bold">{data?.results.successful_requests_count}</h2>
                    <p>Successful Requests</p>
                </div>
                <div className="bg-red-100 text-red-700 p-4 rounded-lg shadow-md text-center">
                    <h2 className="text-2xl font-bold">{data?.results.failed_requests_count}</h2>
                    <p>Failed Requests</p>
                </div>
                <div className="bg-green-100 text-green-700 p-4 rounded-lg shadow-md text-center">
                    <h2 className="text-2xl font-bold">{data?.results.total_requests_count}</h2>
                    <p>Total Requests</p>
                </div>
            </div>

            {/* HTTP Methods Horizontal List */}
            <div className="mb-6">
                <h3 className="text-lg font-semibold mb-2">Requests by HTTP Method</h3>
                <div className="flex overflow-x-auto space-x-4">
                    {data?.results.requests_by_method.map((methodData) => (
                        <div key={methodData.method}
                             className="bg-gray-100 p-4 rounded-lg shadow-md min-w-[120px] text-center">
                            <h4 className="text-xl font-bold">{methodData.method}</h4>
                            <p className="text-blue-500 text-lg">{methodData.count}</p>
                        </div>
                    ))}
                </div>
            </div>

            {/* Request List */}
            <div className="overflow-x-auto">
                <table className="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                    <thead className="bg-gray-200">
                    <tr>
                        <th className="text-left py-2 px-4">ID</th>
                        <th className="text-left py-2 px-4">Method</th>
                        <th className="text-left py-2 px-4">Path</th>
                        <th className="text-left py-2 px-4">Status</th>
                        <th className="text-left py-2 px-4">Timestamp</th>
                        <th className="text-left py-2 px-4">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    {data?.results.requests.map((request) => (
                        <tr
                            key={request.id}
                            className="hover:bg-gray-100 cursor-pointer"
                            onClick={() => setSelectedRequest(request)}
                        >
                            <td className="py-2 px-4">{request.id}</td>
                            <td className="py-2 px-4">{request.method}</td>
                            <td className="py-2 px-4">{request.path}</td>
                            <td className={`py-2 px-4 ${request.response_status >= 400 ? 'text-red-500' : 'text-green-500'}`}>
                                {request.response_status}
                            </td>
                            <td className="py-2 px-4">{new Date(request.timestamp).toLocaleString()}</td>
                            <td className="py-2 px-4">
                                <button className="text-blue-500 underline">View</button>
                            </td>
                        </tr>
                    ))}
                    </tbody>
                </table>
            </div>

            {/* Modal/Dialog for Detailed Request */}
            {selectedRequest && (
                <div className="fixed inset-0 flex items-center justify-center z-50 bg-black bg-opacity-50">
                    <div className="bg-white rounded-lg shadow-lg p-6 w-11/12 md:w-1/2">
                        <div className="flex justify-between items-center mb-4">
                            <h2 className="text-xl font-bold">Request ID: {selectedRequest.id}</h2>
                            <button onClick={() => setSelectedRequest(null)}
                                    className="text-gray-500 hover:text-gray-800">
                                ✖
                            </button>
                        </div>
                        <div>
                            <p><strong>Method:</strong> {selectedRequest.method}</p>
                            <p><strong>Path:</strong> {selectedRequest.path}</p>
                            <p><strong>Status:</strong> {selectedRequest.response_status}</p>
                            <p><strong>Timestamp:</strong> {new Date(selectedRequest.timestamp).toLocaleString()}</p>
                        </div>
                    </div>
                </div>
            )}
        </div>
    );
}

export default NetworkLogDashboardPage
