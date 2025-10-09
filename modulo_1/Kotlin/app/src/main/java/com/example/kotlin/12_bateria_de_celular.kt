package com.example.kotlin

fun main(){
    //partir de 100% y decrementar hasta 09 en pasos de 10, mosgtrando distintos mensjaes en cada nivel
    //100->cargado
    //50->mitad de bateria
    //10->conecte el cargador
    //0->Apagado

    println("Ingrese % de bateria de su celular")

    val bateria = readLine()?.toIntOrNull()

    if (bateria in 100..0) {
        when (bateria) {
            in 100..50 -> println("Cargada / bateria media")
            in 50..10 -> println("bateria media a conectar el cargador")
            in 10..0 -> println("conecte el cargador")
            else -> println("Apagado")
        }
    } else {
        println("Bateria agotada.")
    }
}

fun bat(){
    val bateria: Int = 100

    for (bateria in 100..0 step 10)
        if (bateria == 100) {
            println("Cargado")
        } else if (bateria == 50){
            println("bateria media")
        } else if (bateria == 10){
            println("conecte el cargador")
        }
}