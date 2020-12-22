extension Date {

    // 获取UTC-8时区的年
    func currentYear() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.timeZone = TimeZone(abbreviation: "UTC+8")
        formatter.dateFormat = "yyyy"
        return formatter.string(from: self)
    }

    // 获取UTC-8时区的月
    func currentMonth() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.timeZone = TimeZone(abbreviation: "UTC+8")
        formatter.dateFormat = "MM"
        return formatter.string(from: self)
    }
    // 获取UTC-8时区的天
    func currentDay() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "zh_CN")
        formatter.timeZone = TimeZone(abbreviation: "UTC+8")
        formatter.dateFormat = "dd"
        return formatter.string(from: self)
    }
}
