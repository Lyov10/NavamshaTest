//
//  Extension+UIView.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation
import UIKit

extension UIView {
    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
}
