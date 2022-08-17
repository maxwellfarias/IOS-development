import UIKit


//STRUCTS
struct Sport {
    var flag: Bool
    
    //PROPERTY OBSERVERS: Sempre que a variavel name for modificada, sera executado o bloco 'didSet
    var name: String {
        didSet{
            print("Name modified, the new name is: \(name)")
        }
    }
    
    //Computed Properties roda primeiro o codigo para saber qual valor atribuir para a variavel
    var isGoodSport:String {
        if flag {
            return "The flag is true"
        } else {
            return "The flag is false"
        }
    }
    
    //Para que um metodo de uma struct possa mudar uma variavel eh necessario colocar o 'mutating' antes da func
    mutating func printName ()->String {
        name = "Other name"
        return "The name is \(name)"
        
    }
    
    
}
var tennis = Sport( flag: true, name: "Tennis")
tennis.printName()

//LAZY PROPERTIES
    struct FamilyTree {
        init (){
            print("Tree started")
        }
    }

    struct Person {
        var name: String
        lazy var tree =  FamilyTree() //O bloco init da struct FamilyTree so sera inicializado quando a variavel tree for utilizada
        init(name:String) {
            self.name = name
        }
    }
    var person = Person(name: "Maxwell")
    person.tree
