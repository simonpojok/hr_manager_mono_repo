import {INetworkResults} from "@/types/network_statistic/network_results";

export interface INetworkRequestLogData {
    count: number;
    next: string | null;
    previous: string | null;
    results: INetworkResults;
}
