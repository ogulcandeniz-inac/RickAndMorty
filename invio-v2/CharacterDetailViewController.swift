//
//  CharacterDetailViewController.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var imageViewCharacterPicture: UIImageView!
    
    
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelSpecy: UILabel!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelOrgin: UILabel!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelEpisodes: UILabel!
    @IBOutlet weak var labelCreated: UILabel!
    
    var film:Character?
    var character:Character?
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        if let image = URL(string: character?.image ?? "") {
                    DispatchQueue.global(qos: .userInitiated).async {
                        if let imageData = try? Data(contentsOf: image) {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                self.imageViewCharacterPicture.image = image
                            }
                        }
                    }
                }
        
        
        
           
            
        
    }
}
