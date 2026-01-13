import { useEffect, useRef, useState } from "react";
import { StyleSheet, Text, View } from "react-native";

export function TimerRefDemo() {
  const timerId = useRef<ReturnType<typeof setInterval> | null>(null);
  const [seconds, setSeconds] = useState<number>(0);
  const [second, setSecond] = useState<number>(1000);

  useEffect(() => {
    timerId.current = setInterval(() => {
      setSeconds((v) => v + 1);
    }, 1000);

    return () => {
      if (timerId.current) clearInterval(timerId.current);
    };
  }, []);
  useEffect(() => {
    timerId.current = setInterval(() => {
      setSecond((v) => v - 1);
    }, 1000);

    return () => {
      if (timerId.current) clearInterval(timerId.current);
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.value}>{seconds}s</Text>
      <Text style={styles.value}>{second}s</Text>
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