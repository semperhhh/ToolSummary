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
        let interval = self.prefix(10)
        // 日期
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        // 年
        guard (Int(Date().currentYear()) ?? 0) == (Int(Date(timeIntervalSince1970: TimeInterval(interval) ?? 0).currentYear()) ?? 0) else {
            return self.toDateString("yyyy.MM.dd HH:mm")
        }
        // 月
        guard (Int(Date().currentMonth()) ?? 0) == (Int(Date(timeIntervalSince1970: TimeInterval(interval) ?? 0).currentMonth()) ?? 0) else {
            return self.toDateString("MM.dd HH:mm")
        }
        // 天
        let now: Int = Int(Date().currentDay()) ?? 0
        let last: Int = Int(Date(timeIntervalSince1970: TimeInterval(interval) ?? 0).currentDay()) ?? 0
        if now == last {
            return "今天 \(self.toDateString("HH:mm"))"
        } else if now - 1 == last {
            return "昨天 \(self.toDateString("HH:mm"))"
        } else {
            return self.toDateString("MM.dd HH:mm")
        }
    }
}
