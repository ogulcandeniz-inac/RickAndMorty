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
    
    var characters = [Character]()
    var film:Character?
   
    override func viewDidLoad(){
        super.viewDidLoad()
        
       
       
        if let f = film {
            
            if let url = URL(string: "https://rickandmortyapi.com/api/character/avatar/\(f.id).jpeg"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    
                    DispatchQueue.main.async {
                       
                        self.imageViewCharacterPicture.image = UIImage(data: data!)
                        self.imageViewCharacterPicture.image = UIImage(named: f.image)
                    }
                }
            }
            
            
            self.labelOrgin.text = f.name
          
            
            
            
            
        }
    }
    
    
    
    
    
}
