//Classes
class Vehicle{
    var wheelNum=4
    var speed=25
    var mpg=20
    let tankCapacity=20
    var name: String?
    
    func changeSpeed(amount: Int){
        speed+=amount
    }
    func changeEfficiency(newSpeed:Int,newmpg:Int){
        speed=newSpeed
        mpg=newmpg
    }
    //Swift will create default initalizers if you don't use one
    //However if you create one, then you have to put the default yourself
    //You can create mutiple initalizers using different vars

    init(vehicleName vname:String){
        name=vname
    }
    init(){
    }
}

let myJeep=Vehicle()
myJeep.mpg
myJeep.speed
myJeep.name
myJeep.changeEfficiency(newSpeed: 35, newmpg:25)
myJeep.changeSpeed(amount: 10)
myJeep.mpg
myJeep.speed

let newV=Vehicle(vehicleName: "Prius")
newV.mpg
newV.speed
newV.name

if(newV.name != nil){
    print(newV.name!)
}

//inheritance
class Bicycle: Vehicle{
    var reflectors: Bool?
    init(_ ref: Bool) {
        // _ for no external variable name
        reflectors=ref
        super.init() //use superclass constructor (can call any init defined, but would have to pass the needed info when creating objects)
        //self.wheelNum=2 //can initalize wheelNuma after using superclass init
    }
}
var bike = Bicycle(false)
bike.wheelNum
bike.wheelNum=2
bike.wheelNum


//-----------------------------------
//Structs
struct Skateboard{
    var color:String
    var type:String
}
var board=Skateboard(color: "black", type: "longboard")
board.color
var newBoard=board
newBoard.color
newBoard.color="red"
newBoard.color
board.color
