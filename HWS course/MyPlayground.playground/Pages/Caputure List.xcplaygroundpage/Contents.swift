import UIKit



//CAPTURE LIST: Weak, Strong, unowned


//STRONG
class Singer {
    func playSong () {
        print("Close your eyes")
    }
}

func sing () -> () -> Void {
     let mylesKennedy = Singer()
    
    /*STRONG REFERENCE
     This means the closure will capture any external values that are used inside the closure, and make sure they never get destroyed
    */
    let singing = {
        return mylesKennedy.playSong()
    }
    
    return singing
}

let singFunc = sing()
singFunc()


//WEAK

func singWeak () -> () -> Void {
     let mylesKennedy = Singer()
    
    /*WEAK REFERENCE
     
    */
    let singing = { [weak mylesKennedy] in
       mylesKennedy?.playSong()
        return
    }
    
    return singing
}



let singFuncW = singWeak()
singFuncW() //Como nao sera mantida a referencia a singer, mylesKennedy? sera valor nulo e devido ao uso do '?'o codigo nao gerara um erro






func singUnowned () -> () -> Void {
    let MylesKennedy = Singer()
    
    let singing = { [unowned MylesKennedy] in
        MylesKennedy.playSong()//seria o mesmo que usar o weak so que com o MylesKennedy!.playSong()
        return
    }
    
    return singing
}

let singFuncUnowned = singUnowned()
singFuncUnowned ()






