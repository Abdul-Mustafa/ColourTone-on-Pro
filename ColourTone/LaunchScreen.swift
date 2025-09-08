//
//  LaunchScreen.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 08/09/2025.
//

import UIKit


class LaunchScreen: UIViewController {
    
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
        print("Launch screen animation completed")
        
        // Optional: Navigate to main screen or perform other actions
        // For example:
        // self.performSegue(withIdentifier: "goToMainScreen", sender: self)
        // or dismiss this view controller
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

