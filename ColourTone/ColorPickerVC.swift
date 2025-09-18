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
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorPickerCVC", for: indexPath) as! ColorPickerCVC
        cell.contentView.backgroundColor = UIColor(hex: "#1E3A8A")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set fixed width and height for each cell
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: 100, height: height)
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
