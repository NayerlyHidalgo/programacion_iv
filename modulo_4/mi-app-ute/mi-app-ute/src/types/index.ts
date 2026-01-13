// src/types/index.ts

// INTERFACE para DTOs (extensible con 'extends')
export interface UserDTO {
  id: string;
  email: string;
  fullName: string;
  createdAt?: Date; // Propiedad opcional
}

// TYPE para uniones discriminadas
export type ApiState<T> =
  | { status: "IDLE"; data: null; error: null }
  | { status: "LOADING"; data: null; error: null }
  | { status: "SUCCESS"; data: T; error: null }
  | { status: "ERROR"; data: null; error: string };

// TYPE para composición
export type Product = {
  id: string;
  name: string;
  price: number;
  inStock: boolean;
};

// INTERFACE que extiende otra
export interface AdminUser extends UserDTO {
  role: "admin" | "superadmin";
  permissions: string[];
}

// Ejemplo de uso en componente
export const exampleState: ApiState<UserDTO> = {
  status: "SUCCESS",
  data: {
    id: "user-123",
    email: "ejemplo@mail.com",
    fullName: "Juan Pérez"
  },
  error: null
};

export type LoadState<T> =
  | { type: "idle" }
  | { type: "loading" }
  | { type: "success"; data: T }
  | { type: "error"; message: string; code?: number };

export type ProductDTO = { 
  id: string; 
  name: string; 
  price: number;
  category: string;
};

// Ejemplo de estados
export const idleState: LoadState<ProductDTO[]> = { type: "idle" };
export const loadingState: LoadState<ProductDTO[]> = { type: "loading" };
export const successState: LoadState<ProductDTO[]> = {
  type: "success",
  data: [
    { id: "1", name: "Mouse Gaming", price: 45.99, category: "Electrónica" },
    { id: "2", name: "Teclado Mecánico", price: 89.99, category: "Electrónica" },
    { id: "3", name: "Monitor 24\"", price: 199.99, category: "Electrónica" },
  ]
};
export const errorState: LoadState<ProductDTO[]> = {
  type: "error",
  message: "No se pudieron cargar los productos",
  code: 500
};