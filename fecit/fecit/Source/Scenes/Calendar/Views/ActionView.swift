//
//  ActionView.swift
//  fecit
//
//  Created by nayeon  on 4/18/24.
//

import SwiftUI

public struct ActionView: View {
    @ObservedObject public var viewModel: CalendarViewModel
    @State private var offsetY: CGFloat = 0
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                VStack {
                    CalendarHeaderView(viewModel: viewModel)
                        .padding(10)
                    WeekdayView()
                }
                .background(Color("MainBlue"))
                
                ScrollViewReader { scrollViewProxy in
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            CalendarGridView(weeks: viewModel.current.weeks, events: groupEventsByDate(events: viewModel.readEvents(for: YearMonthDay.current)))
                                                            .frame(maxWidth: .infinity)
                                                            .animation(.default)
                                                            .id("MonthView")
                                .frame(maxWidth: .infinity)
                                .animation(.default)
                                .id("MonthView")
                        }
                    }
                    .onAppear {
                        scrollViewProxy.scrollTo("MonthView", anchor: .top)
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                let translation = value.translation.height
                                if offsetY <= 10 && translation > 20 {
                                    viewModel.previousPage()
                                } else if offsetY >= value.translation.height && translation < -20 {
                                    viewModel.nextPage()
                                }
                            }
                    )
                }
            }
            ScheduleCreationButton()
                .padding(.bottom, 10)
        }
    }

    public init(viewModel: CalendarViewModel) {
        self.viewModel = viewModel
    }
    
    private func groupEventsByDate(events: [Event]) -> [YearMonthDay: [Event]] {
        var groupedEvents = [YearMonthDay: [Event]]()
        for event in events {
            let date = YearMonthDay(year: event.date.year, month: event.date.month, day: event.date.day)
            if var eventsForDate = groupedEvents[date] {
                eventsForDate.append(event)
                groupedEvents[date] = eventsForDate
            } else {
                groupedEvents[date] = [event]
            }
        }
        return groupedEvents
    }
}

struct ScheduleCreationButton: View {
    var body: some View {
        Button(action: {
            // TODO: - 일정 만들기 로직 작성
        }) {
            HStack {
                Image(systemName: "square.and.pencil")
                Text("New Action")
                Image(systemName: "chevron.up")
                    .padding(.leading,15)
            }
            .foregroundColor(.white)
            .padding([.leading,.trailing],25)
            .padding([.top,.bottom],15)
            .background(Color("MainBlue"))
            .cornerRadius(25)
        }
    }
}


public struct ActionView_Previews: PreviewProvider {
    static public var previews: some View {
        let dayTimeInterval: TimeInterval = 24 * 60 * 60
        let viewModel = CalendarViewModel(heighlighted: [.init(timeIntervalSinceNow: dayTimeInterval)])
        return ActionView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
