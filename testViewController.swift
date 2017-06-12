//
//  testViewController.swift
//  MiniChallenge03
//
//  Created by Bruno Cruz on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    var show1 = true
    var control = 0
    var textos = ["label1---","label2","label3",""]
    
    
    @IBOutlet weak var yesButton: UIButton!
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var backgroundimage: UIImageView!
    @IBOutlet weak var changeButton: UIButton!
    
    let alert = UIAlertController(title: "Desculpe", message: "Infelizmente você não está apto para doar...", preferredStyle: UIAlertControllerStyle.alert)
    
    let goodalert = UIAlertController(title: "Parabéns", message: "Você está parcialmente apto a doar...", preferredStyle: UIAlertControllerStyle.alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeButton.layer.cornerRadius = 6.0
        yesButton.layer.cornerRadius = 6.0
        backgroundimage.image = UIImage.init(named: "backgroundtest")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Main")
        
        alert.addAction(UIAlertAction(title: "Sair", style: UIAlertActionStyle.default, handler: { action in
            
            switch action.style{
            case .default:
                self.present(controller, animated: true, completion: nil)
                
            default:
                break
            }
            
        }))
        
        goodalert.addAction(UIAlertAction(title: "Sair", style: UIAlertActionStyle.default, handler: { action in
            
            switch action.style{
            case .default:
                self.present(controller, animated: true, completion: nil)
                
            default:
                break
            }
            
        }))
        
        
        
    }
    
    
    
    
    @IBAction func cancelTest(_ sender: Any) {
        self.present(alert, animated: false, completion: nil)
    }
    
    

    @IBAction func changeLabel(_ sender: Any) {
        firstLabel.text = textos[control]
        control = control + 1
        
        if control == textos.count{
            control = textos.count-1
            self.present(goodalert, animated: false, completion: nil)
            
            //print(control)
            
        }
    }
    
    
}
