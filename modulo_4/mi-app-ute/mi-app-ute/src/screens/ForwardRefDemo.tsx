import { useRef } from "react";
import { Pressable, StyleSheet, Text, View } from "react-native";
import { FancyInput } from "../components/common/FancyInput";
import type { FancyInputHandle } from "../types/FancyInputHandle";

export function ForwardRefDemo() {
  const fancyRef = useRef<FancyInputHandle | null>(null);

  return (
    <View style={styles.container}>
      <FancyInput placeholder="Con API pública" ref={fancyRef} />

      <Pressable
        style={styles.btn}
        onPress={() => fancyRef.current?.focus()}
      >
        <Text style={styles.btnText}>Focus</Text>
      </Pressable>

      <Pressable
        style={styles.btn}
        onPress={() => fancyRef.current?.clear()}
      >
        <Text style={styles.btnText}>Clear</Text>
      </Pressable>
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
  btn: {
    marginTop: 10,
    backgroundColor: "#21262d",
    borderColor: "#58a6ff",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
    alignItems: "center",
  },
  btnText: {
    color: "#58a6ff",
    fontWeight: "800",
  },
});