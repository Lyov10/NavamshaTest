//
//  Extension+UIColor.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import UIKit
import Foundation

public extension UIColor {
    
    static var cellBackgroundColor : UIColor {UIColor(hexString: "#2D2638") }
    static var backgrounColor: UIColor {UIColor(hexString: "#1E1826")}
    static var buttonBackground: UIColor {UIColor(hexString: "#7658A2")}
    static var mainViewBackground: UIColor {UIColor(hexString: "#100C16")}
    static var textColor: UIColor {UIColor(hexString: "#FFFBF8")}
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var hex: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&hex)
        let hex32 = UInt32(hex & 0xFFFFFFFF)
        self.init(hex: hex32, alpha: alpha)
    }
}
