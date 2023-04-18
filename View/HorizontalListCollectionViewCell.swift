//
//  HorizontalListCollectionViewCell.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import UIKit

class HorizontalListCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet weak var labelLocation: UILabel!
    
    var HorizontalListProtocol:HorizontalListCollectionViewCellProtocol?
    var indexPath:IndexPath?
    
 
}




protocol HorizontalListCollectionViewCellProtocol

{
    func sepeteEkle2(indexPath:IndexPath)
}


    
   
  

