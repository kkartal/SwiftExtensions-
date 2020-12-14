extension UITextField {
    
    func addPasswordToggle() {
        let iv = UIImageView(image: UIImage(named: "show_icon"))
        iv.tintColor = Color.gray
        iv.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        iv.contentMode = .scaleAspectFit
        let padding: CGFloat = 6
        let rightView = UIView(frame: CGRect(
            x: 0, y: 0,
            width: iv.frame.width + padding,
            height: iv.frame.height))
        rightView.addSubview(iv)
        self.rightViewMode = .always
        self.rightView = rightView
        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleTapped(tapGestureRecognizer:)))
        rightView.addGestureRecognizer(tap)
    }
    
    @objc private func toggleTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        
        guard let view = tapGestureRecognizer.view,
              let iv = view.subviews[0] as? UIImageView else { return }
        
        self.isSecureTextEntry = !self.isSecureTextEntry
        
        iv.image = UIImage(named: self.isSecureTextEntry ? "show_icon" : "hide_icon")
    }
}