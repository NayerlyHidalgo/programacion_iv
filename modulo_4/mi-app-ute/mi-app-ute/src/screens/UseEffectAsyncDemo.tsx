import { useEffect, useState } from "react";
import { ActivityIndicator, StyleSheet, Text, View } from "react-native";

type TodoDTO = { id: number; title: string };

export function UseEffectAsyncDemo() {
  const [items, setItems] = useState<TodoDTO[]>([]);
  const [loading, setLoading] = useState<boolean>(false);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;

    async function load() {
      try {
        setLoading(true);
        setError(null);

        const res = await fetch("https://jsonplaceholder.typicode.com/todos?_limit=15");
        const data = (await res.json()) as TodoDTO[];

        if (!cancelled) setItems(data);
      } catch (e) {
        if (!cancelled) setError("No se pudo cargar");
      } finally {
        if (!cancelled) setLoading(false);
      }
    }

    load();

    return () => {
      cancelled = true;
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>useEffect + async</Text>

      {loading ? (
        <View style={styles.row}>
          <ActivityIndicator />
          <Text style={styles.body}>Cargando...</Text>
        </View>
      ) : null}

      {error ? <Text style={styles.error}>{error}</Text> : null}

      {!loading && !error ? (
        <View style={styles.list}>
          {items.map((t) => (
            <Text key={t.id} style={styles.item}>• {t.title}</Text>
          ))}
        </View>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    justifyContent: "center",
    padding: 16,
  },
  title: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
    marginBottom: 10,
  },
  body: {
    color: "#c9d1d9",
    marginLeft: 8,
    opacity: 0.9,
  },
  row: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 10,
  },
  error: {
    color: "#f85149",
    fontWeight: "800",
    marginBottom: 10,
  },
  list: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 12,
    padding: 12,
  },
  item: {
    color: "#c9d1d9",
    opacity: 0.95,
    lineHeight: 20,
    marginBottom: 6,
  },
});