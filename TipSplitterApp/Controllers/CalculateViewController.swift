//
//  ViewController.swift
//  TipSplitterApp
//
//  Created by neda niazalizadeh on 2020-07-15.
//  Copyright © 2020 neda niazalizadeh. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    //MARK:- IBOtlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    //MARK:- Vars
    var tip = 0.0
    var numberOfPeople = 0
    var billTotal = 0.0
    var finalResult = "0.0"
    
    //MARK:- lifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculateBtn.layer.cornerRadius = 5
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    //MARK:- IBActions
    
    @IBAction func tipSliderSelected(_ sender: UISlider) {
        
        billTextField.endEditing(true)
        
        tipLabel.text = "tip: " + String(format: "%.0f", sender.value) + "%"
        
        let tipSt = String(format: "%.2f", (sender.value / 100))
        tip = Double(tipSt)!
        
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        
        splitLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        self.performSegue(withIdentifier: "calculateVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calculateVC" {
            
            let destination = segue.destination as! ResultViewController
            destination.result = finalResult
            destination.tip = Int(tip * 100)
            destination.split = numberOfPeople
        }
    }
}

