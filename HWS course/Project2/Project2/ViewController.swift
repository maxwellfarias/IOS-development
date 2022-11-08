//
//  ViewController.swift
//  Project2
//
//  Created by Maxwell Santos Farias on 05/11/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet weak var barItem: UIBarButtonItem!
    
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
            
            updateScore()
            
            //Cria uma linha de borda nas bandeiras
            button1.layer.borderWidth = 1
            button2.layer.borderWidth = 1
            button3.layer.borderWidth = 1
            
            
            //Mundando as cores das bordas
            button1.layer.borderColor  = UIColor.lightGray.cgColor
            button2.layer.borderColor  = UIColor.lightGray.cgColor
            button3.layer.borderColor  = UIColor.lightGray.cgColor
            //obs.: O layer esta em uma camada abaixo no UIcolor e por isso eles nao conseguem "conversar", os layers aceitam os tipos de cores do cgColor (que esta no mesmo nivel),no codigo acima foi chamado a UIColor.lightGray e no final foi convertido para cgcolor coloando '.cgColor'
            
            //Tira os espaco entre a imagem e as bordas
            button1.configuration?.contentInsets = NSDirectionalEdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0)
            button2.configuration?.contentInsets = NSDirectionalEdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0)
            button3.configuration?.contentInsets = NSDirectionalEdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0)
            
            askQuestion(action: nil)
            
            //Modificando o style do barra de navegacao
        /*
            self.navigationController!.navigationBar.barStyle = .black
            self.navigationController!.navigationBar.isTranslucent = false
            self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor:UIColor.white]
         */
        
        
            
            //Adiciona um comentaria acima do titulo
            //navigationItem.prompt = NSLocalizedString("Fazendo o test", comment: "")
            
            
        /*
         
         //Adiciona um botao de acao no canto direito
         
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(addTrapped))
        
    }
    
            @objc func addTrapped () {
                
            }
         */
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
       var title:String
       
       if sender.tag == correctAnswer {
           title = "Correct"
           score += 1
       } else {
           title = "Wrong"
           if score > 0 {
               score -= 1
           }
           
       }
        
        updateScore()
       
       //Cria o alerta
       let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
       
       //adiciona o botao de acao ao clicar em 'Continue'. Handlew espera que o nome do metodo que realizara uma acao, metodo precisa obrigatoriamente ter como parametro um 'UIAlertAction!' -> Parte que eu nao entendi: Dizendo que o UIAlertAction foi tocado.
       ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
       
       //Mostra o alerta
       present (ac, animated: true)
       
        
   
   

   }
        
    
    
    func askQuestion (action: UIAlertAction!) {
        //Muda a ordem dos nomes
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        //Atribui a imagem aos botoes
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        
        title = countries[correctAnswer].uppercased()
        
        
    }
    
    func updateScore () {
        if score < 1 {
            barItem.title = "Score: \(0)"
        } else {
            barItem.title = "Score: \(score)"
        }
    }
        
        
  

     
}


