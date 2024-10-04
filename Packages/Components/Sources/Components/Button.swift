//
//  Button.swift
//  SystemDesign
//
//  Created by Kawyn Furstoss on 9/29/24.
//

import UIKit

public class Button: UIButton {
  
    
    // Custom initializer
  override init(frame: CGRect = CGRect(x: 0, y: 0, width: 150, height: 50)) {
        super.init(frame: frame)
        setupButton()
    }
    
    // For initializing from Storyboards/XIBs
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    // Setup the button's properties
    private func setupButton() {
        // Set corner radius
        layer.cornerRadius = 10
        
        // Set shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 10
        
        // Set gradient background
        applyGradient(colors: [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor])
        
        // Set title color
        setTitleColor(.white, for: .normal)
        
        // Set font
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    // Apply a gradient background to the button
    private func applyGradient(colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Override layoutSubviews to ensure the gradient is applied correctly when the button size changes
  public override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
    }
}
