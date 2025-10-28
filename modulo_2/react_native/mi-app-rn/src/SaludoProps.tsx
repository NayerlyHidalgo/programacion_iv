import React from "react";
import { Text } from "react-native";

type Props = {
  nombre: string;
};

export default function Saludo({ nombre }: Props) {
  return (
    <Text style={{ fontSize: 18, color: "#58a6ff" }}>
      ¡Hola {nombre}!
    </Text>
  );
}