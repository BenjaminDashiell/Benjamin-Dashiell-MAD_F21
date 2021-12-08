package com.example.karaoke

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.*

class MainActivity : AppCompatActivity(){
    //for karaoke data
    private val karaokeDB = songDB() //access our karaoke list
    private var karaokeArray: Array<Song> = karaokeDB.getDB().toTypedArray()
    private lateinit var resultsAdapter: ArrayAdapter<String>
    private lateinit var queueAdapter: ArrayAdapter<String>
    private lateinit var queueAdapter2: ArrayAdapter<String>

    //for the views
    private lateinit var resultsList: ListView
    private lateinit var queueList: ListView
    private lateinit var songInput: TextView
    private lateinit var switchListViewType: Switch

    //Mutable Lists
    private var displayResults: MutableList<String> = mutableListOf()
    private var displayQueue: MutableList<String> = mutableListOf()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //init the lateinits
        resultsList = findViewById(R.id.resultsList)
        queueList = findViewById(R.id.queueList)
        songInput = findViewById(R.id.songInput)
        switchListViewType = findViewById(R.id.switchListViewType)

        resultsAdapter = ArrayAdapter<String>(this, android.R.layout.simple_list_item_multiple_choice, displayResults)
        resultsList.adapter = resultsAdapter
        queueAdapter = ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, displayQueue)
        queueAdapter2 = ArrayAdapter<String>(this, android.R.layout.simple_list_item_multiple_choice, displayQueue)
    }

    fun findSong(view: View){
        displayResults.clear() //to refresh it between searches
        var foundFlag = false
        val checkInput = (songInput.text).toString()

        if(checkInput.isEmpty()){
            Toast.makeText(this,"Please input a song",Toast.LENGTH_SHORT).show()
        }
        else{
            for (song in karaokeArray){
                //check if user's input is a song title, author, or ID
                if(song.songTitle == checkInput || song.songAuthor == checkInput || song.songID == checkInput){
                    //add the song to the displayResults as a checkbox
                    val passString = "${song.songTitle} by ${song.songAuthor} \nID: ${song.songID}"
                    displayResults.add(passString)
                    foundFlag = true
                    updateResults(view)
                }
            }
            if(!foundFlag){
                Toast.makeText(this,"There is no ${checkInput} in our database!",Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun updateResults(view: View){
        //show entries of displayResults to the user
        resultsAdapter.notifyDataSetChanged();
    }

    fun addToQueue(view: View){
        //for loop through resultsList
        val size = resultsList.getCount()
        val checkedItemsCount = resultsList.checkedItemCount
        if(size <= 0 || checkedItemsCount <= 0){
            Toast.makeText(this,"There were 0 items that could be added to the Queue",Toast.LENGTH_SHORT).show()
        }
        else{
            for(i in 0..size){
                if(resultsList.isItemChecked(i)){
                    //If any checkbox is selected
                    //testOutput += resultsList.getItemAtPosition(i).toString()
                    displayQueue.add(resultsList.getItemAtPosition(i).toString())
                }
            }
            //Toast.makeText(this,testOutput,Toast.LENGTH_SHORT).show()
            updateQueue()
        }
    }

    private fun updateQueue(){
        //show entries of displayQueue to the user as text

        //Solution to not being able to select the checkboxes:
        // set choiceMode to Multiple Choice. None/empty makes it unable to select from

        if(switchListViewType.isChecked){
            queueList.adapter = queueAdapter2
            queueAdapter2.notifyDataSetChanged()
            switchListViewType.text = " Lock "
            //Toast.makeText(this,"switch is on",Toast.LENGTH_SHORT).show()
        }
        else{
            queueList.adapter = queueAdapter
            queueAdapter.notifyDataSetChanged()
            switchListViewType.text = "Unlock"
            //Toast.makeText(this,"switch is off",Toast.LENGTH_SHORT).show()
        }
    }

    fun selectFromQueue(view: View){
        //show entries of displayQueue (checkboxes)
        updateQueue()
        //Toast.makeText(this,"switch is pressed",Toast.LENGTH_SHORT).show()
    }

    fun removeFromQueue(view: View){
        //for loop through displayQueue
        val size = queueList.getCount()
        val checkedItemsCount = queueList.checkedItemCount
        if(size <= 0 || checkedItemsCount <= 0){
            Toast.makeText(this,"There were 0 items that could be removed from the Queue",Toast.LENGTH_SHORT).show()
        }
        else {
            for (i in 0..size) {
                if (queueList.isItemChecked(i)) {
                    //If any checkbox is selected
                    //Toast.makeText(this, queueList.getItemAtPosition(i).toString(),Toast.LENGTH_SHORT).show()
                    displayQueue.remove(queueList.getItemAtPosition(i).toString())
                }
            }
            selectFromQueue(view)
        }
    }

    //save state for rotation
    //only need to save the ListViews
    override fun onSaveInstanceState(outState: Bundle) {
        //println("App Crashes At Save State")
        super.onSaveInstanceState(outState)
        val displayResultsArray: ArrayList<String> = displayResults.toCollection(ArrayList())
        val displayQueueArray: ArrayList<String> = displayQueue.toCollection(ArrayList())
        outState.putSerializable("saveState1", displayResultsArray)
        outState.putSerializable("saveState2", displayQueueArray)
    }
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        //println("App Crashes At Restoring A State")
        super.onRestoreInstanceState(savedInstanceState)

        this.displayResults.clear()
        this.displayResults.addAll(savedInstanceState.getSerializable("saveState1") as MutableList<String>)
        this.resultsAdapter.notifyDataSetChanged()

        this.displayQueue.clear()
        this.displayQueue.addAll(savedInstanceState.getSerializable("saveState2") as MutableList<String>)
        updateQueue()
    }
}