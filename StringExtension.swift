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
}
