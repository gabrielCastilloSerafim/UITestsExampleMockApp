//
//  HomeView.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//  
//

import UIKit

class HomeView: UIViewController {

    // MARK: Properties

    var presenter: HomePresenterProtocol?
    
    private lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.backgroundColor = .lightGray.withAlphaComponent(0.25)
        textField.delegate = self
        
        textField.accessibilityIdentifier = "userNameTextField"
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .lightGray.withAlphaComponent(0.25)
        
        textField.accessibilityIdentifier = "passwordTextField"
        
        textField.delegate = self
        return textField
    }()
    
    private lazy var homeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(didTapLogInButton), for: .touchUpInside)
        button.backgroundColor = .black
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        
        button.accessibilityIdentifier = "homeButton"
        
        return button
    }()
    
    private lazy var homeActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = .black
        return activityIndicator
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Home"
        
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(homeButton)
        view.addSubview(homeActivityIndicator)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        // userNameTextField
        NSLayoutConstraint(
            item: userNameTextField, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: userNameTextField, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        
        NSLayoutConstraint(
            item: userNameTextField, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        NSLayoutConstraint(
            item: userNameTextField, attribute: .top, relatedBy: .equal,
            toItem: view, attribute: .topMargin, multiplier: 1, constant: 300).isActive = true
        
        // passwordTextField
        NSLayoutConstraint(
            item: passwordTextField, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: passwordTextField, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        
        NSLayoutConstraint(
            item: passwordTextField, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 40).isActive = true
        
        NSLayoutConstraint(
            item: passwordTextField, attribute: .top, relatedBy: .equal,
            toItem: userNameTextField, attribute: .bottom, multiplier: 1, constant: 32).isActive = true
        
        // homeButton
        NSLayoutConstraint(
            item: homeButton, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: homeButton, attribute: .centerY, relatedBy: .equal,
            toItem: view, attribute: .centerY, multiplier: 1, constant: 200).isActive = true
        
        NSLayoutConstraint(
            item: homeButton, attribute: .height, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 52).isActive = true
        
        NSLayoutConstraint(
            item: homeButton, attribute: .width, relatedBy: .equal,
            toItem: .none, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        
        // homeActivityIndicator
        NSLayoutConstraint(
            item: homeActivityIndicator, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: homeActivityIndicator, attribute: .centerY, relatedBy: .equal,
            toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }

    // MARK: Methods

    @objc private func didTapLogInButton() {
        
        guard let name = userNameTextField.text,
              let password = passwordTextField.text else { return }
        
        presenter?.goToSecondScreen(name: name, password: password)
    }
}

// MARK: (View <- Presenter)
extension HomeView: HomeViewProtocol {

    func showActivityIndicator() {
        homeActivityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        homeActivityIndicator.stopAnimating()
    }
    
    func loginError() {
        homeButton.backgroundColor = .red
    }
}

extension HomeView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
