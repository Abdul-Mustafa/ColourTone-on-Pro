//
//  LaunchScreen.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 08/09/2025.
//

import UIKit


class LaunchScreen: UIViewController {
    
    @IBOutlet weak var leadingOrTrailingOfImageview: NSLayoutConstraint!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Debug: Check if outlet is connected
        print("ImageView connected: \(imageView != nil)")
        
        setupImageView()
        
        // Add a small delay to ensure view is fully loaded
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.startAnimation()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    
    }
    
    private func setupImageView() {
        guard let imageView = imageView else {
            print("ERROR: ImageView outlet is not connected!")
            return
        }
        
        // Ensure the image view starts with identity transform
        imageView.transform = .identity
        
    
        
        // Ensure it's not hidden
        imageView.isHidden = false
        imageView.alpha = 1.0
        
        print("ImageView setup completed")
    }
    
    func startAnimation() {
        guard let imageView = imageView else {
            print("ERROR: Cannot start animation - ImageView is nil")
            return
        }
        
        print("Starting animation...")
        animateScaleUpAndClockwise()
    }
    
    private func animateScaleUpAndClockwise() {
        print("Phase 1: Scale up and rotate clockwise")
        
        UIView.animate(withDuration: 0.3,
                      delay: 0,
                      options: [.curveEaseInOut],
                      animations: {
            // First: Scale up to maximum size (1.5x) AND rotate clockwise (180°)
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                .rotated(by:  .pi/2) // 180° clockwise rotation
            
            print("Animation 1 executing...")
        }) { finished in
            print("Phase 1 completed. Finished: \(finished)")
            if finished {
                self.animateScaleDownAndAntiClockwise()
            }
        }
    }
    
    private func animateScaleDownAndAntiClockwise() {
        print("Phase 2: Scale down and rotate back")
        
        UIView.animate(withDuration: 0.3,
                      delay: 0,
                      options: [.curveEaseInOut],
                      animations: {
            // Scale back to normal and rotate back to original position
            self.imageView.transform = .identity
           
            print("Animation 2 executing...")
        }) { finished in
            print("Phase 2 completed. Finished: \(finished)")
            if finished {
                self.animationCompleted()
            }
        }
    }
    
    private func animationCompleted() {
        imageView.removeFromSuperview()
        let label = UILabel()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#BA43CE")!.cgColor, // light purple
            UIColor(hex: "#A020F0")!.cgColor, // mid violet
            UIColor(hex: "#6900FD")!.cgColor  // dark purple
        ]
        gradientLayer.locations = [0.0, 0.5, 1.0]
                
                // Gradient direction (top to bottom here)
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0) // top
                gradientLayer.endPoint   = CGPoint(x: 0.9, y: 1.0)
        
        gradientLayer.frame = mainView.bounds
       mainView.layer.insertSublayer(gradientLayer, at: 0)
        
        

     

        // Optional: Navigate to main screen or perform other actions
        // For example:
        // self.performSegue(withIdentifier: "goToMainScreen", sender: self)
        // or dismiss this view controller
        mainView.addSubview(imageView)
        mainView.addSubview(label)
            
            // Ensure the imageView has an image
            imageView.image = UIImage(named: "boxes-in-white")
            
            // Re-apply constraints programmatically
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: label.leadingAnchor, constant: 5),
                imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
                //imageView.widthAnchor.constraint(equalToConstant: 100), // Adjust size as needed
               // imageView.heightAnchor.constraint(equalToConstant: 100) // Adjust size as needed
            ])
       
            label.text = "Colourtone- Colorpalette"
            label.textColor = .white // Set text color to contrast with gradient background
            label.font = UIFont.boldSystemFont(ofSize: 20) // Set font and size
            label.textAlignment = .center // Center-align text
            label.numberOfLines = 0 // Allow multiple lines for wrapping
            label.lineBreakMode = .byWordWrapping // Wrap text by words
            
            // Step 2: Add the label to mainView
        
        label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                // Center the label horizontally
                label.centerXAnchor.constraint(equalTo: mainView.centerXAnchor, constant: imageView.frame.width/2),
                // Position the label below the imageView
                label.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
                // Set fixed width
                label.widthAnchor.constraint(equalToConstant: 200),
                // Set fixed height (optional, or let it adjust based on content)
              //  label.heightAnchor.constraint(greaterThanOrEqualToConstant: 50) // Minimum height
            ])
            
            // Step 4: Ensure the label is visible
            label.isHidden = false
            label.alpha = 1.0
            
            // Ensure the imageView is visible
            imageView.isHidden = false
            imageView.alpha = 1.0
            
            // Update the layout
            mainView.layoutIfNeeded()
    }
    
    // Optional: Method to manually stop the animation if needed
    func stopAnimation() {
        imageView?.layer.removeAllAnimations()
        imageView?.transform = .identity
        print("Animation stopped")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopAnimation()
    }
}


// Extension for UIColor hex support (if not already available)
extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        
        return nil
    }
}
