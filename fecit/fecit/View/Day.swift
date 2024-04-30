//
//  Day.swift
//  fecit
//
//  Created by nayeon  on 4/30/24.
//

import Foundation

struct Day {
    let number: Int
    var isHeighlighted = false
    var isSelected = false
    var isEnabled = true
    var isCurrent = false
    var onSelect: (() -> Void) = {}
}

struct Week: Identifiable {
    let id = UUID()
    let days: [Day]
}
