package com.example.kotlin

fun main(){
    val fuerzaJedis =mapOf(
        "Luke" to 85,
        "Leia" to 80,
        "Obi-Wan" to 95,
        "Yoda" to 100
    )
    println("Fuerza de los Jedis : ${fuerzaJedis}")

    println("Mapa Mutable")

    val misionesCompletadas = mutableMapOf<String, Int>()
    misionesCompletadas ["Luke"] = 15
    misionesCompletadas ["Leia"] = 12
    misionesCompletadas.put("Han", 20)

    println("Misiones: ${misionesCompletadas}")

    for((jedi, fuerza) in fuerzaJedis){
        println("$jedi tiene nivel de fuerza $fuerza")
    }

    val planetasVisitados = setOf("tatooine", "coruscant", "dagobah")
    println("Planetas Visitados : ${planetasVisitados}")

    val planetasPelifgrosos = setOf("Mustafar", "coruscant", "korriban")
    println("Planetas Visitados : ${planetasPelifgrosos}")

    println("Operaciones de Conjuntos")

    val interseccion = planetasPelifgrosos intersect planetasVisitados
    val union = planetasPelifgrosos union planetasVisitados
    val diferencia = planetasPelifgrosos - planetasVisitados

    println("Planetas visitados y peligrosos : ${interseccion}")
    println("Todos los Planetas : ${union}")
    println("Planetas Seguros visitados : $diferencia")

}