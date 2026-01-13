import { StyleSheet, Text } from "react-native";

type AppTitleProps = {
  value: string;
};

export function AppTitle({ value }: AppTitleProps) {
  return <Text style={styles.title}>{value}</Text>;
}

const styles = StyleSheet.create({
  title: {
    fontSize: 20,
    fontWeight: "700",
    color: "#58a6ff",
    marginBottom: 8,
  },
});