package com.example.kotlin

//clase 2 de octubre progra 4

fun main(){
    println("VARIABLES")
    val planeta = "Tatooine"
    var jedi = "Anakin"

    jedi = "Obiwan"

    println("Tipos de Variables")
    println("Tipos Numericos")
    println("Tipo Entero")
    val edad: Int = 25

    println("Tipo Double")
    val altura: Double = 25.5
    println(altura)

    println("Tipo Float")
    val peso: Float = 25.5f
    println(peso)

    println("Tipo Long")
    val poblacion: Long = 2_000_000_000L
    println(poblacion)

    println("Tipo Char")
    val inicial: Char = '0'
    println(inicial)

    println("Tipo Texto")
    val nombre: String = "Obi.Wan Kenobi"
    println(nombre)

    println("Tipo Logico")
    val esJedi: Boolean = true
    println(esJedi)

    //variable opcional
    println("Nulidad")
    val apellido: String? = null
    println(apellido)

    println("Nulidad")
    val ciudad: String? = ""
    println(ciudad?.length)

    //ejemplo de lo que hace operacion de asercion nula para que sirva tengo que agregarle un valor
    println("Operacion de asercion no null")
    val longitudSegura = apellido!!.length

    println("Interpolacion de string")
    val nombreNayely: String = "Leia"
    val edadNayely: Int = 19
    val planetaNayely: String = "Alderan"

    println("${nombreNayely.uppercase()} nacio en ${planetaNayely}")
    println("En 10 años tendra : ${edadNayely+10} añios")

    println("String Multilinea")
    val mensaje = """
        Querido $nombre
        Tu mision en $planeta
        ha sido completada exitosamente
        Que la fuerza te acompañe
    """
    println(mensaje)

    println("Conversiones")
    val textoEdad: String = "25"
    val edadConvertida: Int = textoEdad.toInt()
    println(edadConvertida)

    val numero: Double = 50.8
    val numeroConvertido: String = numero.toString()
    println(numeroConvertido)
}