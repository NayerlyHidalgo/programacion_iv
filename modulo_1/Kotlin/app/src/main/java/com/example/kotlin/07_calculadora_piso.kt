package com.example.kotlin

import kotlin.io.println

fun main(){
    println("¡Operadores Ariméticos!")
    println("Ingresa el primer valor: ")
    val value1: Int = readLine()?.toIntOrNull()?:0
    println("Ingresa el segundo valor: ")
    val value2: Int = readLine()?.toIntOrNull()?:0
    println("Ingrese el operador (+,-,* o /)")
    val value3: String = readLine()?.toString()?:""
    when(value3){
        "+" -> println("Suma: ${value1 + value2}")
        "-" -> println("Resta: ${value1 - value2}")
        "*" -> println("Multiplicacion: ${value1 * value2}")
        "/" -> println("Division: ${value1 / value2}")
    }
    println("¡Bucles!")
    val jedis = listOf("Luke", "Leia", "Obi-wan", "Yoda", "Ashoka")
    for ((index,jedi) in jedis.withIndex()){
        println("${index+1}.$jedi")
    }
    for (i in 0 .. 20 step 2){
        println("Energia: $i%")
    }
    //rangos descendentes
    for (countdown in 10 downTo 1){
        println("Despegue en: $countdown")
    }
    //Control de flujo
    for (jedi in jedis){
        if(jedi == "Obi-wan") continue //saltar esa interacción
        if(jedi == "Yoda") break //saltar esta interacción
        println("entrenando a $jedi")
    }

}