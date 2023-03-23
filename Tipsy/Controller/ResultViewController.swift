//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ranis Sharifullin on 3/22/23.
//

import UIKit

class ResultViewController: UIViewController {

    var checkForPeroson: String?
    var people: Int?
    var tipPercent: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = checkForPeroson
        settingsLabel.text = "Split between \(people!) people, with \(tipPercent!)% tip."
        // Do any additional setup after loading the view.
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
