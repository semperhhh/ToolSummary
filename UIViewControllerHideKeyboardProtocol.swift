/// 键盘下降协议
protocol UIViewControllerHideKeyboardProtocol {
    
    /// 点击空白区域键盘下降
    func hideKeyboardWhenTouchInView()
}

extension UIViewController: UIViewControllerHideKeyboardProtocol, UIGestureRecognizerDelegate {
    
    /// 点击空白区域键盘下降
    func hideKeyboardWhenTouchInView() {
        let hideKeyboardGestureRecognizer = UITapGestureRecognizer()
        hideKeyboardGestureRecognizer.delegate = self
        self.view.addGestureRecognizer(hideKeyboardGestureRecognizer)
    }
    
    /// 手势控制器过渡时调用
    /// - Parameter gestureRecognizer: 手势
    /// - Returns: true和false的区别
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    
        // 获取焦点在的view
        let location: CGPoint = gestureRecognizer.location(in: self.view)
        let targetView: UIView? = self.view.hitTest(location, with: nil)
        guard let targetV = targetView else {
            return false
        }
        if targetV.isKind(of: UITextField.self) || targetV.isKind(of: UITextView.self) {
            return false
        }
        
        self.view.endEditing(true)
        return false
    }
}
