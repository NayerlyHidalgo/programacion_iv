package com.example.kotlin

fun main(){
    println("listas")
    val inmutable: List<Int> = listOf(1,2,3)
    println("Lista Inmutable ${inmutable}")

    val mutableLista: MutableList<Int> = mutableListOf(4,5,6)
    println("Lista mutable ${mutableLista}")
    mutableLista.add(7)
    println("Lista mutable ${mutableLista}")
    mutableLista.removeAt(0)
    println("Lista mujtable ${mutableLista}")

    for(mutable in mutableLista) println(mutable)

    println("operaciones")

    val colores = mutableListOf("rojo", "verde", "azul")
    colores.add("morado")
    colores+="amarillo"
    colores.add(1,"blanco" )
    println("colores")
    colores.remove("verde")
    println("colores")
    colores.removeAt(0)
    println("colores")
    colores[0]="negro"
    println("colores")
    colores.clear()
    println(colores.isEmpty())

    println("Busquedas con Mutable List")
    val nombres = mutableListOf("juan", "luis", "pedro")
    println(nombres.find {it.startsWith("L")})
    println(nombres.firstOrNull {it.length>4})
    println(nombres.any {it.contains('j')})
    println(nombres.none {it =="X"})

    println("Ordenamiento con Mutable List")
    val numerosDesordenados = mutableListOf(8,7,6,5,4,3,2,1,0,9)
    println(numerosDesordenados.sorted())
    println(numerosDesordenados.sortedDescending())
    println(numerosDesordenados.distinct())
}