//
//  Extension+UIButton.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation
import UIKit

extension UIButton {
    func setRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func addBorder(width: CGFloat = 1, color: UIColor) {
         layer.borderWidth = width
         layer.borderColor = color.cgColor
         layer.masksToBounds = true
     }
    
}
