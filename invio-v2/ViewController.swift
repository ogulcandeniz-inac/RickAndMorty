//
//  ViewController.swift
//  invio-v2
//
//  Created by Oğulcan Deniz İnaç on 24.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ımageViewRickAndMorty: UIImageView!
    @IBOutlet weak var ımageViewTitle: UIImageView!
    @IBOutlet weak var labelTdddtle: UILabel!
    var counter:Timer?
    
    @IBOutlet weak var labeladinikoy: UILabel!
    
    
    @IBOutlet weak var labeltitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        ımageViewRickAndMorty.addGestureRecognizer(tapGR)
        ımageViewRickAndMorty.isUserInteractionEnabled = true
        
        animation()
        scaleanimation()
        
        
       
        let currentCount = UserDefaults.standard.integer(forKey: "launchCount")
        
        labeltitle.text = String(currentCount)
        
        if currentCount == 0
        {
            counter = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(labelWelcome), userInfo: nil, repeats: false)
            UserDefaults.standard.set(currentCount+1, forKey:"launchCount")
        }
        
        if currentCount >= 1
        {
            counter = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(labelhello), userInfo: nil, repeats: false)
            UserDefaults.standard.set(currentCount-1, forKey:"launchCount")
        }
       
        
        
        
        
        
    }

    
    
    
    
    
    @objc func imageTapped(sender: UITapGestureRecognizer)
    {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerHomePage") as! ViewControllerHomePage
            self.navigationController?.pushViewController(next, animated: true)
    }
    
    @objc func labelWelcome( )
    {
        labeltitle.text = "Welcome"
        repetitiveanimation()
    }
    @objc func labelhello( )
    {
        labeltitle.text = "Hello"
        repetitiveanimation()
    }
    
    func repetitiveanimation()
    {
        UIView.animate(withDuration: 2, delay: 0, options: [.repeat,.autoreverse], animations: { self.labeltitle.transform = CGAffineTransform(translationX: 0, y: 20)}, completion: nil)
    }
    func animation()
    {
        self.ımageViewTitle.alpha = 1
        UIView.animate(withDuration: 5,animations:{
            self.ımageViewTitle.alpha = 0
        },completion: nil)
    }
    func scaleanimation()
    {
        UIView.animate(withDuration: 5,animations: {
            self.ımageViewTitle.transform = CGAffineTransform(scaleX: 2, y: 2)
        }, completion: nil)
    }
    func scaleanimation2()
    {
        UIView.animate(withDuration: 5,animations: {
            self.labeltitle.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: nil)
    }
    func scaleanimation3()
    {
        UIView.animate(withDuration: 5,animations: {
            self.labeltitle.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

