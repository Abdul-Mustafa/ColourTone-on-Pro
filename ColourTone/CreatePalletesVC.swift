//
//  CreatePalletesVC.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

import UIKit

class CreatePalletesVC: UIViewController {

    
    @IBOutlet weak var mainContainer: UIView!
    
//    ColorPickerVC
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainContainer.layer.cornerRadius = 12
        mainContainer.layer.masksToBounds = true
        mainContainer.layer.borderWidth = 1
        mainContainer.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.2666666667, blue: 0.6784313725, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createColorPalletesAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. Instantiate the view controller with its Storyboard ID
         let ColorPickerVC = storyboard.instantiateViewController(withIdentifier: "ColorPickerVC") as! ColorPickerVC
         ColorPickerVC.modalPresentationStyle = .fullScreen
         present(ColorPickerVC, animated: true, completion: nil)
        
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
