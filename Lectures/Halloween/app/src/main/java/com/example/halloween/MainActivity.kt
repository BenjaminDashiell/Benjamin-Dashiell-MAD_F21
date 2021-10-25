package com.example.halloween

import android.os.Bundle
import android.view.View
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    //late init val personName
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        //personName = findViewById<EditText>(R.id.editTextName)
    }

    fun sayBoo(view: View) {
        //anything comes from a view has to take a View as input
        val booText = findViewById<TextView>(R.id.textMessage) //<type of what you want to access> (R.id.idNameOfWhatYouWant)
        val personName = findViewById<EditText>(R.id.editTextName)
        val displayImage = findViewById<ImageView>(R.id.imageView)
        val name = personName.text
        booText.text = "Happy Halloween "+name+"!"
        displayImage.setImageResource(R.drawable.ghost) //upload ghost.png to drawables
    }
}