import { useCallback, useEffect, useState } from "react";

export type FetchState<T> =
  | { status: "IDLE"; data: null; error: null }
  | { status: "LOADING"; data: null; error: null }
  | { status: "SUCCESS"; data: T; error: null }
  | { status: "ERROR"; data: null; error: string };

export type UseFetchReturn<T> = {
  state: FetchState<T>;
  reload: () => void;
};

export function useFetch<T>(fetcher: () => Promise<T>): UseFetchReturn<T> {
  const [state, setState] = useState<FetchState<T>>({
    status: "IDLE",
    data: null,
    error: null,
  });

  const load = useCallback(async () => {
    setState({ status: "LOADING", data: null, error: null });

    try {
      const data = await fetcher();
      setState({ status: "SUCCESS", data, error: null });
    } catch (e) {
      setState({ status: "ERROR", data: null, error: "No se pudo cargar" });
    }
  }, [fetcher]);

  useEffect(() => {
    load();
  }, [load]);

  return { state, reload: load };
}