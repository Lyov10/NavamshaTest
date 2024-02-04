//
//  Extension+Int.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation
extension Int {
    func toMinutesSecondsString() -> String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
