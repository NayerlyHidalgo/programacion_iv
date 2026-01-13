import { forwardRef, useImperativeHandle, useRef } from "react";
import { StyleSheet, TextInput } from "react-native";
import type { FancyInputHandle } from "../../types/FancyInputHandle";

type FancyInputProps = {
  placeholder?: string;
};

export const FancyInput = forwardRef<FancyInputHandle, FancyInputProps>(
  function FancyInput({ placeholder }, ref) {
    const innerRef = useRef<TextInput | null>(null);

    useImperativeHandle(ref, () => ({
      focus() {
        innerRef.current?.focus();
      },
      clear() {
        innerRef.current?.clear();
      },
    }));

    return (
        <>
      <TextInput
        ref={innerRef}
        placeholder={placeholder}
        placeholderTextColor="#8b949e"
        style={styles.input}
        />
      <TextInput
        placeholder={placeholder}
        placeholderTextColor="#8b949e"
        style={styles.input}
        />
        </>
    );
  }
);

const styles = StyleSheet.create({
  input: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 10,
    paddingVertical: 10,
    paddingHorizontal: 12,
    color: "#c9d1d9",
  },
});