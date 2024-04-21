//
//  ActionView.swift
//  fecit
//
//  Created by nayeon  on 4/18/24.
//

import SwiftUI

struct ActionView: View {
    var body: some View {
        VStack {
            VStack {
                CalendarHeaderView(currentDate: .constant(Date()), addWeek: false)
                    .padding(10)
                WeekdayView()
            }
            .background(Color("MainBlue"))
            Spacer()
        }
    }
}

#Preview {
    ActionView()
}



