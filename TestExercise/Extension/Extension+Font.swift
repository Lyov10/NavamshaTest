//
//  Extension+Font.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import UIKit
import Foundation

public extension UIFont {
    
    static func nunitoBold(size: CGFloat) -> UIFont? {
        
        UIFont.init(name: "Nunito-Bold", size: size)
    }
    
    static func peachiBlack(size: CGFloat) -> UIFont? {
        
        UIFont.init(name: "peachi-black", size: size)
    }
}
