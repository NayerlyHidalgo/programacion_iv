package com.example.kotlin

//clase 2 de octubre progra 4

fun main(){
    println("!Operadores Aritmeticos!!!")
    val nombre1: String = "Yoda"
    val nombre2: String = "Yoda"
    val nombre3: String = String("Yoda".toCharArray())


    println("Igualdad estructural (contenido)")
    println(nombre1===nombre2)
    println(nombre1===nombre3)
    println("Igualdad Referencial (misma instancia)")
    println(nombre1===nombre2)
    println(nombre1===nombre3)
}