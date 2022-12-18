//
//  ViewController.swift
//  project 5
//
//  Created by Maxwell Farias on 17/12/22.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var usedWords = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        //take the URL from the start.txt
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            //It takes the content of start.txt and turns it into a String
            if let startWords = try? String (contentsOf: startWordsURL) {
                //It returns a array separated By "\n
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty{
            allWords = ["silkworm"]
        }
        
        startGame()
    }
    
    func startGame () {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        //forces it to call numberOfRowsInSection again, as well as calling cellForRowAt repeatedly
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer () {
        let ac = UIAlertController(title: "Enter Answer", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        //self and ac are weak references
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            //as a method of the class itself is being used inside the closure, it is necessary to use self explicitly
            self?.submit(answer)
            
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func submit (_ answer: String) {
        
    }


}

