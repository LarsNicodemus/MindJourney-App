import SwiftUI

struct MoodCalendarView: View {
    let days: [Day]
    @State private var currentMonth: Date = Date()

    private let columns: [GridItem] = Array(
        repeating: .init(.flexible()), count: 7)

    var body: some View {
        VStack {
            Text("Mood Calendar")
                .font(.title)
                .padding()

            HStack {
                Button(action: {
                    withAnimation {
                        currentMonth = Calendar.current.date(
                            byAdding: .month, value: -1, to: currentMonth)!
                    }
                }) {
                    Image(systemName: "chevron.left")
                }

                Spacer()

                Text(monthTitle(currentMonth))
                    .font(.headline)

                Spacer()

                Button(action: {
                    withAnimation {
                        currentMonth = Calendar.current.date(
                            byAdding: .month, value: 1, to: currentMonth)!
                    }
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.horizontal)

            HStack {
                ForEach(["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"], id: \.self)
                { day in
                    Text(day)
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                }
            }

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(generateMonthDays(), id: \.self) { date in
                    if let date = date {
                        if let matchedDay = days.first(where: {
                            Calendar.current.isDate($0.date, inSameDayAs: date)
                        }) {
                            MoodCellView(day: matchedDay)
                        } else {
                            PlaceholderDayCellView(date: date)
                        }
                    } else {
                        EmptyCellView()
                    }
                }
            }
        }
        .padding()
    }

    private func monthTitle(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLLL yyyy"
        formatter.locale = Locale(identifier: "de_DE")
        return formatter.string(from: date)
    }

    private func generateMonthDays() -> [Date?] {
        guard
            let monthInterval = Calendar.current.dateInterval(
                of: .month, for: currentMonth)
        else { return [] }
        var days: [Date?] = []
        var currentDate = monthInterval.start

        let startWeekday = Calendar.current.component(
            .weekday, from: monthInterval.start)
        let paddingDaysStart = (startWeekday + 5) % 7
        days.append(contentsOf: Array(repeating: nil, count: paddingDaysStart))

        while currentDate < monthInterval.end {
            days.append(currentDate)
            currentDate = Calendar.current.date(
                byAdding: .day, value: 1, to: currentDate)!
        }

        let remainingDays = (7 - (days.count % 7)) % 7
        if remainingDays > 0 {
            days.append(contentsOf: Array(repeating: nil, count: remainingDays))
        }

        return days
    }
}

#Preview {

    MoodCalendarView(days: MOCKDAYS)
}
