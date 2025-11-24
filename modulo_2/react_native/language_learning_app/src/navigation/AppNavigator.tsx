import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import TabsNavigator from './TabsNavigator';

const Stack = createStackNavigator();

const AppNavigator: React.FC = () => {
  return (
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
      }}
    >
      <Stack.Screen 
        name="Main" 
        component={TabsNavigator} 
      />
    </Stack.Navigator>
  );
};

export default AppNavigator;