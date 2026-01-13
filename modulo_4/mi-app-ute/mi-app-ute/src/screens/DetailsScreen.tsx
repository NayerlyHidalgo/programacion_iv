import { Pressable, StyleSheet, Text, View } from "react-native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";
import type { RootStackParamList } from "@/navigation/types";

type Props = NativeStackScreenProps<RootStackParamList, "Details">;

export function DetailsScreen({ navigation, route }: Props) {
  const { id, title } = route.params;

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Details</Text>

      <View style={styles.card}>
        <Text style={styles.label}>ID:</Text>
        <Text style={styles.value}>{id}</Text>

        <Text style={styles.label}>Title:</Text>
        <Text style={styles.value}>{title}</Text>
      </View>

      <Pressable style={styles.btn} onPress={() => navigation.goBack()}>
        <Text style={styles.btnText}>Volver</Text>
      </Pressable>
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
    fontSize: 22,
    marginBottom: 10,
  },
  card: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 12,
    padding: 14,
    marginBottom: 12,
  },
  label: {
    color: "#c9d1d9",
    opacity: 0.8,
    marginTop: 8,
    fontWeight: "700",
  },
  value: {
    color: "#c9d1d9",
    fontWeight: "900",
    marginTop: 4,
  },
  btn: {
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