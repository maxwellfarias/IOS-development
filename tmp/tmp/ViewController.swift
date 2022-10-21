//
//  ViewController.swift
//  tmp
//
//  Created by Maxwell Santos Farias on 20/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        myBtn.backgroundColor = .yellow
        myBtn.setTitle("Modified Text", for: UIControl.State.normal)
        myBtn.setTitleColor(.black, for: UIControl.State.normal)
      
    }


}

