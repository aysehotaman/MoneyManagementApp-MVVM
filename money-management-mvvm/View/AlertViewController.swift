//
//  AlertViewController.swift
//  money-management-mvvm
//
//  Created by Ayşe Hotaman on 14.09.2022.
//

import UIKit
import SnapKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.definesPresentationContext = true
        
        // make background transparent
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.isOpaque = false
        
        setUpViews()
        
        okButton.addTarget(self, action: #selector(okAction), for: .touchUpInside)
    }
    
    private func setUpViews(){
        
        view.addSubview(popUpView)
        popUpView.addSubview(okButton)
        popUpView.addSubview(accountNo)
        popUpView.addSubview(accountLabel)
        popUpView.addSubview(alertMessage)
        
        makeAccountLabel()
        makePopUpBox()
        makeMessage()
        makeAccountNo()
        makeOKButton()
    }
    
    // return to log in page
    @objc func okAction() {
        let vc = LoginScreenViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    private let popUpView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let accountLabel: UILabel = {
        let accountLabel = UILabel()
        accountLabel.textAlignment = .center
        accountLabel.text = "Hesap Numaranız: "
        return accountLabel
    }()
    
    private let okButton: UIButton = {
        let okButton = UIButton()
        okButton.setTitle("Giriş Sayfasına Dön", for: .normal)
        okButton.setTitleColor(.systemBlue, for: .normal)
        return okButton
    }()
    
    private let alertMessage: UILabel = {
        let alertMessage = UILabel()
        alertMessage.text = "Bilgileriniz başarılı bir şekilde kaydedilmiştir!"
        alertMessage.font = UIFont.boldSystemFont(ofSize: 18)
        return alertMessage
    }()
    
    private let accountNo: UILabel = {
        let accountNo = UILabel()
        accountNo.textAlignment = .center
        accountNo.font = UIFont.boldSystemFont(ofSize: 20)
        accountNo.text = "1234567"
        return accountNo
    }()
    
}
extension AlertViewController {
    private func makePopUpBox() {
        popUpView.snp.makeConstraints { make in
        
            make.leading.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func makeMessage(){
        alertMessage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
    }
    
    private func makeAccountLabel() {
        accountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(alertMessage.snp.top).offset(80)
        }
    }
    
    private func makeAccountNo() {
        accountNo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountLabel.snp.top).offset(50)
        }
    }
    
    private func makeOKButton(){
        okButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(accountNo.snp.top).offset(70)
        }
    }
}
