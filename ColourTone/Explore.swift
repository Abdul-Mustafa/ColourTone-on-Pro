//
//  Explore.swift
//  ColourTone
//
//  Created by Bilal Apps Dev on 04/09/2025.
//

import UIKit

class Explore: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
    var selectedSegment = 0
    @IBOutlet weak var segmentControleOutlet: UISegmentedControl!
    
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        exploreCollectionView.dataSource = self
        exploreCollectionView.delegate = self
        sementedControlSetup()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if selectedSegment == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExploreCVC", for: indexPath) as! ExploreCVC
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GradientCVC", for: indexPath) as! GradientCVC
            cell.gradientView.backgroundColor = UIColor(hex: "#1E3A8A") // Example color
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if selectedSegment == 0 {
            let cellWidth = (collectionView.frame.width)  // Adjust spacing as needed
            return CGSize(width: cellWidth, height: 200)
        }
        else {
            let cellWidth = (collectionView.frame.width)  // Adjust spacing as needed
            return CGSize(width: cellWidth, height: 400)
        }
        
    }
    
    
    
    func sementedControlSetup() {
        segmentControleOutlet.layer.borderWidth = 0.3
        segmentControleOutlet.layer.borderColor = UIColor(hex:"#989aa3" )?.cgColor
        
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex:"#A1A1AA" ),   // Text color when not selected
            .font: UIFont.systemFont(ofSize: 14)
        ]
        segmentControleOutlet.setTitleTextAttributes(normalAttributes, for: .normal)

        // For selected state
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex: "#FFFFFF" ) ,  // Text color when selected
            .font: UIFont.boldSystemFont(ofSize: 14)
        ]
        segmentControleOutlet.setTitleTextAttributes(selectedAttributes, for: .selected)
        // Do any additional setup after loading the view.
        
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
           selectedSegment = sender.selectedSegmentIndex
        exploreCollectionView.reloadData()
       }
}
