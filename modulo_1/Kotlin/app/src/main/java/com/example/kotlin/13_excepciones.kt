package com.example.kotlin

fun realizarMision(nivelFuerza: Int, peligroMision: Int){
    return
}

fun main(){
    try{
        val resultado= 8/0;
    }catch (e: Exception){
        println(e)
        println("Error en division")
    }
}