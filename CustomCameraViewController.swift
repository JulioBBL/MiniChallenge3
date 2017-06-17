//
//  CustomCameraViewController.swift
//  MiniChallenge03
//
//  Created by Bruno Cruz on 14/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import AVFoundation

class CustomCameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {

    @IBOutlet weak var previewView: UIView!
    
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var virarcameraButton: UIButton!
    
    @IBOutlet weak var tirarFotoButton: UIButton!
    
    let captureSession = AVCaptureSession()
    let capturePhotoOutput = AVCapturePhotoOutput()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var captureDevice: AVCaptureDevice?
    var photoReady: UIImage?
    var imageView: UIImageView?
    var img: UIImage? = nil
    var cameraflag = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDevice()
        virarcameraButton.layer.cornerRadius = 6.0
        tirarFotoButton.layer.cornerRadius = 6.0
        backGroundImage.image = #imageLiteral(resourceName: "backgroundCameraScreen")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDevice(){
        self.captureSession.sessionPreset = AVCaptureSessionPresetHigh
        guard let devices = AVCaptureDeviceDiscoverySession.init(deviceTypes: [.builtInTelephotoCamera,.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified).devices else {
            print("Não encontrou a camera")
            return
        }
        for device in devices {
            if self.cameraflag {
                if device.position == AVCaptureDevicePosition.back {
                    captureDevice = device
                    beginSession()
                    break
                }
            }else{
                if device.position == AVCaptureDevicePosition.front {
                    captureDevice = device
                    beginSession()
                    break
                }
            }
        }
    }


    @IBAction func changeCamera(_ sender: Any) {
        cameraflag = !cameraflag
        endSession()
        setDevice()

    }
    func endSession(){
        
        captureSession.removeInput(captureSession.inputs[0] as! AVCaptureDeviceInput )
        
    }
    
    func beginSession() {
        
        do {
            try captureSession.addInput(AVCaptureDeviceInput(device: captureDevice))
            
            if captureSession.canAddOutput(capturePhotoOutput) {
                captureSession.addOutput(capturePhotoOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.portrait
                if let pl = previewLayer {
                    self.previewView.layer.addSublayer(pl)
                }
            }
            
        }
        catch {
            print("error: \(error.localizedDescription)")
        }
    }
    
    
    @IBAction func saveToCamera(_ sender: Any) {
        if let _ = capturePhotoOutput.connection(withMediaType: AVMediaTypeVideo) {
            let settings = AVCapturePhotoSettings()
            let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
            let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
                                 kCVPixelBufferWidthKey as String: 160,
                                 kCVPixelBufferHeightKey as String: 160]
            settings.previewPhotoFormat = previewFormat
            capturePhotoOutput.capturePhoto(with: settings, delegate: self)
        }
    }
    func capture(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhotoSampleBuffer photoSampleBuffer: CMSampleBuffer?, previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
        }
        
        if let sampleBuffer = photoSampleBuffer, let previewBuffer = previewPhotoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
            print(UIImage(data: dataImage)?.size ?? "?")
            let imagedata = UIImage(data: dataImage)
            
            
            photoReady = textToImage(overlay: img!, inImage: imagedata! )
            performSegue(withIdentifier: "showphoto", sender: self)
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        captureSession.startRunning()
        previewLayer?.frame = self.previewView.bounds
        
        imageView = UIImageView(image: img)
        imageView?.contentMode = .scaleAspectFit
        
        
        imageView?.frame = self.previewView.bounds
        self.previewView.addSubview(imageView!)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showphoto"{
            if let aux = segue.destination as? showpictureViewController{
                aux.image = photoReady
                //aux.imageoverlay = imageView
            }
        }
        
    }
    
    func textToImage(overlay: UIImage, inImage: UIImage) -> UIImage{
        
        let minSize = (inImage.size.width > inImage.size.height) ? inImage.size.height : inImage.size.width
        let maxSize = (inImage.size.width < inImage.size.height) ? inImage.size.height : inImage.size.width
        
        let size = CGSize(width: minSize, height: minSize)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        if inImage.size.width == minSize {
            inImage.draw(in: CGRect(x: 0, y: -(maxSize-minSize)/2, width: inImage.size.width, height: inImage.size.height))
        } else {
            inImage.draw(in: CGRect(x: -(maxSize-minSize)/2, y: 0, width: inImage.size.width, height: inImage.size.height))
        }
        overlay.draw(in: CGRect(x: 0, y: 0, width: minSize, height: minSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
    }
    
}
