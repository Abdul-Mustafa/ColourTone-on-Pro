//
//  UploadImageVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//
import UIKit

class UploadImageVC: UIViewController {

    
    @IBOutlet weak var mainContainer: UIView!
    
    
    @IBOutlet weak var cameraPic: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainContainer.layer.cornerRadius = 12
        mainContainer.layer.masksToBounds = true
        mainContainer.layer.borderWidth = 1
        mainContainer.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.2666666667, blue: 0.6784313725, alpha: 1)
        // Do any additional setup after loading the view.
        
        cameraPic.addInnerShadow(color: .black, radius: 6, opacity: 0.4)
        cameraPic.layer.cornerRadius = 6
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



extension UIView {
    func addInnerShadow(color: UIColor = .black,
                        radius: CGFloat = 5,
                        opacity: Float = 0.5) {
        
        // Remove old inner shadows if any
        layer.sublayers?.removeAll(where: { $0.name == "InnerShadow" })
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.name = "InnerShadow"
        shadowLayer.frame = bounds
        
        // Create a path with even-odd fill rule
        let path = UIBezierPath(rect: bounds)
        let innerPath = UIBezierPath(rect: bounds.insetBy(dx: -radius, dy: -radius))
        path.append(innerPath)
        path.usesEvenOddFillRule = true
        
        shadowLayer.path = path.cgPath
        shadowLayer.fillRule = .evenOdd
        
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = radius
        
        layer.addSublayer(shadowLayer)
    }
}
