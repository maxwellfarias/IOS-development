//HANDING MISSION DATA
    //O principio eh semelhante ao Kotlin, usa-se '?' nas variaveis para dizer que ela pode receber um valor nil
    //UNWRAPPING OPTIONALS

        //if let pega o valor caso nao seja nulo, mas so permiti usa-lo dentro do primeiro bloco
let stringForTest:String? = "TEST"
if let gettingString = stringForTest {
    print("String nao eh nil: \(gettingString)")
    
} else {
    print("String eh nil")
}
    //guard let pega o valor caso nao seja nulo, podendo usa-lo no resto do bloco da funcao
func testingGuard (name: String?) {
    guard let gettingString = name else {
        print ("The value is nil")
        return
    }
    print("the value is: \(gettingString)")
}

    //FORCING UNWRAPPING
    let nameNumber = "5"
    let optionalNum = Int(nameNumber) //Como existe a possibilidade de que a string colocada nao seja o numero, o num sera um tipo inteiro que pode receber nil
    let num = Int(nameNumber)! // O '!' faz com que o `num`seja do tipo inteiro, mas caso seja nil o codido gerara um erro.

    //NIL COALESCING `??`, eh o operador elvis do kotlin
func userName (for id:Int) ->String? {
    if id == 1 {
        return "User logado"
    } else {
        return nil
    }
}
userName(for: 1) ?? "Identificador nao encontrado"

    //OPTIONAL CHAINING
let names = ["Maxwell", "Dani", "Eva"]
let firtName = names.first?.uppercased() //That question mark is optional chaining – if first returns nil then Swift won’t try to uppercase it, and will set firtName to nil immediately.


//OPTIONAL TRY


    //TRATAMENTO DE ERROS
//throws -> Bool, define que a funcao pode lancar um erro ou retornar um valor Bool

//Defining an enum that describes the errors we can throw
enum PasswordError:Error {
case obvious
}

//funcao que verifica se o valor digitado eh igual a "password", caso seja, sera lançado um erro, caso contrario, retornara verdadeiro.
func checkPassword (for password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
        return true
}

do {
    try checkPassword(for: "password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//try?   ,eh colocado antes da funcao, caso a funcao lance um erro, o valor retornado sera nil
let returnPassword = try? checkPassword(for: "password")
type(of: returnPassword)

//try! retornara um tipo nao optional, o que gerara um erro caso o valor seja nil
let returnPassword2 = try! checkPassword(for: "qualquerNome")
type(of: returnPassword2)


//FAILEABE INITIALIZERS
class Person {
    var id: String
    
    //init? permite que o inicializador possa retorna um nil
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let person = Person(id: "maxwelloo")
person?.id
    

   //TYPECASTING
class Animal {}

class Fish: Animal {}

class Dog:Animal {
    func makeNoise () {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog(), Fish(), Dog()]
type(of: pets) //Como Fish e Dog sao filhos de Animal, o swift cria um array de animals
for pet in pets {
    if let dog = pet as? Dog { //pet as? Dog retornara um nil se pet nao for do tipo Dog, por usar o `if let`o bloco so sera usado caso o retorno nao for nil, nesse caso dog recebera o objeto Dog do array
        dog.makeNoise()
    }
}

