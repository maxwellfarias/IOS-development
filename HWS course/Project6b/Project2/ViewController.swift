//
//  ViewController.swift
//  Project2
//
//  Created by Maxwell Santos Farias on 05/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let metrics = ["labelHeight": 88]
        
        let label1 = UILabel()
        //because by default iOS generates Auto Layout constraints for you based on a view's size and position. We'll be doing it by hand, so we need to disable this feature.
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = UIColor.red
        label1.text = "THESE"
        //Sized to fit their content
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()

        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()

        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()

        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()

        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        /*
        ::::::::::::::   create Auto Layout constraints using Visual Format Language :::::::::::::::
         
         
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewsDictionary.keys {
            /*H:|[\(label)]|  is  a technique called Auto Layout Visual Format Language (VFL), which is kind of like a way of drawing the layout you want with a series of keyboard symbols ->  It means: "horizontally, I want my label1 to go edge to edge in my view."
             
             * H: in horizontal
             * | ... |  to go edge to edge
             * (label) viewsDictionary's keys
             */
            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|",options: [], metrics: nil, views: viewsDictionary))
            
            /**
             * V: in vertical
             * | Note that our vertical VFL doesn't have a pipe at the end, so we're not forcing the last label to stretch all the way to the edge of our view
             * - space of 10 points by default
             */
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]", metrics: nil, views: viewsDictionary))
            
            /**
             * (labelHeight) is the key of the dictionary created to contain information about the height of the label (metrics). This dictionary will be passed in the metric parameter, so it is not necessary to use hard code (== 88)
             * ->=10-  add a constraint for the bottom edge saying that the bottom of our last label must be at least 10 points away from the bottom of the view controller's view
             * Causes the property of (label1) to be inherited
             * we're going to make the label height have priority 999 (i.e., very important, but not required. This will make the labels lower your priority so that all can adjust and get as close to 88 height as possible
             */
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]->=10-|", metrics: metrics, views: viewsDictionary))
                                 
        }
        */
        
        // AUTO LAYOUT ANCHORS -  it???s often the best choice
      //  CODE USED IN THE CLASS:
        /*
        
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            
            //The first time the loop goes around that will be nil, but then we???ll set it to the current item in the loop so the next label can refer to it. If previous is not nil, we???ll set a topAnchor constraint.
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
                //we add an else block we can push the first label away from the top of the safe area, so it doesn???t sit under the notch
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label
        }
         */
        
        
        
        
        
        
        // :::::::   CHALLENGE ::::::::::::
        
        
        /* 1) Try replacing the widthAnchor of our labels with leadingAnchor and trailingAnchor constraints, which more explicitly pin the label to the edges of its parent
         2) Once you???ve completed the first challenge, try using the safeAreaLayoutGuide for those constraints. You can see if this is working by rotating to landscape, because the labels won???t go under the safe area.
         3) Try making the height of your labels equal to 1/5th of the main view, minus 10 for the spacing. This is a hard one, but I???ve included hints below!

         */
        
        var previous: UILabel?
        
        
        for label in [label1, label2, label3, label4, label5] {
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            //you can simply define the rate by the multiplier. It is possible to place the 'constant' parameter right after 'multiplier' in order to specify that the value specified in the 'constant' will be added or subtracted from the final result of the proportion
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/5).isActive = true
            
            //The first time the loop goes around that will be nil, but then we???ll set it to the current item in the loop so the next label can refer to it. If previous is not nil, we???ll set a topAnchor constraint.
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
                //we add an else block we can push the first label away from the top of the safe area, so it doesn???t sit under the notch
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            
            previous = label
        }

        
    }
    
}


