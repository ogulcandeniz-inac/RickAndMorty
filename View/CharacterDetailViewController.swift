//
//  CharacterDetailViewController.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 25.03.2023.
//

import UIKit
import Kingfisher

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
    var episodeIDs = [String]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        tumKategorilerAl()
        }
    

    func tumKategorilerAl(){
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        URLSession.shared.dataTask(with: url) { data , response , error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            do{
                let cevap = try JSONDecoder().decode(CharacterResponse.self, from: data!)
                let gelenKategoriListesi = cevap.results

                DispatchQueue.main.async { [self] in
                    self.characters = gelenKategoriListesi
                    if let character = self.characters.first(where: { $0.id == characterId }) {
                    self.labelStatus.text = character.status.rawValue
                    self.labelSpecy.text = character.species.rawValue
                    self.labelGender.text = character.gender.rawValue
                    self.labelOrgin.text = character.origin.name
                        self.labelLocation.text = character.location.name
                        
                    for episodeURL in character.episode
                     {
                      let components = episodeURL.components(separatedBy: "/")
                      let episodeID = components.last ?? ""
                      episodeIDs.append(episodeID)
                     }
                        
                    let episodeString = episodeIDs.joined(separator: ", ")
                    self.labelEpisodes.text = episodeString
                    self.labelCreated.text = character.created
                    let imageUrl = URL(string: character.image)
                    imageViewCharacterPicture.kf.setImage(with: imageUrl)
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
