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
     
    var characterId: Int?
    var characters: [Character] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
    
       
        if let selectedCharacter = characters.first(where: { $0.id == characterId }) {
            labelStatus.text = selectedCharacter.status.rawValue

               } else {
                   labelStatus.text = "Hata"
               }
        
        if let characterId = characterId, let selectedCharacter = characters.first(where: { $0.id == characterId }) {
            // characterId değeri nil değilse ve selectedCharacter bulunmuşsa burası çalışır
            imageViewCharacterPicture.image = UIImage(named: selectedCharacter.image)
        } else {
            // characterId değeri nil ise veya selectedCharacter bulunamamışsa burası çalışır
            print("Error: Character not found.")
            
        }

    }
}
