// App.tsx principal - Punto de entrada
import React from 'react';
import { SafeAreaView, StatusBar } from 'react-native';
import TypeScriptDemo from './src/screens/TypeScriptDemo';
import { StyleSheet, Text, View } from "react-native";
import { AppTitle } from "@/components/common/AppTitle";
import AppButton from '@/components/AppButton';
import { ClockDemo } from '@/screens/ClockDemo';
import { UseEffectAsyncDemo } from '@/screens/UseEffectAsyncDemo';
import { AbortFetchDemo } from '@/screens/AbortFetchDemo';
import { ProductsDemo } from '@/screens/Productos';
import { Parte09Lab } from '@/screens/Parte09Lab';
import { Parte10Lab } from '@/screens/Parte10Lab';
import { Parte11Lab } from '@/screens/Parte11Lab';
import { Parte12Lab } from '@/screens/Parte12Lab';
import { NavigationContainer } from "@react-navigation/native";
import { AppNavigator } from "@/navigation/AppNavigator";

export default function App() {
  return (
    <NavigationContainer>
      <AppNavigator />
      <StatusBar style="light" />
    </NavigationContainer>
  );
}
