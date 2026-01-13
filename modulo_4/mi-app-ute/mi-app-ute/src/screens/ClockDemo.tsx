import { useEffect, useState } from "react";
import { StyleSheet, Text, View } from "react-native";

export function ClockDemo() {
  const [seconds, setSeconds] = useState<number>(0);

  useEffect(() => {
    const id = setInterval(() => {
      setSeconds((prev) => prev + 1);
    }, 1000);

    return () => {
      clearInterval(id);
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.value}>{seconds}s</Text>
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
  value: {
    color: "#58a6ff",
    fontSize: 28,
    fontWeight: "900",
  },
});