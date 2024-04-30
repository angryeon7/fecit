//
//  CalendarViewModel+Extensions.swift
//  fecit
//
//  Created by nayeon  on 4/30/24.
//

import Foundation
import SwiftUI

extension CalendarViewModel {

    func createRandomEvent() {
        let titles = ["Meeting", "Exercise", "Lunch", "Study", "Shopping"]
        let colors: [Color] = [.orange, .blue, .pink, .green, .red, .purple, .yellow]
        
        let randomTitle = titles.randomElement() ?? "Event"
        let randomColor = colors.randomElement() ?? .blue
        
        let randomYear = 2024
        let randomMonth = Int.random(in: 3...5)
        let randomDay = Int.random(in: 1...28)
        
        let randomDate = YearMonthDay(year: randomYear, month: randomMonth, day: randomDay)
        
        createEvent(title: randomTitle, color: randomColor, date: randomDate)
    }
}
