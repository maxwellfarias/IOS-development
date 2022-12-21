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
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "Start Game", style: .plain, target: self, action: #selector(startGame))
        
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
    
    @objc func startGame () {
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
        let lowerAnswer = answer.lowercased()

        if isPossible(word: lowerAnswer) {
            if isOriginal(word: lowerAnswer) {
                if isReal(word: lowerAnswer) {
                    //inserts an element in the first position of the array and pushes the others
                    usedWords.insert(answer, at: 0)
                    
                    //Creating the animation when adding the row
                    //the row number should equal the position we added the item in the array – position 0, in this case
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .automatic)
                    //return forces Swift to exit the method immediately once the table has been updated
                    return
                } else {showErrorMesasage(errorTitle: "Word not recognised", errorMessage: "You can't just make them up, you know!")
                }
            } else { showErrorMesasage(errorTitle: "Word used already", errorMessage: "Be more original!")}
        } else {
            guard let title = title?.lowercased() else {return}
            showErrorMesasage(errorTitle: "Word not possible", errorMessage: "You can't spell that word from \(title)")
        }
    }
    
    func isPossible (word:String) -> Bool {
        guard var tempWord =  title?.lowercased() else {return false}
        for letter in word {
            //Checks if each letter of the word that was typed is in 'tempWord', if so, 'position' will receive the position and the letter will be removed from 'tempWord' in order not to have duplicates
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {return false}
        }
        return true
    }
    
    func isOriginal (word:String) -> Bool {
        return !usedWords.contains(word)
    }
    
    func isReal (word:String) ->Bool {
        //Class that checks for grammatical errors
        let checker = UITextChecker()
        //Class that declares a range and will be used in 'misspelledRange' / word.utf16 was used for compatibility with object-c in order to correctly count string length
        let range = NSRange(location: 0, length: word.utf16.count)
        //Retorna um NSRange que sera usado para verificar erros gramaticais do 'word'
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        //'.location' is used to return the index where the grammar error starts, if there is no error, NSNotFound will be returned
        return misspelledRange.location == NSNotFound
    }
    
   func showErrorMesasage (errorTitle:String, errorMessage:String) {
       let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
       ac.addAction(UIAlertAction(title: "Ok", style: .default))
       present(ac, animated: true)
    }


}

