//
//  ResultViewController.swift
//  TipSplitterApp
//
//  Created by neda niazalizadeh on 2020-07-17.
//  Copyright © 2020 neda niazalizadeh. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //MARK:- IBOtlets
    @IBOutlet weak var resultlabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var recalculateBtn: UIButton!
    
    //MARK:- Vars
    var result = "0.0"
    var tip = 0
    var split = 0
    
    //MARK:- lifeCycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recalculateBtn.layer.cornerRadius = 5
        
        totalLabel.text = result
        resultlabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    //MARK:- IBAction
    @IBAction func recalculateBtnPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
