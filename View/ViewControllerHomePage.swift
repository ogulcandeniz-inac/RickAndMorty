//
//  ViewControllerHomePage.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit
import Kingfisher

class ViewControllerHomePage: UIViewController {
    
    var characterId: Int = 1
    @IBOutlet weak var CollectionViewCharacter: UICollectionView!
    var characters = [Character]()
    var characterscell: Character?
    var film:Character?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        CollectionViewCharacter.delegate = self
        CollectionViewCharacter.dataSource = self
 
        tumKategorilerAl()
        print(self.characters,"deger")
        let design :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.CollectionViewCharacter.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (width-30)/2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.7)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        CollectionViewCharacter.collectionViewLayout = design
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterDetail" {
            if let characterDetailViewController = segue.destination as? CharacterDetailViewController {
                if let selectedCharacterId = sender as? Int {
                characterDetailViewController.characterId = selectedCharacterId
                }
            }
        }
    }

    
    func tumKategorilerAl(){
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        print("okudu1")
        URLSession.shared.dataTask(with: url) { data , response , error in
            if error != nil || data == nil {
                print("Hata")
                print("okudu2")
                return
                
            }
            
            do{
                let cevap = try JSONDecoder().decode(CharacterResponse.self, from: data!)
                
                print(cevap.results)
                let gelenKategoriListesi = cevap.results
                self.characters = gelenKategoriListesi

                print(self.characters,"deger")
                DispatchQueue.main.async {
                    self.characters = gelenKategoriListesi
                    self.CollectionViewCharacter.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}


        extension ViewControllerHomePage:UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellHomePageProtocol{
            
            func sepeteEkle(indexPath: IndexPath){
                let selectedCharacter = characters[indexPath.row]
                print("Detayı Görülmek İstenen Kişi: \(selectedCharacter.name), ID: \(selectedCharacter.id)")
                self.performSegue(withIdentifier: "characterDetail", sender: selectedCharacter.id)
            }
            func numberOfSections(in collectionView: UICollectionView) -> Int {
                return 1
            }
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return characters.count
            }
          
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let film = characters[indexPath.row]
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CollectionViewCellHomePage
           
            
                
                
        cell.labelCharacterName.text = film.name
        // Load the character's image using Kingfisher
        let imageUrlString = characters[indexPath.row].image
        let imageUrl = URL(string: imageUrlString)!
        cell.imageViewCharacterPicture.kf.setImage(with: imageUrl)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        return cell
        }
        }