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
        
        //Cria um botao na barra de navegacao direita,barButtonSystemItem tras a opcao de escolher um icon; Action especifica o metodo que sera chamado que no caso sera a acao de compartilhar a foto.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        //torna o titulo pequeno
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    //Pega o evento de toque para a imagem da view aparecer"
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            //esconde a barra de menu superior
            navigationController?.hidesBarsOnTap = true
        }
        
    //Pega o evento de toque para a imagem da view desaparecer/diminuir"
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            //mostra a barra de menu superior
            navigationController?.hidesBarsOnTap = false
        }
    
    
    //funcao que compartilha a foto
    @objc func shareTapped () {
        //pega a imagem exibida e converte-a para jpeg
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print ("No image found")
            return
        }
        
        //Cria a atividade de compartilhamento da imagem, activityItems como primeiro parametro passa-se a image e nos outros campos no array da para colocar outras informacoes como uma string contendo o nome da imagem
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        
        //Liga a atividade de compartilhamento ao botao
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        //Mostra de fato a funcao de compartilhamento na tela
        present(vc, animated: true)
        
        /*
         Quando for clicado e realizado o compartilhamento da foto no app, tera a opcao de 'save image', se for selecioando essa opcao o app gerara um erro, pois o app tentara acessar a biblioteca do usuario para poder gravar a imagem la, mas isso nao eh permitido, a menos que o usuario conceda a permissao primeiro. Para resolver isso eh preciso editar o Info.Plist, adicionando uma linha -> Selecinando Photo 'Privacy - Library Additions Usage Description e no campo value sera colocado a mensagem que sera exibida para o usuario.
         */
    }

    

}
