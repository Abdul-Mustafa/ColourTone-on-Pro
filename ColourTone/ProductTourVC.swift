//
//  ProductTourVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 10/09/2025.
//



import UIKit

class ProductTourVC: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var belowTheTopLabel: UILabel!
    
    @IBOutlet weak var firsView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial visibility
        firsView.isHidden = false
        secondView.isHidden = true
        thirdView.isHidden = true
        nextButtonOutlet.layer.cornerRadius = 20
        nextButtonOutlet.layer.masksToBounds = true
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        currentPage += 1
        
        if currentPage >= 3 {
            let customTabBarController = CustomTabBarController()
            customTabBarController.setupDefaultViewControllers()
            customTabBarController.modalPresentationStyle = .fullScreen
            self.present(customTabBarController, animated: false, completion: nil)
        }
        
        // Update UI
        pageControl.currentPage = currentPage
        updateViews()
    }
    
    @IBAction func skipButtonAction(_ sender: Any) {
        let customTabBarController = CustomTabBarController()
        customTabBarController.setupDefaultViewControllers()
        customTabBarController.modalPresentationStyle = .fullScreen
        self.present(customTabBarController, animated: false, completion: nil)
    }
    
    private func updateViews() {
        // Hide all first
        firsView.isHidden = true
        secondView.isHidden = true
        thirdView.isHidden = true
        
        // Show current page
        switch currentPage {
        case 0:
            firsView.isHidden = false
        case 1:
            secondView.isHidden = false
            topLabel.text = "Explore beautiful palettes and gradients"
            belowTheTopLabel.text = "Get inspired by popular color schemes curated for you."
        case 2:
            thirdView.isHidden = false
            topLabel.text = "Use smart tools to perfect your colors"
            belowTheTopLabel.text = "Contrast maker, export tools, and detailed palette analysis."
            nextButtonOutlet.setTitle("Finish", for: .normal) // change button text on last page
        default:
            break
        }
    }
}
