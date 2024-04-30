//
//  CalendarViewModel.swift
//  fecit
//
//  Created by nayeon  on 4/29/24.
//

import SwiftUI

final public class CalendarViewModel: ObservableObject {
    @Published public var selectedDate: Date?
    @Published var current: Page
    @Published var events: [Event] = [] 
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: Date(year: current.year, month: current.month) ?? Date())
    }
    
    private(set) lazy var weekdaySymbols: [String] = DateFormatter().shortWeekdaySymbols

    public init(
        today: Date = .init(),
        heighlighted: [Date] = .init(),
        selectedDate: Date? = nil
    ) {
        self.heighlighted = heighlighted
        self.today = today
        self.current = Page(
            month: today.month,
            year: today.year,
            heighlighted: heighlighted,
            selected: selectedDate
        )
        self.current.select = update(date:)
    }

    private let heighlighted: [Date]
    private let today: Date

    func nextPage() {
        if current.month == 12 {
            reloadPage(
                month: 1,
                year: current.year + 1
            )
        } else {
            reloadPage(
                month: current.month + 1,
                year: current.year
            )
        }
    }

    func previousPage() {
        if current.month == 1 {
            reloadPage(
                month: 12,
                year: current.year - 1
            )
        } else {
            reloadPage(
                month: current.month - 1,
                year: current.year
            )
        }
    }

    private func update(date: Date) {
        selectedDate = date
        reloadPage(
            month: current.month,
            year: current.year
        )
    }

    private func reloadPage(
        month: Int,
        year: Int
    ) {
        current = Page(
            month: month,
            year: year,
            heighlighted: heighlighted,
            selected: selectedDate,
            select: update(date:)
        )
    }
    
    func createEvent(title: String, color: Color, date: YearMonthDay) {
        let event = Event(title: title, color: color, date: date)
        events.append(event)
    }
    
    func updateEvent(event: Event, newTitle: String, newColor: Color, newDate: YearMonthDay) {
    }
    
    func deleteEvent(event: Event) {
    }
    
    func readEvents(for date: YearMonthDay) -> [Event] {
        return events
    }
}
