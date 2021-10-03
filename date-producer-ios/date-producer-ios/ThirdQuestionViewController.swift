//
//  ThirdQuestionViewController.swift
//  date-producer-ios
//
//  Created by KaitoKudo on 2021/10/03.
//

import GoogleMobileAds
import UIKit

class ThirdQuestionViewController: UIViewController {

    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }
}
