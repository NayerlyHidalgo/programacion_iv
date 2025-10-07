package com.example.kotlin

//el alumno ingresa una hora 0-23
//Si esta entre 7 y 13 "clase en la mañana"
//si esta entre 14 y 19 "clase de la tarde"
//otro caso "horario lectivo

fun main() {
    println("Ingrese una hora (0-23): ")
    val hora = readLine()?.toIntOrNull()

    if (hora != null && hora in 0..23) {
        when (hora) {
            in 7..13 -> println("Clase en la mañana")
            in 14..19 -> println("Clase en la tarde")
            else -> println("Horario lectivo")
        }
    } else {
        println("Hora no válida. Debe estar entre 0 y 23.")
    }
}