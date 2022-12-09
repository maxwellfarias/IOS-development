//
//  ViewController.swift
//  Project4
//
//  Created by Maxwell Santos Farias on 08/11/22.
//

import UIKit
import WebKit

// A class ViewController tem como pai a classe UIViewController e aceita todos os protocolos (interface) de WKNavigationDelegate. Eh necessario estar nessa ordem, primeiro superClasse e depois o protocolo. Sem esse protocolo, o navigationDelegate gerara um erro.
class ViewController: UIViewController, WKNavigationDelegate {
    
    var websites = ["apple.com", "hackingwithswift.com"]
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    //ciclo de vida que define o que sera carregado na view
    override func loadView() {
        webView = WKWebView()
        
        //Quando qualquer navegacao de pagina web acontecer, o view controller atual sera informado
        webView.navigationDelegate = self
        
        //view eh a propriedade que faz referencia a view raiz do viewController que agora passara a ser exibida por uma webview
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Cria uma URL atraves da string
        let url = URL(string: "https://" + websites[0])!
        //Carrega a site (IOS quer que seja acessado sites https)
        webView.load(URLRequest(url: url))
        //Habilita avancar e voltar paginas arrastando as bordas
        webView.allowsBackForwardNavigationGestures = true
     
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "open", style: .plain, target: self, action: #selector(openTapped))
        
        //Cria uma progressView padrao
        progressView = UIProgressView(progressViewStyle: .default)
        //Define que o tamanha do progressView se encaixara totalmente no conteudo para caber
        progressView.sizeToFit()
        //Cria um UIBarButtonItem por meio de uma progressView que sera adicionada posteriormente ao barra inferior
        let progressButton = UIBarButtonItem(customView: progressView)
        
        //Adiciona um espaco flexivel empurrando os demais botoes da barra inferior a direita
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        //Adiciona o espaco e o botao de recarregar a pagina na barra inferior (botao de barra de progresso - espaco  - botao para recarregar)
        toolbarItems = [progressButton, spacer, refresh]
        //mostra a barra
        navigationController?.isToolbarHidden = false
        
        
        //sera usado a observacao de valor chave (key value observing - KVO) a fim de usar na barra de progresso, a proprieade WKWebView.estimatedProgress tem um valor de 0 a 1 que sera usado para definir a progress bar, o metodo a seguir eh usado para observar esse valor.
        //paramegtro 1: Quem eh o observador, par 2: propriedade a ser observada, par 3: Qual valor queremos (queremos o valor que acabou de ser definido, entao queremos o novo), par 4: Contexto
        //#keyPath permite que o compilador verifique se o seu codigo esta correto, ou seja, se existe mesmo a propriedade estimatedProgress em WKWebView
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        
         
        
       
    }
    
    @objc func openTapped () {
        let ac = UIAlertController(title: "Open Page", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        //Informa ao IOS onde esta o actionSheet
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        
        present(ac, animated: true)
        
    }
    
    //O parametro handler usado para adicionar uma acao no UIAlert deve ser uma funcao que tera como parametro a propria UIAlertAction, dessa forma o openPage tera acesso ao conteudo do title da referida UIAlertAction.
    func openPage (action: UIAlertAction) {
        let url = URL (string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
        
    }
    
    //Com a navigation Delegate da web View, sera informado os eventos de navegacao, o codigo abaixo sera chamado quando uma pagina web terminar de ser carregada, nesse caso iremos apenas mudar o seu titulo
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    //Esse metodo tem como finalidade fazer uma verificacao de URL para garantir que o usuario sempre permaneca nos sites listados
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void){
        //Pega a URL que estava querendo ser acessada
        let url = navigationAction.request.url
        
        //Verifica se ela esta na lista e caso positivo, sera liberada
        if let host = url?.host {
            for website in websites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    
                    //saia do metodo agora
                    return
                }
            }
        }
        //cancel loading
        decisionHandler(.cancel)
        
    }
    
    //Observa a alteracao do valor
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //Se o estimatedProgress foi alterado, a barra de progresso sera setada com o novo valor
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
   

    
    
    //TEST
 


}

