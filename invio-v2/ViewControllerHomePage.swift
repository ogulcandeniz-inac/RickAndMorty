//
//  ViewControllerHomePage.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit

class ViewControllerHomePage: UIViewController {
    
    
    @IBOutlet weak var CollectionViewCharacter: UICollectionView!
    var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        let bilgi = Character(character_id: 1, character_name: "Django", scharacter_tatus: " ", character_species: " ", character_type: " ", character_gender: " ", character_origin: " ", character_location: " ", character_image: "django" , character_episode: " ", character_url: " ", character_created: " ", character_status: " ")
        
        let bilgi2 = Character(character_id: 2, character_name: "interance", scharacter_tatus: " ", character_species: " ", character_type: " ", character_gender: " ", character_origin: " ", character_location: " ", character_image: "inception" , character_episode: " ", character_url: " ", character_created: " ", character_status: " ")
        
        
     
        characters.append(bilgi) 
        characters.append(bilgi2)
        
        CollectionViewCharacter.delegate = self
        CollectionViewCharacter.dataSource = self
          
        let design :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.CollectionViewCharacter.frame.size.width
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cellWidth = (width-30)/2
        design.itemSize = CGSize(width: cellWidth, height: cellWidth*1.7)
        design.minimumInteritemSpacing = 10
        design.minimumLineSpacing = 10
        CollectionViewCharacter.collectionViewLayout = design
        
        
    }
}




    extension ViewControllerHomePage:UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellHomePageProtocol
    {
    func sepeteEkle(indexPath: IndexPath) {
        print("Sepete Eklenen Film : \(characters[indexPath.row].character_name!)")
        self.performSegue(withIdentifier: "characterDetail", sender: characters[indexPath.row])
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let charac = characters[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CollectionViewCellHomePage
        

        cell.labelCharacterName.text = charac.character_name
        cell.imageViewCharacterPicture.image = UIImage(named: charac.character_image!)
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.hucreProtocol = self
        cell.indexPath = indexPath
        return cell
        
    }
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            self.performSegue(withIdentifier: "characterDetail", sender: indexPath.row)}
}
