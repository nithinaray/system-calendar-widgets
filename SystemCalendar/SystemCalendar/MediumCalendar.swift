//
//  MediumCalendar.swift
//  SystemCalendar
//
//  Created by Nithi on 7/14/20.
//

import SwiftUI

struct MediumCalendar: View {
    // Spacing
    private let eventVSpacing: CGFloat = 7.0
    private let eventHSpacing: CGFloat = 5.0
    private let eventsTrailingPadding: CGFloat = 36.0
    private let monthBottomPadding: CGFloat = 3.0
    private let tomorrowPaddingTop: CGFloat = 4.0
    private let tomorrowPaddingBottom: CGFloat = -2.0

    // Dimensions
    private let barWidth: CGFloat = 4.0
    private let shortEventBarHeight: CGFloat = 16.0
    private let tallEventBarHeight: CGFloat = 31.0
    private let barCornerRadius: CGFloat = 2.0
    private let columns: Int = 7
    private let rows: Int = 6
    private let dayHighlightCircle: CGFloat = 18.0
    private let dayHighlightCircleX: CGFloat = 55.75
    private let dayHighlightCircleY: CGFloat = 92.0

    // Fonts
    private let monthFont: Font = Font.system(size: 11.0, weight: .semibold, design: .default)
    private let eventTitleFont: Font = Font.system(size: 13.0, weight: .semibold, design: .default)
    private let eventTimeFont: Font = Font.system(size: 12.0, weight: .regular, design: .default)
    private let tomorrowTitleFont: Font = Font.system(size: 11, weight: .semibold, design: .default)

    // Strings
    private let event1Title: String = "Ary's Birthday"
    private let event2Title: String = "iOS Dinner"
    private let event2Time: String = "8:30 - 9:30 PM"
    private let tomorrowTitle: String = "Tomorrow"
    private let event3Title: String = "Tax Day"
    private let month: String = "July"

    // Content
    private let calendarContent: [[String]] = [["S", "M", "T", "W", "T", "F", "S"], ["", " ", " ", "1", "2", "3", "4"], ["5", "6", "7", "8", "9", "10", "11"], ["12", "13", "14", "15", "16", "17", "18"], ["19", "20", "21", "22", "23", "24", "25"], ["26", "27", "28", "29", "30", "31", " "]]

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: eventVSpacing) {
                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.3137254902, green: 0.6745098039, blue: 0.9490196078, alpha: 1)))
                        .frame(width: barWidth, height: shortEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                    Text(event1Title)
                        .font(eventTitleFont)
                }

                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9176470588, green: 0.262745098, blue: 0.4156862745, alpha: 1)))
                        .frame(width: barWidth, height: tallEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(event2Title)
                            .font(eventTitleFont)
                        Text(event2Time)
                            .font(eventTimeFont).foregroundColor(.gray)
                    }
                }

                Text(tomorrowTitle.uppercased()).font(tomorrowTitleFont).foregroundColor(.gray).padding(.top, tomorrowPaddingTop).padding(.bottom, tomorrowPaddingBottom)

                HStack(spacing: eventHSpacing) {
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.7529411765, green: 0.4784313725, blue: 0.8588235294, alpha: 1)))
                        .frame(width: barWidth, height: shortEventBarHeight)
                        .clipShape(RoundedRectangle(cornerRadius: barCornerRadius, style: .continuous))
                    Text(event3Title)
                        .font(eventTitleFont)
                }
                
                Spacer()
            }
            .padding(.top)
            .padding(.leading)
            .padding(.trailing, eventsTrailingPadding)

            Spacer()

            ZStack {
                Circle().frame(width: dayHighlightCircle).foregroundColor(.red).position(x: dayHighlightCircleX, y: dayHighlightCircleY)

                VStack(alignment: .leading) {
                    Text(month.uppercased()).font(monthFont).foregroundColor(.red).padding(.bottom, monthBottomPadding)
                    GridStack(rows: rows, columns: columns, content: calendarContent)
                    Spacer()
                }
                .padding(.top)
            }

            Spacer()
        }
    }
}

struct GridStack: View {
    private let rowPadding: CGFloat = 5.5
    private let font: Font = Font.system(size: 10, weight: .semibold, design: .default)

    let rows: Int
    let columns: Int
    let content: [[String]]

    var body: some View {
        HStack {
            ForEach(0 ..< columns, id: \.self) { column in
                VStack(spacing: rowPadding) {
                    ForEach(0 ..< self.rows, id: \.self) { row in
                        let row: Int = row
                        let column: Int = column
                        if (column == 0 || column == 6) {
                            Text(self.content[row][column]).font(font).foregroundColor(Color(.gray))
                        } else if ((column == 2) && (row == 3)) {
                            Text(self.content[row][column]).font(font).foregroundColor(Color(.white))
                        } else {
                            Text(self.content[row][column]).font(font)
                        }
                    }
                }
            }
        }
    }
}

struct MediumCalendar_Previews: PreviewProvider {
    static var previews: some View {
        MediumCalendar().previewLayout(.fixed(width: 320, height: 160))
    }
}
