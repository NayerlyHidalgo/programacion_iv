import React, { useEffect, useState } from "react";
import { ActivityIndicator, StyleSheet, Text, View, ScrollView } from "react-native";

// Definimos la estructura del objeto según tu API
type PostDTO = { id: number; title: string };

export function ProductsDemo() {
  const [posts, setPosts] = useState<PostDTO[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const controller = new AbortController();

    async function load() {
      try {
        setLoading(true);
        setError(null);

        const res:any = await fetch("https://paredes-inventario-api.desarrollo-software.xyz/api/productos/", {
          signal: controller.signal,
        });

        if (!res.ok) throw new Error("Error en la respuesta del servidor");

        const data = await res.json();
        
        console.log("Datos recibidos:", data);

        if (Array.isArray(data.results)) {
          setPosts(data.results);
        } 
        else if (data && typeof data === 'object' && data.productos) {
          setPosts(data.productos);
        } 
        else {
          console.warn("La estructura de la API no es un array conocido.");
          setPosts([]);
        }

      } catch (err: any) {
        if (err.name !== 'AbortError') {
          setError("No se pudieron cargar los productos.");
          console.error(err);
        }
      } finally {
        setLoading(false);
      }
    }

    load();

    return () => {
      controller.abort();
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Inventario de Productos</Text>

      {loading ? (
        <View style={styles.row}>
          <ActivityIndicator color="#58a6ff" />
          <Text style={styles.body}>Cargando posts...</Text>
        </View>
      ) : error ? (
        <Text style={[styles.body, { color: '#f85149' }]}>{error}</Text>
      ) : (
        <ScrollView style={styles.listContainer}>
          <View style={styles.list}>
            {posts.length > 0 ? (
              posts.map((p) => (
                <View key={p.id} style={styles.itemWrapper}>
                  <Text style={styles.item}>• {p.title || "Producto sin nombre"}</Text>
                </View>
              ))
            ) : (
              <Text style={styles.body}>No se encontraron productos.</Text>
            )}
          </View>
        </ScrollView>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
    paddingTop: 60,
  },
  title: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 22,
    marginBottom: 20,
  },
  body: {
    color: "#c9d1d9",
    marginLeft: 8,
    fontSize: 16,
  },
  row: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",
    marginTop: 20,
  },
  listContainer: {
    flex: 1,
  },
  list: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 12,
    padding: 12,
  },
  itemWrapper: {
    borderBottomWidth: 1,
    borderBottomColor: "#30363d",
    paddingVertical: 8,
  },
  item: {
    color: "#c9d1d9",
    fontSize: 16,
    fontWeight: "500",
  },
});