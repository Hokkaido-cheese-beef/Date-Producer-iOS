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
    @IBOutlet weak var myAgeTextField: UITextField!
    @IBOutlet weak var myGenderButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        myNameTextField.placeholder = "10文字以下で入力"
        myAgeTextField.placeholder = "年齢を入力"
        setBinding()
        setMenuToButton()
    }
    
    //入力画面またはkeyboardの外を押したら、キーボードを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (myNameTextField.isFirstResponder) {
            myNameTextField.resignFirstResponder()
        } else if myAgeTextField.isFirstResponder {
            myAgeTextField.resignFirstResponder()
        }
    }
    
    private func setBinding() {
        // 文字数制限
        myNameTextField.rx.text
            .orEmpty
            .asDriver()
            .drive(onNext: { [weak self] (text) in
                if text.count > 10 {
                    self?.nextQuestionButton.isEnabled = false
                } else {
                    self?.nextQuestionButton.isEnabled = true
                }
            })
            .disposed(by: disposeBag)
        
        myNameTextField.rx
            .controlEvent(.editingDidEnd)
            .asDriver()
            .drive(onNext: { _ in
                // キーボードが閉じた時に処理が走る
                print("editingDidEnd")
            })
            .disposed(by: disposeBag)
    }
    
    private func setMenuToButton() {
        // 以下、性別選択
        let addNone = UIAction(title: "未選択", image: nil) { (action) in
            self.myGenderButton.setTitle("未選択", for: .normal)
            print("未選択")
        }
        let addMan = UIAction(title: "男性", image: nil) { (action) in
            self.myGenderButton.setTitle("男性", for: .normal)
            print("男性")
        }
        let addWoman = UIAction(title: "女性", image: nil) { (action) in
            self.myGenderButton.setTitle("女性", for: .normal)
            print("女性")
        }
        let menu = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: [addNone, addMan, addWoman])
        myGenderButton.menu = menu
        myGenderButton.showsMenuAsPrimaryAction = true
    }
    
}
