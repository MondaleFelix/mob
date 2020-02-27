//
//  ViewController.swift
//  AutoLayout
//
//  Created by Mondale on 2/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    let foodImageView: UIImageView = {
        let foodImage = UIImage(named: "food")
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
        self.view.backgroundColor = .white
        view.addSubview(descriptionTextView)
        
        setupLayout()
        addGradientToView(view: view)

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
    }
    
    
    
    func addGradientToView(view: UIView)
    {
            //gradient layer
            let gradientLayer = CAGradientLayer()
            
            //define colors
            gradientLayer.colors = [UIColor.orange.cgColor, UIColor.purple.cgColor]
            
            //define locations of colors as NSNumbers in range from 0.0 to 1.0
            //if locations not provided the colors will spread evenly
        gradientLayer.locations = [0.0, 1]
            
            //define frame
            gradientLayer.frame = view.bounds
            
            //insert the gradient layer to the view layer
            view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

