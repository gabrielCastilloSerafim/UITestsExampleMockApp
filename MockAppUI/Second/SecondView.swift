//
//  SecondView.swift
//  MockAppUI
//
//  Created by Gabriel Castillo Serafim on 11/8/23.
//  
//

import UIKit

class SecondView: UIViewController {

    // MARK: Properties

    var presenter: SecondPresenterProtocol?
    
    private lazy var secondScreenLabel: UILabel = {
        let label = UILabel()
        label.text = "Login Success!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .black)
        label.textAlignment = .center
        
        label.accessibilityIdentifier = "secondScreenLabel"
        
        return label
    }()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        title = "Second"
        
        view.addSubview(secondScreenLabel)
        secondScreenLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(
            item: secondScreenLabel, attribute: .centerX, relatedBy: .equal,
            toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(
            item: secondScreenLabel, attribute: .centerY, relatedBy: .equal,
            toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }

    // MARK: Methods

}

// MARK: (View <- Presenter)
extension SecondView: SecondViewProtocol {


}
