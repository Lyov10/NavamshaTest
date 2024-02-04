//
//  DataManager.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    func fetchData() -> [Mantra]? {
        
        if let path = Bundle.main.path(forResource: "Mantras", ofType: "plist"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            
            do {
                let mantras = try PropertyListDecoder().decode([Mantra].self, from: data)
                return mantras
            } catch {
                print("Error decoding plist data: \(error)")
                return nil

            }
        } else {
            print("Error reading or parsing the plist file.")
        }
        return nil
    }
}
