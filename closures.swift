//CLOSURES
    //Eh basicamente o lambda no Kotlin

    //Exemplo basico
    let printName = {  //Tipo :()->String
        "Meu nome eh Maxwell"
    }

    func recebePrintName (printNameParam:()->String) {
        print(printNameParam())
    }
          
    recebePrintName(printNameParam: printName)

    //Armazenando uma funcao em uma variavel
    let sum = { (a:Int, b:Int)-> Int in
        return a+b
    }
    //usando uma funcao generica
    func generic(function:(Int, Int)->Int)->Int {
        return function (40,50)
    }
    //Encurtando as declaracoes
    generic {(a:Int, b:Int) -> Int in
        return a-b
    }

    generic {a,b in //O tipo dos parametros e retorno tambem
        a/b //Se for em uma unica linha, o return pode ser omitido
    }
    generic { //Forma mais resumida possivel, $n, sendo `n`a representando um parametro
        $0-$1
    }

    //Retornando closures from function
    func typeYourName () -> (String)->Void {
        return {
            print("My name is \($0)")
            //Esse trecho de codigo faz a mesma coisa que o codigo abaixo.
        }
        /*
        return{ (name:String)->Void in
            print("My name is \(name)")
        }
         */
    }
    let testes = typeYourName() //testes agora eh uma funcao que recebe uma string e imprime-a
    
    func generic2 (a:Int, b:Int, function:(Int, Int)->Int)->Int {
        return function(a,b)
    }
    //Usando argumentos junto com Trailing Closures
    generic2(a: 10, b: 90) {a, b in
        return a+b
    }

            
