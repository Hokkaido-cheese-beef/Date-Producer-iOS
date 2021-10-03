//
//  ResultViewController.swift
//  date-producer-ios
//
//  Created by KaitoKudo on 2021/10/03.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var datePlanTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func storeDatePlan(_ sender: Any) {
    }
    
    @IBAction func regenerateDatePlan(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
