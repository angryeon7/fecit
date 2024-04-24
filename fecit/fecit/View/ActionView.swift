//
//  ActionView.swift
//  fecit
//
//  Created by nayeon  on 4/18/24.
//

import SwiftUI

//TODO: 스크롤 변경
struct ActionView: View {
    @State private var currentPage = 0
    @State private var months: [Date] = []
    @State private var currentDate = Date()

    var body: some View {
        VStack {
            VStack {
                CalendarHeaderView(currentDate: $currentDate, addWeek: false)
                    .padding(10)
                WeekdayView()
            }
            .background(Color("MainBlue"))
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { scrollView in
                    VStack(spacing: 0) {
                        ForEach(0..<12) { index in
                            let month = Calendar.current.date(byAdding: .month, value: index, to: currentDate)!
                            CalendarGridView(currentDate: .constant(month))
                                .id(index)
                                .frame(height: UIScreen.main.bounds.height * 0.96) 
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .offset(y: CGFloat(currentPage) * -UIScreen.main.bounds.height)
                    .onAppear {
                        let currentMonth = Calendar.current.component(.month, from: currentDate)
                        currentPage = currentMonth - 1
                        scrollView.scrollTo(currentPage)
                    }
                }
            }
            Spacer()
        }
        .coordinateSpace(name: "scroll")
    }
}

#Preview {
    ActionView()
}
