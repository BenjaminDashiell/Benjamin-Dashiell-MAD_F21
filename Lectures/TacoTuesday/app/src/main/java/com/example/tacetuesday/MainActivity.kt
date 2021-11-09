package com.example.tacetuesday

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun createTaco(view: android.view.View){
        //constraint
        var filling: CharSequence = ""
        val layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)

        val radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        val fillingId = radioGroup.checkedRadioButtonId    //value of the radio button selected

        val checkBox1 = findViewById<CheckBox>(R.id.checkBox)
        val checkBox2 = findViewById<CheckBox>(R.id.checkBox2)
        val checkBox3 = findViewById<CheckBox>(R.id.checkBox3)
        val checkBox4 = findViewById<CheckBox>(R.id.checkBox4)
        var toppinglist = ""

        //spinner
        val spinner = findViewById<Spinner>(R.id.spinner)

        if(fillingId == -1){
            //snackbar
            val fillingSnackBar = Snackbar.make(layoutRoot, "Please select a filling", Snackbar.LENGTH_SHORT) //view,message,duration
            fillingSnackBar.show()
        }else{
            filling = findViewById<RadioButton>(fillingId).text
            val messageTextView = findViewById<TextView>(R.id.messageTextView)

            if(checkBox1.isChecked){
                toppinglist += " " + checkBox1.text
            }
            if(checkBox2.isChecked){
                toppinglist += " " + checkBox2.text
            }
            if(checkBox3.isChecked){
                toppinglist += " " + checkBox3.text
            }
            if(checkBox4.isChecked){
                toppinglist += " " + checkBox4.text
            }
            if(toppinglist.isNotEmpty()){
                toppinglist = "with "+ toppinglist
            }

            //location
            val location = " at " + spinner.selectedItem

            //Switch
            val switch = findViewById<SwitchMaterial>(R.id.switch1)
            if (switch.isChecked){
                filling = switch.text.toString() + " $filling"
            }

            //final text message
            messageTextView.text = "You'd like $filling tacos $toppinglist $location"
        }
    }
}

