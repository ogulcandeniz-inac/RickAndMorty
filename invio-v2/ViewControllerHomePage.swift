//
//  ViewControllerHomePage.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit

class ViewControllerHomePage: UIViewController {

    @IBOutlet weak var CollectionViewCharacter: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    

    

}
