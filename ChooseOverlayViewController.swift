//
//  ChooseOverlayViewController.swift
//  MiniChallenge03
//
//  Created by Bruno Cruz on 17/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class ChooseOverlayViewController: UIViewController {

    var choice = true
    var image:UIImage?
    
    @IBOutlet weak var filter1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func choicefilter1(_ sender: Any) {
        choice = true
        print(choice)
        
    }


    @IBAction func choicefilter2(_ sender: Any) {
        choice = false
        print(choice)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if choice == true{
        image = #imageLiteral(resourceName: "filtro1")
        }
        else{
        // mudar para o filtro 2
        image = #imageLiteral(resourceName: "filtro2")
        }
        if let aux = segue.destination as? CustomCameraViewController{
        aux.img = image
        
        }
    
    
    }
    
    
    
}
