package com.example.lab8

data class SandwichShop(var name: String="", var url: String=""){
    fun suggestShop(position:Int){
        setShopName(position)
        setShopUrl(position)
    }

    private fun setShopName(position:Int){
        when (position) {
            0 -> name="Panera Bread"
            1 -> name="Chick-Fil-A"
            2 -> name="Peckish"
            else -> name="taco shop of your choice"
        }
    }

    private fun setShopUrl(position:Int){
        when (position) {
            0-> url="https://www.panerabread.com/en-us/home.html"
            1 -> url="https://www.chick-fil-a.com"
            2 -> url="https://www.peckishco.com"
            else -> url="https://www.google.com/search?q=boulder+taco+shop"
        }
    }
}
