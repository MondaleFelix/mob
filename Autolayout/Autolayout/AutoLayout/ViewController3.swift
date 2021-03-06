//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mondale on 2/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hello", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.layer.backgroundColor = UIColor.yellow.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    let foodImageView: UIImageView = {
        let foodImage = UIImage(named: "student")
        let foodImageView = UIImageView(image: foodImage)
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        foodImageView.contentMode = .scaleAspectFit
        return foodImageView
    }()
    
    let descriptionTextView : UITextView = {
        let textView = UITextView()
        
        let attibutedText = NSMutableAttributedString(string: "This product is a scam. Give us your money", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attibutedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see your money!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attibutedText
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(descriptionTextView)
        descriptionTextView.addSubview(continueButton)
        setupLayout()

    }

    private func setupLayout(){
        
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        topImageContainerView.addSubview(foodImageView)
        
        foodImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        foodImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        foodImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func buttonPressed(){
        print("hello pressed")
    }
}

