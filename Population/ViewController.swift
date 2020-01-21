//
//  ViewController.swift
//  Population
//
//  Created by Can Balkaya on 12/7/19.
//  Copyright © 2019 Can Balkaya. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var numberChildTextField: UITextField!
    @IBOutlet weak var firstPopulationTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = UIColor(named: "Color2")
        toolBar.tintColor = UIColor(named: "Color1")

        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(ViewController.dismissKeyboard))

        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        numberChildTextField?.inputAccessoryView = toolBar
        firstPopulationTextField?.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func start(number numberChild: Int, population: Int) {
        for i in 1...9 {
            if i == 1 {
                adultPeople = (population * 3) / 10
                newGeneration = adultPeople / 2 * numberChild
                human = newGeneration + adultPeople
                
                humans.append(human)
                humansLast.append(human)
            }
            
            oldGeneration = newGeneration
            newGeneration = newGeneration / 2 * numberChild
            human = oldGeneration + newGeneration
            
            humans.append(human)
            humansLast.append(human)
            
            if i >= 2 {
                humans.remove(at: 0)
            }
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        if numberChildTextField.text == "" && firstPopulationTextField.text == "" {
            let alert = UIAlertController(title: "Alert", message: "Please, fill in all sections!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true)
        } else {
            if Int(numberChildTextField.text!)! > 9 {
                let alert = UIAlertController(title: "Alert", message: "The child number cannot be greater than 15!", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .default)
                alert.addAction(action)
                self.present(alert, animated: true)
            } else {
                if Int(firstPopulationTextField.text!)! > 10000000000 {
                    let alert = UIAlertController(title: "Alert", message: "The first population cannot be greater than 10000000000!", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(action)
                    self.present(alert, animated: true)
                } else {
                    humans.removeAll()
                    humansLast.removeAll()
                    
                    start(number: Int(numberChildTextField.text!)!, population: Int(firstPopulationTextField.text!)!)
                    performSegue(withIdentifier: "toView", sender: nil)
                }
            }
        }
    }
    
    @IBSegueAction func action(_ coder: NSCoder, sender: Any?) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: AnalyzesView())
    }
}
