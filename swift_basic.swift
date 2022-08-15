import Foundation



/*
Conhecimentos adquiridos

Retornando um vetor: '-> [String]'
Retornando um Dictionary: '-> [String, Int]'

*/


//TUPLES

//Nao podem ter o tamanho, tipo e 'chave' modificados.Ex.: Um endereço: let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
//eh possivel acessar usando o indice ('.index') ou a chave ('.key')
var tup = (first:"Maxwell", last:"Farias")
tup = (first:"StringQualquer", last:"StringQualquer") //Para modificar eh necessario fazer referencia a mesma chave


//SETS
// Set('Coloca o "array'), eh usada como uma lista de valores unicos, Ex.: Uma lista de IDs
let sets = Set(["Maxwell", "Max", "Maxwell", "Max"])
var setii = Set<String>()

//DICTIONARY
var dict = ["Maxwell":"Chocolate",
"Dany": "Menta"]
let result = dict["chave_nao_cadastrada", default: "valor_inexistente"] //ao pesquisar a chave pode-se colocar um valor padrao que 
//sera retornado em caso de nao existir a chave, caso contrario retornaria nil
    //Declarando variaveis vazias
var dict2 = [String: String]()
var dict3 =  Dictionary<String, String>()


//ENUMERATIONS
//Funciona como se fosse um objeto so para armazenar propriedades, eh usado para corre
    enum Activity{
        case running (destination: String)// pode ser colocado uma informacao a mais e ao chamar o enum
        //pode-se acrescentar o valor (no caso de um inteiro)
        case talking
    }

    //print(Activity.running(destination: "Maceio"))


    enum ConnectionState: Int {
       case Unknow = -1 //Ao colocar um valor no primeiro case, eh atribuido um valor acrescido de 1 para cada caso.
       case Connect
       case Connecting 
       case Connected
    }
    var test = ConnectionState.Unknow //Atribuindo o valor para uma variavel
    test = .Connecting //Forma por meio de inferencia do valor, poderia ser tambem na forma completa: 'ConnectionState.Connection'
    print(test)
    

    //Eh usado para armazenar opcoes que sao realacionadas entre si a fim de que criar um isolamento de seguranca nas opcoes que 
    //estao sendo executadas. Sua aplicação se torna interesssante para que seja feita comparações
    enum BeltColor{
        case white
        case blue
        case purple
        case brown        
        case black
        case red
        
    }
    
    //Enum com Switch case
    var myBelt:BeltColor = .white //Ao ser declarada por explicito o tipo do enum, quando for atribuir um valor, pode somente
    //usar '.valor_desejado'

    //No Excode ja implementaria todas as possibilidades automaticamente
    /*
    switch myBelt {
        case .white, .red:             
        print("White or red")
        case .black:
            print("black")
        default:
        print("Whatever")
        
    }
    */
    //Definindo um valor fixo para cada case do enum. Para trabalhar com indices padronizados, basta declarar o enum do tipo Int
    //Os valores serao colocados no indice zero em diante
    enum BeltColor2:Int{
        case white = 1// ao colocar no primeiro casa um valor inteiro, todos os demais valores recebem +1. Uma vez definido um rawValue
        //numca mais podera ser modificado
        case blue
        case purple
        case brown        
        case black
        case red
        
    }
    var myBelt2: BeltColor2 = .red
    print("My color is \(myBelt2.rawValue)") //rawValue permite acessar o indice 
    myBelt2 = BeltColor2(rawValue: 3)!//Sempre que se iniciar um enumeration atraves do rawValue, o resultado sera um valor opicional, por isso
    //eh necessario desenvelopa-lo com o '!'

    //Usando valores assiciados
        //Sao informacoes adicionais que nao interferem no funcionamento basico do enumeration. 
    
    enum BeltColor3 {
        case white
        case blue
        case purple
        case brown (Int)       
        case black (String, Int)
        case red
    }
    var myBelt3:BeltColor3 = .black("3° grua", 3) //As informacoes adicionais sao atribuidas somente quando essas informacoes forem
    //passadas para outro objeto
    myBelt3 = .black("4°", 4) //Elas podem se modificadas a qualquer momento, ao contrario do rawValue
    
    //Usando as informacoes adicionais no switch case
    switch myBelt3 {
        case .brown(let year):
        print("Faixa marron a \(year) anos")
        case .black(let degree, let year):
        print("Faixa preta, \(degree) grau a \(year) anos")
        default:
        print("default")
    }renia aos asscietaed
    //Nao eh possivel usar os rawValues junto com os associated  values. A orientacao eh dar prefe


//TERNARY OPERATOR
let firstcard = 10
let secondcard = 11
//firstcard == secondcard ? "Eh igual": "Eh diferente" //Retornara "Eh diferente"

//SWITCH
//fallthrough //Faz com que o proximo caso seja obrigatoriamente executado


//LOOP
let v = [12,3,4,5,67]
for _ in v { //  '_'Omiti o valor 
    //codigo
}

//FUNCTION

func sumF (numbers:Int...) { // '...' Faz com que possa ser colocado infinitos valores como parametro
//o tratando posteriormente como um vertor
    var sum = 0
    for num in numbers {
        sum += num
    }
print(sum)

}
    //Writing throwing functions
    enum PasswordError: Error {
        case obvious
    }
    //Eh necessario colocar o lancamento de excecao ante do tipo de retorno
    func checkPassword (password:String) throws -> Bool {
        if password == "password" {
            throw PasswordError.obvious //lanco a excecao caso o password seja o que eu programei
        } else {
            return true
        }

    }
    //Forma de pegar as excecoes
    do {
        let check = try checkPassword(password: "password")
        print("password Ok! \(check)")
    } catch PasswordError.obvious { //Especificando o catch a ser pego
         // print("wrong password")
    }
     catch { //Catch pegara o erro geral 
      print("Other error")
    }    

//INOUT parameters
//Ao se colocar inout antes do tipo do parametro da funcao, significa que ele ira receber um
//endereco e tudo o que for modificado dentro da funcao, modificara o parametro fora da funcao
//Eh necessario colocar '&' ao passar o parametro na funcao
func doubleInPlace(number: inout Double) {
    number *= 2
}

var numberDouble = 10.0
doubleInPlace(number: &numberDouble) 
print(numberDouble)
