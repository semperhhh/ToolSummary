// MARK: - String
extension String {

    /// 时间戳转字符串格式
    /// - Parameter dateFormatter: 格式
    /// - Returns: 字符串
    func toDateString(_ dateFormatter: String = "yyyy.MM.dd") -> String {
        let interval = self.prefix(10)
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormatter
        let date = Date(timeIntervalSince1970: TimeInterval(interval) ?? 0)
        let result = formatter.string(from: date)
        return result
    }

    /// 时间戳转时间格式 example: 今天 10:00, 昨天 11:00
    /// - Returns: 字符串
    func toTimeChangeNow() -> String {
        guard !self.isEmpty else {
            return ""
        }
        let interval = self.prefix(10)
        // 日期
        let lhsDate = Date().phDate
        let rhsDate = Date(timeIntervalSince1970: TimeInterval(interval) ?? 0).phDate

        // 年
        guard lhsDate.year == rhsDate.year else {
            return self.toDateString("yyyy.MM.dd HH:mm")
        }
        // 月
        guard lhsDate.month == rhsDate.month else {
            return self.toDateString("MM.dd HH:mm")
        }
        // 天
        if lhsDate.day == rhsDate.day {
            return "今天 \(self.toDateString("HH:mm"))"
        } else if lhsDate.day - 1 == rhsDate.day {
            return "昨天 \(self.toDateString("HH:mm"))"
        } else {
            return self.toDateString("MM.dd HH:mm")
        }
    }
}
