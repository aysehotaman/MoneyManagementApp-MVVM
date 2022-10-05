//
//  LoginScreenViewController.swift
//  money-management-mvvm
//
//  Created by Ayşe Hotaman on 14.09.2022.
//

import UIKit
import SnapKit

final class LoginScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
        signUpButton.addTarget(self, action: #selector(signUpAction), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    }
    
    // go to sign up VC
    @objc private func signUpAction() {
        let goToRegisterVC = SignUpViewController()
        goToRegisterVC.modalPresentationStyle = .fullScreen
        self.present(goToRegisterVC, animated: true, completion: nil)
    }
    
    @objc private func signInAction() {
        let goToHomeVC = HomeScreenViewController()
        goToHomeVC.modalPresentationStyle = .fullScreen
        self.present(goToHomeVC, animated: true, completion: nil)
    }
    
    private func setUpViews() {
        
        view.backgroundColor = .white
        
        view.addSubview(questionLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        view.addSubview(segmentedControl)
        
        makePassText()
        makeSignUpButton()
        makeEmailText()
        makeQuestionLabel()
        makeSignInButton()
        makeSegmentedControl()
    }
    
    private let questionLabel: UILabel = {
        let questionLabel = UILabel()
        questionLabel.textAlignment = .center
        questionLabel.text = "Hesabınız yok mu?"
        return questionLabel
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.textAlignment = .center
        emailTextField.borderStyle = .roundedRect
        emailTextField.autocorrectionType = .no
        emailTextField.autocapitalizationType = .none
        emailTextField.clearButtonMode = .whileEditing
        return emailTextField
    }()
    
    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Şifre"
        passwordTextField.textAlignment = .center
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearButtonMode = .whileEditing
        return passwordTextField
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Giriş Yap", for: .normal)
        signInButton.setTitleColor(.systemBlue, for: .normal)
        return signInButton
    }()
    
    private let signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("Kaydolun", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
        return signUpButton
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Kişisel Hesap", "Ortak Hesap"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = .black
        segmentedControl.backgroundColor = .systemYellow
        return segmentedControl
    }()
}

extension LoginScreenViewController {
    private func makeSegmentedControl() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(50)
        }
    }
    
    private func makeEmailText() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(50)
            make.leading.equalTo(segmentedControl)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(segmentedControl.snp.height).offset(-10)
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
    
    private func makeSignInButton() {
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp_bottomMargin).offset(50)
            make.height.equalTo(emailTextField.snp.height)
            make.centerX.equalToSuperview()
        }
    }
    
    private func makeQuestionLabel() {
        questionLabel.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp_bottomMargin).offset(100)
            make.leading.equalTo(segmentedControl).multipliedBy(-2)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    private func makeSignUpButton() {
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp_bottomMargin).offset(100)
            make.leading.equalTo(segmentedControl).multipliedBy(6)
            make.trailing.equalTo(segmentedControl)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
}
