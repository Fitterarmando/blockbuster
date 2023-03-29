//
//  SplashScreen.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 17/03/23.
//

import UIKit

class SplashScreen: UIViewController {
    
    @IBOutlet var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        image.alpha = 0.0
        
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1.0
        }) { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "NavigationController")
                vc.modalPresentationStyle = .overFullScreen
                vc.modalTransitionStyle = .crossDissolve
                self.show(vc, sender: self)
                
            }
            
         }
    }

}
        


    

