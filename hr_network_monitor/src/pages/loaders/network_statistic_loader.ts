import axiosInstance from "../../axiosInstance.ts";

export async function networkStatisticLoader(): Promise<NetworkRequestLogData> {
    const response = await axiosInstance.get('/api/statistics/requests');
    return await response.data;
}

export interface NetworkRequest {
    id: number;
    method: string;
    path: string;
    response_status: number;
    timestamp: string;
}

export interface MethodCount {
    method: string;
    count: number;
}

export interface Results {
    failed_requests_count: number;
    successful_requests_count: number;
    total_requests_count: number;
    requests_by_method: MethodCount[];
    requests: NetworkRequest[];
}

export interface NetworkRequestLogData {
    count: number;
    next: string | null;
    previous: string | null;
    results: Results;
}
