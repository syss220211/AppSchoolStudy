//
//  ChartViewController.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/04.
//

import SwiftUI
import WebKit

class ChartViewController: UIViewController {
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uikitSetup()
    }
    
    
    func uikitSetup() {
        let label: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 50)
            label.text = "0"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        // button
        let plusButton: UIButton = {
            let button = UIButton()
            button.setTitle("+1", for: .normal)
            button.backgroundColor = .cyan
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 7
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let stackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.alignment = .fill
            sv.distribution = .fill
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(plusButton)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            //stackview layout
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
}
