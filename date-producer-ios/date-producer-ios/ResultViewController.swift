//
//  ResultViewController.swift
//  date-producer-ios
//
//  Created by KaitoKudo on 2021/10/03.
//

import GoogleMobileAds
import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var datePlanTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
    
    @IBAction func storeDatePlan(_ sender: Any) {
    }
    
    @IBAction func regenerateDatePlan(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
