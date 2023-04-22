//
//  HorizontalListCollectionViewCell.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import UIKit

class HorizontalListCollectionViewCell: UICollectionViewCell {

    var HorizontalListProtocol:HorizontalListCollectionViewCellProtocol?
    var indexPath:IndexPath?

    @IBOutlet weak var locationLabel: UILabel!

    func updateUI(name: String) {
        locationLabel.textColor = .black
        locationLabel.text = name
    }
    
   
}

protocol HorizontalListCollectionViewCellProtocol
{
    func sepeteEkle2(indexPath:IndexPath)
}


    
   
  

