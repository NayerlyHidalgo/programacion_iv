import { StyleSheet, Text, View } from "react-native";
import { ProductsMemoDemo } from "./ProductsMemoDemo";
import { CallbackDemo } from "./CallbackDemo";

export function Parte09Lab() {
  return (
    <View style={styles.container}>
      <Text style={styles.h1}>Parte 9 Lab — useMemo / useCallback</Text>

      <View style={styles.stage}>
        <CallbackDemo />
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