import { StyleSheet, Text, View } from "react-native";

const TAGS = ["React", "Native", "TypeScript", "Hooks", "Navigation", "Testing", "API", "State"];

export function WrapDemo() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Tags</Text>

      <View style={styles.wrap}>
        {TAGS.map((t) => (
          <View key={t} style={styles.chip}>
            <Text style={styles.chipText}>{t}</Text>
          </View>
        ))}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
    justifyContent: "center",
  },
  title: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 16,
    marginBottom: 10,
  },
  wrap: {
    flexDirection: "row",
    flexWrap: "wrap",
  },
  chip: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 999,
    paddingVertical: 6,
    paddingHorizontal: 10,
    marginRight: 8,
    marginBottom: 8,
  },
  chipText: {
    color: "#c9d1d9",
    fontWeight: "700",
    fontSize: 12,
  },
});