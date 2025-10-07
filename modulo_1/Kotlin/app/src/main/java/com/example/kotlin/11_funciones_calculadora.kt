package com.example.kotlin

fun main() {
    println("=== Calculadora en Kotlin ===")

    println("Ingrese el primer número: ")
    val num1 = readLine()!!.toDouble()

    println("Ingrese el segundo número: ")
    val num2 = readLine()!!.toDouble()

    println("Ingrese la operación (+, -, *, /): ")
    val operacion = readLine()

    // función con retorno
    fun calcular(a: Double, b: Double, signo: String): Double {
        return when (signo) {
            "+" -> a + b
            "-" -> a - b
            "*" -> a * b
            "/" -> if (b != 0.0) a / b else Double.NaN
            else -> {
                println("Operación no válida")
                0.0
            }
        }
    }

    val resultado = calcular(num1, num2, operacion!!)
    println("El resultado de $num1 $operacion $num2 = $resultado")

    // versión lambda para sumar
    val sumarLambda = { x: Double, y: Double -> x + y }
    println("Ejemplo con lambda: 5 + 3 = ${sumarLambda(5.0, 3.0)}")
}

