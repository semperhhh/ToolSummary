extension Float {

    // 四舍五入
    var toInt: Int {
        Int(self.rounded())
    }
    // 入
    var toIntDown: Int {
        Int(self.rounded(.down))
    }
    // 舍
    var toIntUp: Int {
        Int(self.rounded(.up))
    }
    // 保留小数位
    func toRounded(mult: Int) -> Float {
        guard mult > 0 else {
            return self.rounded()
        }
        let div: Decimal = pow(10, mult)
        let m: Float = Float(String(div.description)) ?? 0
        return (self * m).rounded() / m
    }
}
