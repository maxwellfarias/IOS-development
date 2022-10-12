
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let redBox = UIView(frame: CGRect.zero) //o parametro usado faz com que o frame seja zerado
        redBox.backgroundColor = .green
        self.view.addSubview(redBox)
        redBox.translatesAutoresizingMaskIntoConstraints = false //Declara que sera usado constraints?
        redBox.heightAnchor.constraint(equalToConstant: 200).isActive = true
        redBox.centerXAnchor.constraint(
            equalTo: self.view.centerXAnchor).isActive = true
        redBox.centerYAnchor.constraint(
            equalTo: self.view.centerYAnchor).isActive = true
        
        //Cria uma constraint completa com todos os seus atributos
        let widthCons = NSLayoutConstraint (
            item: redBox,
            attribute: NSLayoutConstraint.Attribute.width,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: nil,
            attribute: NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier: 1.0,
            constant: 150)
        
        redBox.addConstraint(widthCons)
    
        
        /*
        //HARDING CODE OUTLETS
        let myLabel  = UILabel()
        
            //Cria um frame para colocar no lugar especificado o label
        let myFrame = CGRect(x: 0,
                             y: 153,
                             width: self.view.frame.size.width,
                             height: 112)
        
        myLabel.frame = myFrame
        
        
        myLabel.text = "Label"
        myLabel.backgroundColor = UIColor.orange // you can use just .orange
        myLabel.textAlignment = NSTextAlignment.center // .center
        myLabel.font = UIFont.systemFont(ofSize: 24) // .systemFont(ofSize: 24)
        
        self.view.addSubview(myLabel)
        
        */
     
        
    }


}

