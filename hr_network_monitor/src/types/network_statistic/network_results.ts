import {IRequestMethodCount} from "@/types/network_statistic/method_count";
import {INetworkRequest} from "@/types/network_statistic/network_request";

export interface INetworkResults {
    failed_requests_count: number;
    successful_requests_count: number;
    total_requests_count: number;
    requests_by_method: IRequestMethodCount[];
    requests: INetworkRequest[];
}
