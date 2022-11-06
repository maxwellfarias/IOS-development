//
//  ViewController.swift
//  Project1
//
//  Created by Maxwell Santos Farias on 24/10/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()
    
    
    override func viewDidLoad () {
        
        //Titulo usado na barra de navegacao
        title = "Storm Viewer"
        
        //Torna o titulo grande, as telas que sao empilhadas no controlador de exibicao herdam o estilo do seu antecessor, por isso todos os demais temas das telas empilhadas serao grandes (o que nao eh interessante para os padroes da Apple)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //Permite trabalhar com o sistema de arquivos e o usaremos para procurar arquivos
        let fm = FileManager.default
        
        //Define o caminho do diretorio que contem os arquivos principais do programa a fim de encontrar as fotos que estao "soltas" junto com os arquivos principais do app.
        let path = Bundle.main.resourcePath!
        
        //items recebera um array de strings contendo os nomes dos arquivos
        let items = try! fm.contentsOfDirectory(atPath: path)
    
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        //Ordena os valores
        pictures = pictures.sorted()
    
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count //Nesse metodo todo, foi colocado apenas o retorno informando o numero total de linhas a serem exibidas.
    }
    
    
    //Cria o conteudo de cada linha
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //IndexPath contem o numero da sessao e o numero da linha da celula
    
        //Cria a celula que sera manipulada, eh necessario informar no withIdentifier: 'Nome_do_identificador' especificado na IB no identificador da Table View Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
      
        cell.textLabel?.text = "Picture \(indexPath.row+1) of \(pictures.count)"
        
        return cell //retorna com a celula criada
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Pega uma instancia do ViewController de acordo com um identificador (Detail). O retorno sera um UiViewController, entao eh necessario converter usando typecasting (as?) que o UiViewController eh do tipo um DetailViewController. Assim podemos ter a instancia viva DetailViewController e acessar as suas propriedades e metodos
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            
            //Faz com que uma nova tela seja empilhada em cima da tela atual, que tem como parametro a instancia da tela a ser visualizada e se tera animacao na transicao. Isso se da deviodo ao navegation Controle.
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    

}

