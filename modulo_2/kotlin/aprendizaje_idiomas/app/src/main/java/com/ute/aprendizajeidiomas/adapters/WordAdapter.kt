package com.ute.aprendizajeidiomas.adapters

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.ute.aprendizajeidiomas.R
import com.ute.aprendizajeidiomas.models.Word

class WordAdapter(
    private val words: List<Word>
) : RecyclerView.Adapter<WordAdapter.WordViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): WordViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_word, parent, false)
        return WordViewHolder(view)
    }

    override fun onBindViewHolder(holder: WordViewHolder, position: Int) {
        holder.bind(words[position])
    }

    override fun getItemCount(): Int = words.size

    inner class WordViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val tvSpanish: TextView = itemView.findViewById(R.id.tvSpanish)
        private val tvEnglish: TextView = itemView.findViewById(R.id.tvEnglish)
        private val tvFrench: TextView = itemView.findViewById(R.id.tvFrench)
        private val tvPronunciation: TextView = itemView.findViewById(R.id.tvPronunciation)
        private val tvDifficulty: TextView = itemView.findViewById(R.id.tvDifficulty)

        fun bind(word: Word) {
            tvSpanish.text = "🇪🇸 ${word.spanish}"
            tvEnglish.text = "🇺🇸 ${word.english}"
            tvFrench.text = "🇫🇷 ${word.french}"
            tvPronunciation.text = "🔊 ${word.pronunciation}"
            tvDifficulty.text = getDifficultyText(word.difficulty.name)
        }

        private fun getDifficultyText(difficulty: String): String {
            return when (difficulty) {
                "BEGINNER" -> "⭐ Principiante"
                "INTERMEDIATE" -> "⭐⭐ Intermedio"
                "ADVANCED" -> "⭐⭐⭐ Avanzado"
                else -> difficulty
            }
        }
    }
}