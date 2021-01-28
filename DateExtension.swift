extension Date {

    // 获取UTC-8时区的天
    var currentDay: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.timeZone = TimeZone(abbreviation: "UTC+8")
        formatter.dateFormat = "dd"
        return formatter.string(from: base)
    }

    // 获取UTC-8时区的月
    var currentMonth: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.timeZone = TimeZone(abbreviation: "UTC+8")
        formatter.dateFormat = "MM"
        return formatter.string(from: base)
    }

    // 获取UTC-8时区的年
    var currentYear: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.timeZone = TimeZone(abbreviation: "UTC+8")
        formatter.dateFormat = "yyyy"
        return formatter.string(from: base)
    }
}
