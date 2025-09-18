//
//  ColorPickerVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 17/09/2025.
//

import UIKit

class ColorPickerVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  

    @IBOutlet weak var rgbView: UIView!
    @IBOutlet weak var hexaView: UIView!
    @IBOutlet weak var gView: UIView!

    @IBOutlet weak var savePalleteBtnOutlet: UIButton!
    @IBOutlet weak var clearAllBtnOutlet: UIButton!
    
    @IBOutlet weak var collectionViewInColorPickerVC: UICollectionView!
    
    let colors = ["#1E3A8A","#F59E0B","#10B981"/*,"#F43F5E", "#1E3A8A","#F59E0B","#10B981","#F43F5E"*/]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewInColorPickerVC.dataSource = self
        collectionViewInColorPickerVC.delegate = self
        rgbView.layer.cornerRadius = 10
        rgbView.layer.borderWidth = 1
        rgbView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        hexaView.layer.cornerRadius = 10
        hexaView.layer.borderWidth = 1
        hexaView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        gView.layer.borderWidth = 1
        gView.layer.borderColor = UIColor.lightGray.cgColor
        
        
        savePalleteBtnOutlet.layer.cornerRadius = 10
        clearAllBtnOutlet.layer.cornerRadius = 10
        savePalleteBtnOutlet.layer.borderWidth = 1
        clearAllBtnOutlet.layer.borderWidth = 1
        savePalleteBtnOutlet.layer.borderColor = UIColor(named: "app-items-color")?.cgColor
        clearAllBtnOutlet.layer.borderColor = UIColor(named: "app-items-color")?.cgColor
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorPickerCVC", for: indexPath) as! ColorPickerCVC
        cell.contentView.backgroundColor = UIColor(hex: colors[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.cellForItem(at: indexPath)
       // let cellWidth  = cell?. width
            
        // Set fixed width and height for each cell
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        let cellWidth: CGFloat  = 120
        if cellWidth * CGFloat(colors.count) > width {
            
            return CGSize(width: width / CGFloat(colors.count), height: height)
        } else {
            return CGSize(width: 120, height: height)
        }
            
        
       
    }
    
        
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backBtnAction(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    
}
//
//class SaturationBrightnessView: UIView {
//    
//    var hue: CGFloat = 0 { didSet { setNeedsDisplay() } }
//    var onColorChanged: ((_ saturation: CGFloat, _ brightness: CGFloat) -> Void)?
//    
//    private var saturation: CGFloat = 1
//    private var brightness: CGFloat = 1
//    
//    // Circle handle layer
//    private let handleLayer = CAShapeLayer()
//    private let handleRadius: CGFloat = 12
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupHandle()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupHandle()
//    }
//    
//    private func setupHandle() {
//        handleLayer.fillColor = UIColor.clear.cgColor
//        handleLayer.strokeColor = UIColor.black.cgColor
//        handleLayer.lineWidth = 2
//        layer.addSublayer(handleLayer)
//    }
//    
//    override func draw(_ rect: CGRect) {
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        // Draw gradient for saturation & brightness
//        for y in stride(from: 0, to: rect.height, by: 1) {
//            for x in stride(from: 0, to: rect.width, by: 1) {
//                let sat = x / rect.width
//                let bri = 1 - (y / rect.height)
//                let color = UIColor(hue: hue, saturation: sat, brightness: bri, alpha: 1)
//                context.setFillColor(color.cgColor)
//                context.fill(CGRect(x: x, y: y, width: 1, height: 1))
//            }
//        }
//        
//        // Update circle position
//        updateHandlePosition()
//    }
//    
//    private func updateHandlePosition() {
//        let x = saturation * bounds.width
//        let y = (1 - brightness) * bounds.height
//        let circlePath = UIBezierPath(ovalIn: CGRect(
//            x: x - handleRadius,
//            y: y - handleRadius,
//            width: handleRadius * 2,
//            height: handleRadius * 2
//        ))
//        handleLayer.path = circlePath.cgPath
//    }
//    
//    // MARK: - Touch Handling
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        handleTouch(touches)
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        handleTouch(touches)
//    }
//    
//    private func handleTouch(_ touches: Set<UITouch>) {
//        guard let touch = touches.first else { return }
//        let point = touch.location(in: self)
//        
//        saturation = max(0, min(1, point.x / bounds.width))
//        brightness = max(0, min(1, 1 - point.y / bounds.height))
//        
//        onColorChanged?(saturation, brightness)
//        setNeedsDisplay()
//    }
//}
//
class SaturationBrightnessView: UIView {
    
    var hue: CGFloat = 0 { didSet { setNeedsDisplay() } }
    var onColorChanged: ((_ saturation: CGFloat, _ brightness: CGFloat) -> Void)?
    
    private var saturation: CGFloat = 1
    private var brightness: CGFloat = 1
    
    // Circle handle layer
    private let handleLayer = CAShapeLayer()
    private let handleRadius: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHandle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupHandle()
    }
    
    private func setupHandle() {
        handleLayer.fillColor = UIColor.clear.cgColor
        handleLayer.strokeColor = UIColor.white.cgColor   // white border
        handleLayer.lineWidth = 3
        
        // shadow for visibility
        handleLayer.shadowColor = UIColor.black.cgColor
        handleLayer.shadowOffset = .zero
        handleLayer.shadowOpacity = 0.7
        handleLayer.shadowRadius = 2
        
        layer.addSublayer(handleLayer)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Draw gradient for saturation & brightness
        for y in stride(from: 0, to: rect.height, by: 1) {
            for x in stride(from: 0, to: rect.width, by: 1) {
                let sat = x / rect.width
                let bri = 1 - (y / rect.height)
                let color = UIColor(hue: hue, saturation: sat, brightness: bri, alpha: 1)
                context.setFillColor(color.cgColor)
                context.fill(CGRect(x: x, y: y, width: 1, height: 1))
            }
        }
        
        // Update circle position
        updateHandlePosition()
    }
    
    private func updateHandlePosition() {
        // Clamp so circle stays inside view
        let x = min(max(saturation * bounds.width, handleRadius), bounds.width - handleRadius)
        let y = min(max((1 - brightness) * bounds.height, handleRadius), bounds.height - handleRadius)
        
        let circlePath = UIBezierPath(ovalIn: CGRect(
            x: x - handleRadius,
            y: y - handleRadius,
            width: handleRadius * 2,
            height: handleRadius * 2
        ))
        handleLayer.path = circlePath.cgPath
    }
    
    // MARK: - Touch Handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches)
    }
    
    private func handleTouch(_ touches: Set<UITouch>) {
        guard let touch = touches.first else { return }
        let point = touch.location(in: self)
        
        saturation = max(0, min(1, point.x / bounds.width))
        brightness = max(0, min(1, 1 - point.y / bounds.height))
        
        onColorChanged?(saturation, brightness)
        setNeedsDisplay()
    }
}

