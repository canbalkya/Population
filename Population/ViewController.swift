//
//  ViewController.swift
//  Population
//
//  Created by Can Balkaya on 12/7/19.
//  Copyright © 2019 Can Balkaya. All rights reserved.
//

import UIKit

var humans = [Int]()
var graph = [Human]()
var human = Int()
var newGeneration = Int()
var oldGeneration = Int()
var adultPeople = Int()

class ViewController: UIViewController {
    @IBOutlet weak var lastGenerationTextField: UITextField!
    @IBOutlet weak var numberChildTextField: UITextField!
    @IBOutlet weak var firstPopulationTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func start(lastGeneration: Int, number numberChild: Int, population: Int) {
        for i in 1...lastGeneration {
            if i == 1 {
                adultPeople = (population * 3) / 10
                newGeneration = adultPeople / 2 * numberChild
                human = newGeneration + adultPeople
                
                graph.append(Human(number: human, generation: i))
                humans.append(human)
            }
            
            print("\(humans.last!) in \(i). generation")
            
            oldGeneration = newGeneration
            newGeneration = newGeneration / 2 * numberChild
            human = oldGeneration + newGeneration
            humans.append(human)
            
            if i >= 2 {
                humans.remove(at: 0)
            }
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if lastGenerationTextField.text == nil && numberChildTextField.text == nil && firstPopulationTextField.text == nil {
            let alert = UIAlertController(title: "Alert", message: "Please, fill in all sections!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            start(lastGeneration: Int(lastGenerationTextField.text!)!, number: Int(numberChildTextField.text!)!, population: Int(firstPopulationTextField.text!)!)
        }
    }
}
