//
//  GraphVC.swift
//  Population
//
//  Created by Can Balkaya on 12/7/19.
//  Copyright © 2019 Can Balkaya. All rights reserved.
//

import UIKit

class GraphVC: UIViewController {
    @IBOutlet weak var graphView: View!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        graphView.contentMode = .scaleAspectFit
    }
}
