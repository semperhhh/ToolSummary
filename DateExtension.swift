enum PHDateWeekFormatter {
    // 一, 周一, 星期一, 礼拜一
    case x, xx, xxx, xxxx
}

struct PHDate<T> {
    var base: T
}

extension PHDate where T == Date {

    var dateComponent: DateComponents {
        let calendar = Calendar.current
        return calendar.dateComponents(in: TimeZone(abbreviation: "UTC+8")!, from: base)
    }

    /// 秒
    var second: Int {
        dateComponent.second ?? 0
    }
    /// 分
    var minute: Int {
        dateComponent.minute ?? 0
    }
    /// 时
    var hour: Int {
        dateComponent.hour ?? 0
    }
    /// 天
    var day: Int {
        dateComponent.day ?? 0
    }
    var weekday: Int {
        dateComponent.weekday ?? 0
    }
    /// 月
    var month: Int {
        dateComponent.month ?? 0
    }
    /// 年
    var year: Int {
        dateComponent.year ?? 0
    }

    func weekdayFormatter(_ weekformatter: PHDateWeekFormatter = .x) -> String {

        let weekDayStr: String
        switch dateComponent.weekday {
        case 1:
            weekDayStr = "日"
        case 2:
            weekDayStr = "一"
        case 3:
            weekDayStr = "二"
        case 4:
            weekDayStr = "三"
        case 5:
            weekDayStr = "四"
        case 6:
            weekDayStr = "五"
        default:
            weekDayStr = "六"
        }

        switch weekformatter {
        case .x:
            return weekDayStr
        case .xx:
            return "周\(weekDayStr)"
        case .xxx:
            return "星期\(weekDayStr)"
        default:
            return "礼拜\(weekDayStr)"
        }
    }
}

protocol PHDateCompatible {

}

extension PHDateCompatible {
    var phDate: PHDate<Self> {
        PHDate(base: self)
    }
}

extension Date: PHDateCompatible{}
