import { useRef, useState } from "react";
import { Pressable, StyleSheet, Text, View } from "react-native";

export function RefCounter() {
  const renders = useRef<number>(0);
  const [count, setCount] = useState<number>(0);

  renders.current += 1;

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Count: {count}</Text>
      <Text style={styles.sub}>Renders: {renders.current}</Text>

      <Pressable style={styles.btn} onPress={() => setCount((v) => v + 1)}>
        <Text style={styles.btnText}>Incrementar</Text>
      </Pressable>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    alignItems: "center",
    justifyContent: "center",
    padding: 16,
  },
  text: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 22,
    marginBottom: 4,
  },
  sub: {
    color: "#c9d1d9",
    marginBottom: 12,
  },
  btn: {
    backgroundColor: "#21262d",
    borderColor: "#58a6ff",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 14,
  },
  btnText: {
    color: "#58a6ff",
    fontWeight: "800",
  },
});