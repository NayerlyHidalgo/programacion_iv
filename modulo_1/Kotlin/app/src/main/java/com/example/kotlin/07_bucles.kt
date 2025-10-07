package com.example.kotlin

fun main(){
    println("!Bucles")
    val jedis = listOf("Luke", "Leia", "Obi-Wan", "Yoda", "Ahsoka")
    for ((index,jedi) in jedis.withIndex()){
        println("${index+1}.$jedi")
    }
    // rangos de paso
    for (i in 0..20 step 2){
        println("Energia: $i%")
    }
    // rangos descendentes
    for (countdown in 10 downTo 1){
        println("Despegue en : $countdown")
    }
    // Control de flujo
    for (jedi in jedis){
        if(jedi == "Obi-Wan") continue // saltar esta interacion
        if(jedi == "Yoda") break // saltar esta interacion
        println("entrenando a $jedi")
    }
}
