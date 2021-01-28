// MARK: ph扩展
struct PH<T> {

    var base: T

    init(_ base: T) {
        self.base = base
    }
}

// MARK: - String
/// 当T是string类型的时候
extension PH where T == String {
    /// 4位密文手机号
    var toMobilePhone: String {
        var result: String = ""
        guard base.count == 11 else {
            return "非法手机号"
        }
        for (index, char) in base.enumerated() {
            if case 3...6 = index {
                result.append("*")
            } else {
                result.append(char)
            }
        }
        return result
    }
}

// MARK: - Int
extension PH where T == Int {
    /// 4位密文手机号
    var toMobilePhone: String {
        var result: String = ""
        let phoneStr = String(base)
        guard phoneStr.count == 11 else {
            return "非法手机号"
        }
        for (index, char) in phoneStr.enumerated() {
            if case 3...6 = index {
                result.append("*")
            } else {
                result.append(char)
            }
        }
        return result
    }
}

// MARK: - Date
extension PH where T == Date {

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

/// 遵守协议就会有ph的计算属性
protocol PHCompatible {

}

extension PHCompatible {
    var ph: PH<Self> {
        get { PH(self) }
        set {}
    }
}

extension String: PHCompatible {}

extension Int: PHCompatible {}
