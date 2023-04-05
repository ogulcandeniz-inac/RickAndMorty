//
//  ViewControllerHomePage.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit
import Kingfisher

class ViewControllerHomePage: UIViewController {
    
    let characterId = "sa"
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
        
        let design :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.CollectionViewCharacter.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (width-30)/2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.7)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        CollectionViewCharacter.collectionViewLayout = design
        
        
        /*
         if let k = characterscell {
         
         if let kid = k.id{
         
         filmlerByKategoriID(id:kid)
         }
         }
         */
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
       
        if let navigationController = sender as? UINavigationController,
           let homePageVC = navigationController.topViewController as? ViewControllerHomePage,
           let indexPath = homePageVC.collectionView.indexPathsForSelectedItems?.first {
            let selectedCharacter = characters[indexPath.row]
            let characterDetailVC = segue.destination as! CharacterDetailViewController
            characterDetailVC.character = selectedCharacter
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

                
                DispatchQueue.main.async {
                    self.CollectionViewCharacter.reloadData()
                }
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}




        extension ViewControllerHomePage:UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellHomePageProtocol
{
            func sepeteEkle(indexPath: IndexPath) {
                print("Detayı Görülmek İstenen Kişi : \(characters[indexPath.row].name)")
                
                self.performSegue(withIdentifier: "characterDetail", sender: characters[indexPath.row])
                
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
                        
                
        
