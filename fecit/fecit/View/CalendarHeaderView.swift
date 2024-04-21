//
//  CalendarHeaderView.swift
//  fecit
//
//  Created by nayeon  on 4/22/24.
//

import SwiftUI

struct CalendarHeaderView: View {

    @Binding var currentDate: Date
    var addWeek: Bool

    var body: some View {

        HStack {
            Button {
                currentDate = Date.now
            } label: {
                Text("Today")
            }
            .padding(.leading, 10)
            .foregroundColor(.white)
            
            Spacer()

            HStack {
                Text(currentDate.formatted(.dateTime.month(.wide)))
                Text(currentDate.formatted(.dateTime.year()))

            }
            .font(.title2)
            .foregroundColor(.white)

            Spacer()

            HStack(spacing: 15) {
                Button(action: {

                }) {
                    Image(systemName: "ellipsis.rectangle")
                      .foregroundColor(.white)
                }
                
                Button(action: {

                }) {
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.white)
                }
            }         
            .padding(.trailing, 10)
        }.background(Color("MainBlue"))
    }
}

#Preview {
    CalendarHeaderView(currentDate: .constant(Date()), addWeek: false)
}


