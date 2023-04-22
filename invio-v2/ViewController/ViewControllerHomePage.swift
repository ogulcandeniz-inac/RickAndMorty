//
//  ViewControllerHomePage.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit
import Kingfisher

class ViewControllerHomePage: UIViewController, DifferentCellProtocol{

    @IBOutlet weak var locationCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewCharacter: UICollectionView!
    
    var characterId: Int = 1
    var characters = [Character]()
    var characterscell: Character?
    var film:Character?
    var locationsList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated:true);
        collectionViewCharacter.delegate = self
        collectionViewCharacter.dataSource = self

        locationCollectionView.delegate = self
        locationCollectionView.dataSource = self
 
        tumLocationAl()
        tumKategorilerAl()

        let design :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.collectionViewCharacter.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (width-30)/2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.7)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        collectionViewCharacter.collectionViewLayout = design
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
        URLSession.shared.dataTask(with: url) { data , response , error in
            if error != nil || data == nil {
                print("Hata")
                return}
            do{
                let cevap = try JSONDecoder().decode(CharacterResponse.self, from: data!)
                let gelenKategoriListesi = cevap.results
                self.characters = gelenKategoriListesi
                DispatchQueue.main.async {
                    self.characters = gelenKategoriListesi
                    self.collectionViewCharacter.reloadData()
                }
            }
            catch{
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
    func tumLocationAl(){
        let url = URL(string: "https://rickandmortyapi.com/api/location")!
        URLSession.shared.dataTask(with: url) { data , response , error in
            if error != nil || data == nil {
                print("Hata")
                return}
            do{
                let cevap = try JSONDecoder().decode(LocationResponse.self, from: data!)

                if let cevapResults = cevap.results {
                    for singleLocation in cevapResults{
                        self.locationsList.append(singleLocation.name ?? "")
                    }
                }
                DispatchQueue.main.async {
                    print("Dipatch\(self.locationsList)")
                    self.locationCollectionView.reloadData()
                }}
            catch{
                print(error.localizedDescription)
            }

        }
        .resume()
    }
}
        
   
extension ViewControllerHomePage:UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellHomePageProtocol,HorizontalListCollectionViewCellProtocol {
    
    
    func sepeteEkle2(indexPath: IndexPath) {
        let selectedCharacter = characters[indexPath.row]
        print("Detayı Görülmek İstenen Kişi: \(selectedCharacter.name), ID: \(selectedCharacter.id)")
        self.performSegue(withIdentifier: "characterDetail", sender: selectedCharacter.id)
    }
    
    func sepeteEkle(indexPath: IndexPath){
        let selectedCharacter = characters[indexPath.row]
        print("Detayı Görülmek İstenen Kişi: \(selectedCharacter.name), ID: \(selectedCharacter.id)")
        self.performSegue(withIdentifier: "characterDetail", sender: selectedCharacter.id)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == locationCollectionView {
            return locationsList.count
        } else {
            return characters.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == locationCollectionView {
            /// TODO
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell2", for: indexPath) as! HorizontalListCollectionViewCell
            let item = locationsList[indexPath.row]
            cell.updateUI(name: item)
            return cell
            
            
            
            
        } else {
            /// TODO
            let film = characters[indexPath.row]
            if film.gender == .male {
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
                cell.genderrImageView.image = UIImage(named: "male")
                return cell
            } else if film.gender == .female {
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DifferentCell", for: indexPath) as! DifferentCell
                
                
                
                cell.labelCharacterName.text = film.name
                // Load the character's image using Kingfisher
                let imageUrlString = characters[indexPath.row].image
                let imageUrl = URL(string: imageUrlString)!
                cell.imageViewCharacterPicture.kf.setImage(with: imageUrl)
                cell.layer.borderColor = UIColor.lightGray.cgColor
                cell.layer.borderWidth = 0.5
                cell.hucreProtocol = self
                cell.indexPath = indexPath
                cell.genderrImageView.image = UIImage(named: "female")
                return cell
            }
           else {
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
                cell.genderrImageView.image = UIImage(named: "question-mark")
                return cell
            }
        }
    }
}
