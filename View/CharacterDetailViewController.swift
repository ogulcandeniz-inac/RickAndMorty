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
     
    var characterId: Int = 1
    var characters: [Character] = []
    var selectedCharacter: Character?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    
        print(characterId as Any,"deger")
        
        
        if let selectedCharacter = characters.first(where: { $0.id == characterId }) {
            labelStatus.text = selectedCharacter.status.rawValue
           
               } else {
                   labelStatus.text = "Hata"
                   print("hatalı deger")
               }
        

    }
}