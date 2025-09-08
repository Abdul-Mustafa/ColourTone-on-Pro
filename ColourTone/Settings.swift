//
//  Settings.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//
struct CellDataSettings {
    let image: UIImage
    let title: String
    
}

import UIKit

class Settings: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCVC", for: indexPath) as! SettingsCVC
        cell.image.image = data[indexPath.row].image
        cell.title.text = data[indexPath.row].title
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set fixed width and height for each cell
        let width = collectionView.bounds.width
        let hight = collectionView.bounds.height
        return CGSize(width: width, height: (hight / 4))
    }
    
    
    var data: [CellDataSettings] = [
        CellDataSettings(image: UIImage(named: "expamation")!, title: "About ColourTone"),
        CellDataSettings(image: UIImage(named: "message")!, title: "Contact Developer"),
        CellDataSettings(image: UIImage(named: "saved")!, title: "Rate App"),
        CellDataSettings(image: UIImage(named: "star")!, title: "Share ColourTone")
        ]
    
    @IBOutlet weak var darkLightBtnOulet: UISwitch!
    
    @IBOutlet weak var darkWhiteBtnContainer: UIView!
    
    @IBOutlet weak var settingsCVC: UICollectionView!
    private var isDarkMode: Bool {
        get { UserDefaults.standard.bool(forKey: "isDarkMode") }
        set {
            print("I am new value \(newValue)")
            UserDefaults.standard.set(newValue, forKey: "isDarkMode")
            applyInterfaceStyleToAllWindows(isDark: newValue)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
       
        settingsCVC.layer.cornerRadius = 20
        darkWhiteBtnContainer.layer.cornerRadius = 20
        applyInterfaceStyle()
        settingsCVC.delegate = self
        settingsCVC.dataSource = self
        settingsCVC.isScrollEnabled = false

    }
    
    private func applyInterfaceStyle() {
        applyInterfaceStyleToAllWindows(isDark: isDarkMode)
    }
    
    private func applyInterfaceStyleToAllWindows(isDark: Bool) {
        let style: UIUserInterfaceStyle = isDark ? .dark : .light
        darkLightBtnOulet.isOn = isDark
        // iOS 15+ approach using UIWindowScene
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.forEach { window in
                window.overrideUserInterfaceStyle = style
            }
        } else {
            // Fallback for older iOS versions (though deprecated)
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = style
            }
        }
    }

    @IBAction func darkLightBtnAction(_ sender: UISwitch) {
        isDarkMode = sender.isOn
        print("Switched to \(isDarkMode ? "Dark" : "Light") Mode")
    }
}
