//
//  Date+Extensions.swift
//  fecit
//
//  Created by nayeon  on 4/30/24.
//

import Foundation

extension Date {
    
    func isEqualDay(_ date: Date) -> Bool {
        let secondDateComponents = Calendar
                   .current
                   .dateComponents(
                       [.year, .month, .day],
                       from: date
               )

        let components = Calendar
                   .current
                   .dateComponents(
                       [.year, .month, .day],
                       from: self
               )

        return secondDateComponents == components
    }

    var month: Int {
        Calendar
            .current
            .component(.month, from: self)
    }

    var year: Int {
        Calendar
            .current
            .component(.year, from: self)
    }

    var numberOfDaysInMonth: Int {
        Calendar
            .current
            .range(of: .day, in: .month, for: self)?
            .count ?? 0
    }

    var weekdayOfMonth: Int {
        Calendar
            .current
            .component(.weekday, from: self)
    }

    init?(year: Int, month: Int, day: Int = 1) {
        guard let date = Calendar
            .current
            .date(
                from: DateComponents(year: year, month: month, day: day)
            ) else { return nil }
        self = date
    }
}
