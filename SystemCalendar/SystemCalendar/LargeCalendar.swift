//
//  LargeCalendar.swift
//  SystemCalendar
//
//  Created by Nithi on 7/14/20.
//

import SwiftUI

struct LargeCalendar: View {
    // Spacing
    private let largeCalendarVSpacing: CGFloat = 8.0
    private let eventVSpacing: CGFloat = 6.0
    private let eventHSpacing: CGFloat = 5.0
    private let dividerHSpacing: CGFloat = 8.0
    private let tomorrowPaddingTop: CGFloat = 4.0
    private let tomorrowPaddingBottom: CGFloat = -2.0

    // Dimensions
    private let barWidth: CGFloat = 4.0
    private let shortEventBarHeight: CGFloat = 16.0
    private let tallEventBarHeight: CGFloat = 31.0
    private let barCornerRadius: CGFloat = 2.0

    // Fonts
    private let dateFont: Font = Font.system(size: 13, weight: .semibold, design: .default)
    private let eventTitleFont: Font = Font.system(size: 15, weight: .semibold, design: .default)
    private let eventTimeFont: Font = Font.system(size: 14, weight: .regular, design: .default)
    private let tomorrowTitleFont: Font = Font.system(size: 13, weight: .semibold, design: .default)

    // Strings
    private let date: String = "Tuesday, Jul 14"
    private let event1Title: String = "Ary's Birthday"
    private let event2Title: String = "iOS Dinner"
    private let event2TimeStart: String = "8:30 PM"
    private let event2TimeEnd: String = "9:30 PM"
    private let tomorrowTitle: String = "Tomorrow"
    private let event3Title: String = "Tax Day"
    private let allDayTime: String = "all-day"

    var body: some View {
        VStack(alignment: .leading, spacing: largeCalendarVSpacing) {
            Text(date.uppercased())
                .font(dateFont)
                .foregroundColor(.red)

            Divider().padding(.horizontal, dividerHSpacing)

            VStack(spacing: eventVSpacing) {
                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.3137254902, green: 0.6745098039, blue: 0.9490196078, alpha: 1)))
                        .frame(width: barWidth, height: shortEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                    Text(event1Title)
                        .font(eventTitleFont)
                    Spacer()
                    Text(allDayTime).font(eventTimeFont)
                }

                Divider().padding(.horizontal, dividerHSpacing)

                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9176470588, green: 0.262745098, blue: 0.4156862745, alpha: 1)))
                        .frame(width: barWidth, height: tallEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                    Text(event2Title)
                        .font(eventTitleFont)
                    Spacer()
                    VStack {
                        Text(event2TimeStart)
                            .font(eventTimeFont)
                        Text(event2TimeEnd)
                            .font(eventTimeFont).foregroundColor(.gray)
                    }
                }

            }

            Text(tomorrowTitle.uppercased()).font(tomorrowTitleFont).foregroundColor(.gray).padding(.top, tomorrowPaddingTop).padding(.bottom, tomorrowPaddingBottom)

            Divider().padding(.horizontal, dividerHSpacing)

            HStack(spacing: eventHSpacing) {
                Rectangle()
                    .fill(Color(#colorLiteral(red: 0.7529411765, green: 0.4784313725, blue: 0.8588235294, alpha: 1)))
                    .frame(width: barWidth, height: shortEventBarHeight)
                    .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                Text(event3Title)
                    .font(eventTitleFont)
                Spacer()
                Text(allDayTime).font(eventTimeFont)
            }

            Spacer()
        }
        .padding(.all)
    }
}

struct LargeCalendar_Previews: PreviewProvider {
    static var previews: some View {
        LargeCalendar().previewLayout(.fixed(width: 320, height: 320))
    }
}