class ColorSlider: UISlider {
    
    var gradientColors: [UIColor] = [.red, .yellow, .green, .cyan, .blue, .purple] {
        didSet {
            updateGradientTrack()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSlider()
    }
    
    private func setupSlider() {
        self.minimumValue = 0
        self.maximumValue = 1
        self.value = 0.5
        updateGradientTrack()
        updateThumbColor()
        
        // Update thumb when value changes
        self.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    private func updateGradientTrack() {
        let gradientImage = createGradientImage(bounds: CGRect(x: 0, y: 0, width: 300, height: 10),
                                                colors: gradientColors)
        let resizable = gradientImage?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        self.setMinimumTrackImage(resizable, for: .normal)
        self.setMaximumTrackImage(resizable, for: .normal)
    }
    
    private func createGradientImage(bounds: CGRect, colors: [UIColor]) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        UIGraphicsBeginImageContextWithOptions(gradientLayer.bounds.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        gradientLayer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 👉 Get the current color at the thumb position
    func currentColor() -> UIColor {
        guard !gradientColors.isEmpty else { return .clear }
        
        let percentage = CGFloat((value - minimumValue) / (maximumValue - minimumValue))
        let index = min(Int(percentage * CGFloat(gradientColors.count - 1)), gradientColors.count - 2)
        
        let color1 = gradientColors[index]
        let color2 = gradientColors[index + 1]
        
        // interpolate between color1 and color2
        return interpolate(color1: color1, color2: color2, fraction: percentage * CGFloat(gradientColors.count - 1) - CGFloat(index))
    }
    
    private func interpolate(color1: UIColor, color2: UIColor, fraction: CGFloat) -> UIColor {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        color1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        color2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return UIColor(
            red: r1 + (r2 - r1) * fraction,
            green: g1 + (g2 - g1) * fraction,
            blue: b1 + (b2 - b1) * fraction,
            alpha: a1 + (a2 - a1) * fraction
        )
    }
    
    @objc private func valueChanged() {
        updateThumbColor()
    }
    
    /// 👉 Update thumb with current color + white border + black border
    private func updateThumbColor() {
        let color = currentColor()
        let thumbImage = drawThumb(color: color, size: CGSize(width: 30, height: 30))
        self.setThumbImage(thumbImage, for: .normal)
    }
    
    private func drawThumb(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        
        let radius = size.width / 2
        
        // Outer black border
        context.setFillColor(UIColor.black.cgColor)
        context.addEllipse(in: rect)
        context.fillPath()
        
        // Inner white border (slightly smaller circle)
        let whiteRect = rect.insetBy(dx: 2, dy: 2)
        context.setFillColor(UIColor.white.cgColor)
        context.addEllipse(in: whiteRect)
        context.fillPath()
        
        // Inner color circle (even smaller)
        let colorRect = rect.insetBy(dx: 5, dy: 5)
        context.setFillColor(color.cgColor)
        context.addEllipse(in: colorRect)
        context.fillPath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}





class TransparencySlider: UISlider {
    
    /// The base color whose transparency we are controlling
    var baseColor: UIColor = .red {
        didSet {
            updateTrack()
            updateThumb()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSlider()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSlider()
    }
    
    private func setupSlider() {
        self.minimumValue = 0.0   // fully transparent
        self.maximumValue = 1.0   // fully opaque
        self.value = 1.0          // default fully opaque
        
        updateTrack()
        updateThumb()
        
        self.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    private func updateTrack() {
        let gradientImage = createAlphaGradientImage(color: baseColor,
                                                     bounds: CGRect(x: 0, y: 0, width: 300, height: 10))
        let resizable = gradientImage?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        self.setMinimumTrackImage(resizable, for: .normal)
        self.setMaximumTrackImage(resizable, for: .normal)
    }
    
    /// Checkerboard + alpha gradient
    private func createAlphaGradientImage(color: UIColor, bounds: CGRect) -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [
            color.withAlphaComponent(0).cgColor, // transparent
            color.withAlphaComponent(1).cgColor  // opaque
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        // Checkerboard pattern (behind gradient)
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        drawCheckerboard(context: context, rect: bounds, squareSize: 5)
        gradientLayer.render(in: context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func drawCheckerboard(context: CGContext, rect: CGRect, squareSize: CGFloat) {
        let light = UIColor(white: 0.9, alpha: 1).cgColor
        let dark = UIColor(white: 0.6, alpha: 1).cgColor
        
        for y in stride(from: 0, to: rect.height, by: squareSize) {
            for x in stride(from: 0, to: rect.width, by: squareSize) {
                let isLight = ((Int(x / squareSize) + Int(y / squareSize)) % 2 == 0)
                context.setFillColor(isLight ? light : dark)
                context.fill(CGRect(x: x, y: y, width: squareSize, height: squareSize))
            }
        }
    }
    
    /// Current selected color with alpha
    func currentColor() -> UIColor {
        return baseColor.withAlphaComponent(CGFloat(value))
    }
    
    @objc private func valueChanged() {
        updateThumb()
    }
    
    /// Thumb reflects current transparency
    private func updateThumb() {
        let color = currentColor()
        let thumbImage = drawThumb(color: color, size: CGSize(width: 30, height: 30))
        self.setThumbImage(thumbImage, for: .normal)
    }
    
    private func drawThumb(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        
        // Outer black border
        context.setFillColor(UIColor.black.cgColor)
        context.addEllipse(in: rect)
        context.fillPath()
        
        // Inner white border
        let whiteRect = rect.insetBy(dx: 2, dy: 2)
        context.setFillColor(UIColor.white.cgColor)
        context.addEllipse(in: whiteRect)
        context.fillPath()
        
        // Inner circle with alpha
        let colorRect = rect.insetBy(dx: 5, dy: 5)
        context.setFillColor(color.cgColor)
        context.addEllipse(in: colorRect)
        context.fillPath()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
