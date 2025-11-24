package com.ute.aprendizajeidiomas.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.models.WordCategory

class CategoryAdapter(
    private val categories: List<WordCategory>,
    private val onCategoryClick: (WordCategory) -> Unit
) : RecyclerView.Adapter<CategoryAdapter.CategoryViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_category, parent, false)
        return CategoryViewHolder(view)
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        holder.bind(categories[position])
    }

    override fun getItemCount(): Int = categories.size

    inner class CategoryViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val cardView: CardView = itemView.findViewById(R.id.cardCategory)
        private val tvCategoryName: TextView = itemView.findViewById(R.id.tvCategoryName)
        private val tvCategoryIcon: TextView = itemView.findViewById(R.id.tvCategoryIcon)

        fun bind(category: WordCategory) {
            tvCategoryName.text = getCategoryDisplayName(category)
            tvCategoryIcon.text = getCategoryIcon(category)
            
            cardView.setOnClickListener {
                onCategoryClick(category)
            }
        }

        private fun getCategoryDisplayName(category: WordCategory): String {
            return when (category) {
                WordCategory.GREETINGS -> "Saludos"
                WordCategory.NUMBERS -> "Números"
                WordCategory.COLORS -> "Colores"
                WordCategory.ANIMALS -> "Animales"
                WordCategory.FOOD -> "Comida"
                WordCategory.FAMILY -> "Familia"
                WordCategory.TIME -> "Tiempo"
                WordCategory.TRAVEL -> "Viajes"
            }
        }

        private fun getCategoryIcon(category: WordCategory): String {
            return when (category) {
                WordCategory.GREETINGS -> "👋"
                WordCategory.NUMBERS -> "🔢"
                WordCategory.COLORS -> "🌈"
                WordCategory.ANIMALS -> "🐱"
                WordCategory.FOOD -> "🍎"
                WordCategory.FAMILY -> "👪"
                WordCategory.TIME -> "⏰"
                WordCategory.TRAVEL -> "✈️"
            }
        }
    }
}