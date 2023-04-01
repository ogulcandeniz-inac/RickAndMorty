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
    var characterscell: Character?
    var film:Character?
    
    
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
        
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
  
        let gidilecekVC = segue.destination as! CharacterDetailViewController
        gidilecekVC.film = characters[indeks!]
        
     
        
        
    
    }
    */
        
    
        
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

                        print("okudu3")
                        print(cevap.results)
                        
                    let gelenKategoriListesi = cevap.results
                        self.characters = gelenKategoriListesi
                        
                        

                    DispatchQueue.main.async {
                        self.CollectionViewCharacter.reloadData()
                        print("okudu4")
                    }
                    
                }catch{
                    print(error.localizedDescription)
                    print("okudu5")
                }
            }.resume()
        }
        
    }

    
    
        extension ViewControllerHomePage:UICollectionViewDelegate,UICollectionViewDataSource,CollectionViewCellHomePageProtocol
{
            func sepeteEkle(indexPath: IndexPath) {
                // print("Sepete Eklenen Film : \(characters[indexPath.row].name!)")
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
                
                
                //
                
                
                if let url = URL(string: "https://rickandmortyapi.com/api/character/avatar\(film.image)")
                    
                {
                    URLSession.shared.dataTask(with: url) { data , response , error in
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: url)
                            
                            
                            
                            
                            DispatchQueue.main.async {
                                
                               
                                cell.imageViewCharacterPicture.image = UIImage(named: film.image)
                                cell.imageViewCharacterPicture.image = UIImage(data: data!)
                                
                            }
                        }
                    }
                }
                    
                 
                        
                        
                        
                        
                        
                        
                        
                        
                        cell.layer.borderColor = UIColor.lightGray.cgColor
                        cell.layer.borderWidth = 0.5
                        
                        cell.hucreProtocol = self
                        cell.indexPath = indexPath
                        
                        return cell
                    }
                    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                        self.performSegue(withIdentifier: "characterDetail", sender: indexPath.row)}
                }
                
            
        
