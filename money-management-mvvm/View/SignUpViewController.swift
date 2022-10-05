//
//  SignUpViewController.swift
//  money-management-mvvm
//
//  Created by Ayşe Hotaman on 14.09.2022.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        segmentedControl.addTarget(self, action: #selector(switchAccounts), for: .valueChanged)
        signUpButton.addTarget(self, action: #selector(createAccount), for: .touchUpInside)
    }
    
    
    @objc func switchAccounts() {
        switch segmentedControl.selectedSegmentIndex {
        case 0: // personal account
            emailTextField.isHidden = false
            codeTextField.isHidden = true
            idTextField.isHidden = false
            
        case 1: // joint account
            emailTextField.isHidden = false
            idTextField.isHidden = true
            codeTextField.isHidden = false
        default:
            break;
        }
    }
    
    @objc func createAccount() {
        let popUpVC = AlertViewController()
        popUpVC.modalPresentationStyle = .overCurrentContext
        popUpVC.modalTransitionStyle = .crossDissolve
        present(popUpVC, animated: true, completion: nil)
    }
    
    private func setUpViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(emailTextField)
        view.addSubview(idTextField)
        view.addSubview(signUpButton)
        view.addSubview(segmentedControl)
        view.addSubview(codeTextField)
        view.addSubview(passwordTextField)
        
        makeIdText()
        makeSignUpButton()
        makeEmailText()
        makeSegmentedControl()
        makeCodeText()
        makePassText()
    }
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Kişisel Hesap", "Ortak Hesap"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .black
        segmentedControl.backgroundColor = .systemYellow
        return segmentedControl
    }()
    
    private let idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.placeholder = "T.C. Kimlik Numaranız"
        idTextField.textAlignment = .center
        idTextField.borderStyle = .roundedRect
        idTextField.autocorrectionType = .no
        idTextField.autocapitalizationType = .none
        idTextField.clearButtonMode = .whileEditing
        return idTextField
    }()
    
    private let codeTextField: UITextField = {
        let codeTextField = UITextField()
        codeTextField.placeholder = "Kullanıcı Kodunuz"
        codeTextField.textAlignment = .center
        codeTextField.borderStyle = .roundedRect
        codeTextField.autocorrectionType = .no
        codeTextField.autocapitalizationType = .none
        codeTextField.clearButtonMode = .whileEditing
        return codeTextField
    }()
    
    private let emailTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "E-mail Adresiniz"
        passwordTextField.textAlignment = .center
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = .whileEditing
        return passwordTextField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Şifreniz"
        passwordTextField.textAlignment = .center
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = .whileEditing
        return passwordTextField
    }()
    
    private let signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("Kaydolun", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        return signUpButton
    }()
    
}

extension SignUpViewController {
    private func makeSegmentedControl() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
    }
    
    private func makeIdText() {
        idTextField.snp.makeConstraints { make in
            
            make.top.equalTo(segmentedControl.snp.bottom).offset(50)
            make.leading.equalTo(segmentedControl)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(segmentedControl.snp.height).offset(-10)
        }
    }
    
    private func makeCodeText() {
        codeTextField.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(50)
            make.leading.equalTo(segmentedControl)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(segmentedControl.snp.height).offset(-10)
        }
    }

    private func makeEmailText() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(25)
            make.leading.equalTo(segmentedControl)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(idTextField.snp.height)
        }
    }
    
    private func makePassText() {
        passwordTextField.snp.makeConstraints { make in
            
            make.top.equalTo(emailTextField.snp.bottom).offset(25)
            make.leading.equalTo(segmentedControl)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    private func makeSignUpButton() {
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(50)
            make.height.equalTo(passwordTextField.snp.height)
            make.centerX.equalToSuperview()
        }
    }
}
