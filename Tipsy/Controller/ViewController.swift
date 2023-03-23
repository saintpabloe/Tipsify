//
//  ViewController.swift
//  Tipsy
//
//  Created by Ranis Sharifullin on 3/20/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var tipTest: Float = 0.1
    var calculatorTipsy = CalculatorTipsy()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPtcButton: UIButton!
    @IBOutlet weak var tenPtcButton: UIButton!
    @IBOutlet weak var twentyPtcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let textBill: String = billTextField.text ?? "Done"
        
        if sender == (zeroPtcButton) {
            zeroPtcButton.isSelected = true
            tenPtcButton.isSelected = false
            twentyPtcButton.isSelected = false
            tipTest = Float(sender.currentTitle ?? "0") ?? 0.0
            
        } else if sender == (tenPtcButton) {
            zeroPtcButton.isSelected = false
            tenPtcButton.isSelected = true
            twentyPtcButton.isSelected = false
            tipTest = Float(sender.currentTitle ?? "0") ?? 0.1
        } else {
            zeroPtcButton.isSelected = false
            tenPtcButton.isSelected = false
            twentyPtcButton.isSelected = true
            tipTest = Float(sender.currentTitle ?? "0") ?? 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let people = splitNumberLabel.text ?? "2"
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let amount: Float = Float(billTextField.text!)!
        let people: Float = Float(splitNumberLabel.text!)!
        let extra: Float = tipTest
        
        calculatorTipsy.calculatorTips(bill: amount, percentTip: extra, people: people)
        print(calculatorTipsy.calculatorTips(bill: amount, percentTip: extra, people: people))
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.people = calculatorTipsy.getPeople()
            destinationVC.checkForPeroson = calculatorTipsy.getCheckForPerson()
            destinationVC.tipPercent = calculatorTipsy.getTip()
        }
    }
}

