//
//  ContentView.swift
//  SystemCalendar
//
//  Created by Nithi on 7/14/20.
//

import SwiftUI

struct SmallCalendar: View {
    // Spacing
    private let smallCalendarVSpacing: CGFloat = -3
    private let eventVSpacing: CGFloat = 7.0
    private let eventHSpacing: CGFloat = 5.0
    private let numberPadding: CGFloat = 8.0
    private let eventDetailsVSpacing: CGFloat = 2.0

    // Dimensions
    private let barWidth: CGFloat = 4.0
    private let shortEventBarHeight: CGFloat = 16.0
    private let tallEventBarHeight: CGFloat = 31.0
    private let barCornerRadius: CGFloat = 2.0

    // Fonts
    private let dayFont: Font = Font.system(size: 11.0, weight: .semibold, design: .default)
    private let numberFont: Font = Font.system(size: 34.0, weight: .light, design: .default)
    private let eventTitleFont: Font = Font.system(size: 13.0, weight: .semibold, design: .default)
    private let eventTimeFont: Font = Font.system(size: 12.0, weight: .regular, design: .default)

    // Strings
    private let day: String = "Tuesday"
    private let number: String = "14"
    private let event1Title: String = "Ary's Birthday"
    private let event2Title: String = "iOS Dinner"
    private let event2Time: String = "8:30 - 9:30 PM"

    var body: some View {
        VStack(alignment: .leading, spacing: smallCalendarVSpacing) {
            Text(day.uppercased())
                .font(dayFont)
                .foregroundColor(.red)
            Text(number)
                .font(numberFont)
                .padding(.bottom, numberPadding)

            VStack(spacing: eventVSpacing) {
                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.3137254902, green: 0.6745098039, blue: 0.9490196078, alpha: 1)))
                        .frame(width: barWidth, height: shortEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                    Text(event1Title)
                        .font(eventTitleFont)
                    Spacer()
                }

                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9176470588, green: 0.262745098, blue: 0.4156862745, alpha: 1)))
                        .frame(width: barWidth, height: tallEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))

                    VStack(alignment: .leading, spacing: eventDetailsVSpacing) {
                        Text(event2Title)
                            .font(eventTitleFont)
                        Text(event2Time)
                            .font(eventTimeFont)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }
            }
            
            Spacer()
        }
        .padding(.top)
        .padding(.leading)
    }
}

struct SmallCalendar_Previews: PreviewProvider {
    static var previews: some View {
        SmallCalendar().previewLayout(.fixed(width: 160, height: 160))
    }
}
