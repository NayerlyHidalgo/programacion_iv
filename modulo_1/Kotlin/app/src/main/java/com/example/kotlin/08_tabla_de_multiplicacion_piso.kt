package com.example.kotlin

fun main(){

    print("Ingresa el numero de la tabla de multiplicacion: ")
    val numero = readLine()?.toIntOrNull()?:0
    println("Tabla del $numero:")

    for (i in 1..10) {
        val resultado = numero * i
        println("$numero x $i = $resultado")
    }
}