//
//  QuestionViewController.swift
//  date-producer-ios
//
//  Created by KaitoKudo on 2021/10/03.
//

import GoogleMobileAds
import RxCocoa
import RxSwift
import UIKit

class FirstQuestionViewController: UIViewController {
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var myNameTextField: UITextField!
    @IBOutlet weak var myGenderButton: UIButton!
    @IBOutlet weak var myAgeButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        myNameTextField.placeholder = "10文字以下で入力"
        setBinding()
    }
    
    @IBAction func selectMyGender(_ sender: Any) {
    }
    
    @IBAction func selectMyAge(_ sender: Any) {
    }
    
    private func setBinding() {
        myNameTextField.rx.text
            .orEmpty
            .asDriver()
            .drive { [weak self] (text) in
                if text.count > 10 {
                    self?.nextQuestionButton.isEnabled = false
                } else {
                    self?.nextQuestionButton.isEnabled = true
                }
            }
            .disposed(by: disposeBag)
    }
    
}
