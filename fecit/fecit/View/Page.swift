//
//  Page.swift
//  fecit
//
//  Created by nayeon  on 4/30/24.
//

import Foundation

struct Page {
    let month: Int
    let year: Int
    let heighlighted: [Date]
    let selected: Date?
    var select: ((Date) -> Void) = { _ in }

    var date: Date? {
        Date(year: year, month: month)
    }

    var weeks: [Week] {
        guard let date = date else { return [] }
        let firstDayInMonth = date.weekdayOfMonth - 1
        
        let previousMonthDays = self.previousMonthDays
        let lastPreviousMonthVisibleDays = previousMonthDays - firstDayInMonth + 1
        let daysInPreviousMonth = (min(previousMonthDays, lastPreviousMonthVisibleDays)...previousMonthDays)
            .map { Day(number: $0, isEnabled: false) }

        
        let numberOfDaysInMonth = date.numberOfDaysInMonth
        let daysInCurrentMonth = (1...numberOfDaysInMonth)
            .map(dayModelFor(day:))

        
        let missingDaysInNextMonth = 42 - (firstDayInMonth + numberOfDaysInMonth)
        
        let daysInNextMonth = (1...missingDaysInNextMonth)
            .map { Day(number: $0, isEnabled: false) }

        let daysOnPage = daysInPreviousMonth + daysInCurrentMonth + daysInNextMonth

        var weeks = [Week]()
        for firstDayInWeek in stride(from: 0, to: 42, by: 7) {
            let daysInWeek = daysOnPage[firstDayInWeek..<(firstDayInWeek + 7)]

            weeks.append(
                Week(days: Array(daysInWeek))
            )
        }

        return weeks
    }

    private var previousMonthDays: Int {
        if month == 1 {
            return Date(year: year - 1, month: 12)?
                .numberOfDaysInMonth ?? 0
        } else {
            return Date(year: year, month: month - 1)?
                .numberOfDaysInMonth ?? 0
        }
    }

    private func dayModelFor(day: Int) -> Day {
        let today = Date()
        let dayDate = Date(year: year, month: month, day: day) ?? today

        let isHeighlighted = heighlighted
            .first(where: { $0.isEqualDay(dayDate) }) != nil
        return Day(
            number: day,
            isHeighlighted: isHeighlighted,
            isSelected: selected?.isEqualDay(dayDate) == true,
            isCurrent: today.isEqualDay(dayDate),
            onSelect: { self.select(dayDate) }
        )
    }
}
