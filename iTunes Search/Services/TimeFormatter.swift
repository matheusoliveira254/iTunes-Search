//
//  TimeFormatter.swift
//  iTunes Search
//
//  Created by Matheus Oliveira on 1/20/23.
//

import Foundation
    
class TimeFormatter {
    private let formatter = DateComponentsFormatter()
    
    init() {
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
    }
    
    func toString(from seconds: Int) -> String {
        return formatter.string(from: TimeInterval(seconds)) ?? "Time Is Not Available For This Song."
    }
}
