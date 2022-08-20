//CLASS
    /*
     OBSERVACOES GERAIS
     * A Keyword `final` nao permiti que uma determinada classe seja herdada ou metodos sobreescritos.
     */
class Dog {
    var name: String
    var breed: String
    
    init(name:String, breed:String){
        self.name = name
        self.breed = breed
    }
    func printName () -> Void{
        print("Name is: \(name)")
    }
}

//Herenca
class Poodle: Dog {
    init(name:String) {
        //super.init acessa o construtor da classe pai
        super.init(name: name, breed: "poodle")
    }
    
}

var pet = Poodle(name: "Mel")


//PROTOCOLS
    //Eh basicamente a interface do kotlin

protocol Animal {
    var id: String { get set}
}
protocol Behavior: Animal {
    func speak ()->Void
}

struct Duck: Animal, Behavior { //Pode implementar varios protocolos
    func speak() {
        print("KuaKua")
    }
    
    var id: String
}

func displayID (animal:Animal){
    print("The ID is \(animal.id)")
}

let littleDuck = Duck(id: "123hiio")
littleDuck.speak()


displayID(animal: littleDuck)

//EXTENSION
    //Adiciona uma nova funcao a um determinado objeto

    //Todos os numeros inteiros passarao a ter a funcao square
extension Int {
    func square () -> Int {
        print("Seu codingKey eh: \(codingKey)")
        return self * self //self faz referencia ao numero inteiro
      //Dentro do bloco da funcao, eh possivel acessar as propriedade e metodos no Int
        
    }
    
}
    //Protocol-oriented programming

protocol Idetifiable {
    var id: String {get set}
    func identify()
}

//Quando se colocar um extension em um protocolo, a classe que o implementar nao precisara
//implementar tambem a funcao, uma vez que ela recebe uma implementacao padrao da extension
extension Identifiable {
    func identify () {
        print("Your code is: \(id)")
    }
}

class Test: Identifiable {
    var id: String = "sd"
    func identify () {
        print("Your new code is: \(id)")
    }
}
