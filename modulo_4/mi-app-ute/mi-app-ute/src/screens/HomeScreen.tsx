import { Pressable, StyleSheet, Text, View } from "react-native";
import type { NativeStackScreenProps } from "@react-navigation/native-stack";
import type { RootStackParamList } from "@/navigation/types";

type Props = NativeStackScreenProps<RootStackParamList, "Home">;

export function HomeScreen({ navigation }: Props) {
    return (
        <View style={styles.container}>
            <Text style={styles.title}>Home</Text>
            <Text style={styles.body}>Navegación con Stack + TypeScript</Text>

            <Pressable
                style={styles.btn}
                onPress={() =>
                    navigation.navigate("Details", { id: "p1", title: "Producto 1" })
                }
            >
                <Text style={styles.btnText}>Ir a Details (con params)</Text>
            </Pressable>

            <Pressable
                style={[styles.btn, { marginTop: 10 }]}
                onPress={() => navigation.navigate("Settings")}
            >
                <Text style={styles.btnText}>Ir a Settings (AsyncStorage)</Text>
            </Pressable>
            <Pressable
                style={[styles.btn, { marginTop: 10 }]}
                onPress={() => navigation.navigate("Demo")}
            >
                <Text style={styles.btnText}>Ir a Dermo Screen (AsyncStorage)</Text>
            </Pressable>
            <Pressable
                style={[styles.btn, { marginTop: 10 }]}
                onPress={() => navigation.navigate("LoginForm")}
            >
                <Text style={styles.btnText}>Ir a Login Form (Validación)</Text>
            </Pressable>
            <Pressable
                style={[styles.btn, { marginTop: 10 }]}
                onPress={() => navigation.navigate("Trapecio")}>
                <Text style={styles.btnText}>Ir al Trapecio</Text>
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
        marginBottom: 6,
    },
    body: {
        color: "#c9d1d9",
        opacity: 0.9,
        lineHeight: 20,
        marginBottom: 12,
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