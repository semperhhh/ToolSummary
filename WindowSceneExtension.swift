extension UIWindowScene {
    /// 获取当前scene
    class var currentScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.filter {$0.activationState == .foregroundActive}.compactMap {$0 as? UIWindowScene}.first
    }
}
