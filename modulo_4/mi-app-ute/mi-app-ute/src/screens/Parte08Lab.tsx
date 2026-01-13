import { StyleSheet, Text, View } from "react-native";
import { ClockDemo } from "./ClockDemo";
import { AbortFetchDemo } from "./AbortFetchDemo";
import { ProductsDemo } from "./Productos";

export function Parte08Lab() {
  return (
    <View style={styles.container}>
      <Text style={styles.h1}>Parte 8 Lab — useEffect</Text>

      {/* Cambia aquí qué ejemplo estás probando */}
      <View style={styles.stage}>
        <ProductsDemo />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
  },
  h1: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
    marginBottom: 12,
  },
  stage: {
    flex: 1,
    borderRadius: 12,
    overflow: "hidden",
    borderWidth: 1,
    borderColor: "#30363d",
  },
});