import { useRef } from "react";
import { Pressable, StyleSheet, Text, TextInput, View } from "react-native";

export function FocusDemo() {
    const inputRef = useRef<TextInput | null>(null);

    return (
        <View style={styles.container}>
            <TextInput
                ref={inputRef}
                placeholder="Escribe aquí..."
                placeholderTextColor="#8b949e"
                style={styles.input}
            />

            <TextInput
                placeholder="Escribe aquí..."
                placeholderTextColor="#8b949e"
                style={styles.input}
            />

            <Pressable
                style={styles.btn}
                onPress={() => inputRef.current?.focus()}
            >
                <Text style={styles.btnText}>Enfocar input</Text>
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
    input: {
        backgroundColor: "#161b22",
        borderColor: "#30363d",
        borderWidth: 1,
        borderRadius: 10,
        paddingVertical: 10,
        paddingHorizontal: 12,
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
        alignItems: "center",
    },
    btnText: {
        color: "#58a6ff",
        fontWeight: "800",
    },
});