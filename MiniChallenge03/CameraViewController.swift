//
//  CameraViewController.swift
//  MiniChallenge03
//
//  Created by Julio Brazil on 08/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    @IBOutlet weak var viewfinder: UIView!
    
    var session: AVCaptureSession?
    var stillImageOutput: AVCapturePhotoOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    var frontCamera = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setCamera()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.videoPreviewLayer!.frame = viewfinder.bounds
    }
    
    func setCamera(){
        let backCamera = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .back)
        let frontCamera = AVCaptureDevice.defaultDevice(withDeviceType: .builtInWideAngleCamera, mediaType: AVMediaTypeVideo, position: .front)
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        
        self.session = AVCaptureSession()
        self.session!.sessionPreset = AVCaptureSessionPreset1280x720
        
        if self.frontCamera {
            do {
                input = try AVCaptureDeviceInput(device: backCamera)
            } catch let error1 as NSError {
                error = error1
                input = nil
                print(error!.localizedDescription)
            }
        } else {
            do {
                input = try AVCaptureDeviceInput(device: frontCamera)
            } catch let error1 as NSError {
                error = error1
                input = nil
                print(error!.localizedDescription)
            }
        }
        
        if error == nil && self.session!.canAddInput(input) {
            self.session!.addInput(input)
            self.stillImageOutput = AVCapturePhotoOutput()
            
            if self.session!.canAddOutput(stillImageOutput) {
                self.session!.addOutput(stillImageOutput)
                
                self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session)
                self.videoPreviewLayer!.videoGravity = AVLayerVideoGravityResizeAspect
                self.videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                self.viewfinder.layer.addSublayer(videoPreviewLayer!)
                self.session!.startRunning()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTakePhoto(_ sender: Any) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
