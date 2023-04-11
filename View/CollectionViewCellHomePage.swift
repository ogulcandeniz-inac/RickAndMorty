//
//  CollectionViewCellHomePage.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit

protocol CollectionViewCellHomePageProtocol

{
    func sepeteEkle(indexPath:IndexPath)
}

class CollectionViewCellHomePage: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewCharacterPicture: UIImageView!
    @IBOutlet weak var labelCharacterName: UILabel!
    @IBOutlet weak var imageViewCharacterGender: UIImageView!
    @IBOutlet weak var genderrImageView: UIImageView!
    
    
    
    @IBAction func buttonpass(_ sender: Any){
    hucreProtocol?.sepeteEkle(indexPath: indexPath!)
    }
    
    var hucreProtocol:CollectionViewCellHomePageProtocol?
    var indexPath:IndexPath?
  
}
