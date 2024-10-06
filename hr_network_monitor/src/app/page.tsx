'use client';

import {useEffect} from "react";
import {useRouter} from "next/navigation";

export default function Home() {
    const router = useRouter();

    useEffect(() => {
        router.replace('/dashboard'); // Replaces the current history entry with /dashboard
    }, [router]);
    return null;
}
