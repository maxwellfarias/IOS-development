//
//  ViewController.swift
//  consolidation_I
//
//  Created by Maxwell Farias on 02/01/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var listItems = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        title  = "Shopping List"
        
        
        
    }
    
    @objc func promptForAnswer () {
        let ac =  UIAlertController(title: "Adding Item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) {[weak self, weak ac] _ in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.listItems.append(answer)
            
            
            self?.listItems.insert(answer, at: 0)
            
            //Creating the animation when adding the row
            //the row number should equal the position we added the item in the array – position 0, in this case
            let indexPath = IndexPath(row: 0, section: 0)
            self?.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        cell.textLabel?.text = listItems[indexPath.row]
        return cell
    }


}

