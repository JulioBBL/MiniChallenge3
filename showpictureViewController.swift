//
//  showpictureViewController.swift
//  MiniChallenge03
//
//  Created by Bruno Cruz on 14/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit

class showpictureViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    var image: UIImage?
    
    @IBOutlet weak var voltarButton: UIButton!
    
    @IBOutlet weak var compartilharButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showImage.image = image
        voltarButton.layer.cornerRadius = 6.0
        compartilharButton.layer.cornerRadius = 6.0
        
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func shareImage(_ sender: Any) {
        let imageToShare = [ image! ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)

    }

}
