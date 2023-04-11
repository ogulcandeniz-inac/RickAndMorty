//
//  HorizontalListCollectionViewCell.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import UIKit

class HorizontalListCollectionViewCell: UICollectionViewCell {
    
    
    
      

    
    @IBOutlet weak var labelLocation: UILabel!
    
    
    var hucreProtocol:CollectionViewCellHomePageProtocol?
    var location: Location?
    
    
    func configure(with location: Location) {
        
        labelLocation.text = location.name
        
    }
}


