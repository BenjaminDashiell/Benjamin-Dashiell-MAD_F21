package com.example.lab7

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.*
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    //declare for save states
    lateinit var messageText: TextView
    lateinit var saveText: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //init view for save states
        saveText = findViewById<TextView>(R.id.displayText)
    }

    fun createSandwich(view: android.view.View){
        var filling: CharSequence = ""
        val layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)

        val radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        val fillingId = radioGroup.checkedRadioButtonId    //value of the radio button selected

        val checkBox1 = findViewById<CheckBox>(R.id.checkBox1)
        val checkBox2 = findViewById<CheckBox>(R.id.checkBox2)
        val checkBox3 = findViewById<CheckBox>(R.id.checkBox3)
        var toppinglist = ""
        var toppingChoice = ""

        //spinner
        val spinner = findViewById<Spinner>(R.id.spinner)

        if(fillingId == -1){
            //snackbar
            val fillingSnackBar = Snackbar.make(layoutRoot, "Please select the main filling", Snackbar.LENGTH_SHORT) //view,message,duration
            fillingSnackBar.show()
        }else{
            filling = findViewById<RadioButton>(fillingId).text
            saveText = findViewById<TextView>(R.id.displayText)

            if(checkBox1.isChecked){
                toppingChoice = checkBox1.text.toString()
                toppinglist += toppingChoice + ", "
            }
            if(checkBox2.isChecked){
                toppingChoice = checkBox2.text.toString()
                toppinglist += toppingChoice + ", "
            }
            if(checkBox3.isChecked){
                toppingChoice = checkBox3.text.toString()
                toppinglist += toppingChoice + ", "
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
            saveText.text = "You ordered a $filling sandwich $toppinglist$location"
            //save
            updateUI()
        }
    }

    fun updateUI(){
        //TextView
        messageText = saveText
    }
    override fun onSaveInstanceState(outState: Bundle) {
        updateUI() //kept crashing when rotate and no options selected yet, so set message=saveText even if there is no displayed text
        super.onSaveInstanceState(outState)
        outState.putString("message", messageText.text as String?)
        super.onSaveInstanceState(outState)
    }
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        saveText.text = savedInstanceState.getString("message", "")
        updateUI()
    }
}