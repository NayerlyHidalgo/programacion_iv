import { memo, useCallback, useState } from "react";
import { Pressable, StyleSheet, Text, View } from "react-native";

type ItemProps = {
  value: number;
  onPress: (value: number) => void;
};

const Item = memo(function Item({ value, onPress }: ItemProps) {
  return (
    <Pressable onPress={() => onPress(value)} style={styles.item}>
      <Text style={styles.itemText}>Item {value}</Text>
    </Pressable>
  );
});

export function CallbackDemo() {
    const [count, setCount] = useState<number>(0);
  
    const handlePress = useCallback((v: number) => {
      setCount((prev) => prev + v);
    }, []);
  
    const handlePress_2 = useCallback((v: number) => {
      setCount((prev) => prev * v);
    }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.total}>Total: {count}</Text>
      <Item value={1} onPress={handlePress} />
      <Item value={2} onPress={handlePress} />
      <Item value={3} onPress={handlePress} />
      <Item value={4} onPress={handlePress_2} />
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
  total: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 18,
    marginBottom: 12,
  },
  item: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    padding: 12,
    marginBottom: 10,
  },
  itemText: {
    color: "#c9d1d9",
    fontWeight: "800",
  },
});