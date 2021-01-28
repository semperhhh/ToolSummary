// MARK: ph扩展
struct PH<T> {

    var base: T

    init(_ base: T) {
        self.base = base
    }
}

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