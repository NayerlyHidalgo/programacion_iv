import { useEffect, useState } from "react";
import { ActivityIndicator, StyleSheet, Text, View } from "react-native";

type PostDTO = { id: number; title: string };

export function AbortFetchDemo() {
  const [posts, setPosts] = useState<PostDTO[]>([]);
  const [loading, setLoading] = useState<boolean>(false);

  useEffect(() => {
    const controller = new AbortController();

    async function load() {
      setLoading(true);
      const res = await fetch("https://jsonplaceholder.typicode.com/posts?_limit=3", {
        signal: controller.signal,
      });
      const data = (await res.json()) as PostDTO[];
      setPosts(data);
      setLoading(false);
    }

    load().catch(() => {
      setLoading(false);
    });

    return () => {
      controller.abort();
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>AbortController</Text>

      {loading ? (
        <View style={styles.row}>
          <ActivityIndicator />
          <Text style={styles.body}>Cargando posts...</Text>
        </View>
      ) : null}

      {!loading ? (
        <View style={styles.list}>
          {posts.map((p) => (
            <Text key={p.id} style={styles.item}>• {p.title}</Text>
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