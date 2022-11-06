//
//  DetailViewController.swift
//  Project1
//
//  Created by Maxwell Santos Farias on 03/11/22.
//

import UIKit

//Tela onde sera exibida a imagem grande
class DetailViewController: UIViewController {
    //imagem que sera manipulada para aparecer na tela inteira
    @IBOutlet var imageView: UIImageView!
    
    //a variavel sera do tipo opcional, porque o viewController for criado, essa variavel ainda nao existira e precisara comercar com nil
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        
        //torna o titulo pequeno
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    //Pega o evento de toque a view "aparecendo"
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //esconde a barra de menu superior
        navigationController?.hidesBarsOnTap = true
    }
    
    //Pega o evento de toque a view "desaparecendo"
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //mostra a barra de menu superior
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
