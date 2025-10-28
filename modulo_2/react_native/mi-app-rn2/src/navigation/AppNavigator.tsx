import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createNativeStackNavigator } from "@react-navigation/native-stack";
import TaskListScreen from "../feature/tasks/screens/TaskListScreen";
import TaskDetailScreen from "../feature/tasks/screens/TaskDetailScreen";
import { RootStackParamList } from "./types";
import colors from "../theme/colors";

const Stack = createNativeStackNavigator<RootStackParamList>();

export default function AppNavigator() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        screenOptions={{
          headerStyle: { backgroundColor: "#161b22" },
          headerTintColor: colors.primary,
          contentStyle: { backgroundColor: colors.background },
        }}
      >
        <Stack.Screen name="TaskList" component={TaskListScreen} options={{ title: "Tareas" }} />
        <Stack.Screen name="TaskDetail" component={TaskDetailScreen} options={{ title: "Detalle" }} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}