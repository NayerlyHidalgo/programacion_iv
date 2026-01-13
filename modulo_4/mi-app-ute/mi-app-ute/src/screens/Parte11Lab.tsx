import { StyleSheet, Text, View } from "react-native";
import { TodosScreen } from "./TodosScreen";

export function Parte11Lab() {
  return (
    <View style={styles.container}>
      <Text style={styles.h1}>Parte 11 Lab — Custom Hooks</Text>

      <View style={styles.stage}>
        <TodosScreen />
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