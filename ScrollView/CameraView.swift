//
//  CameraView.swift
//  ScrollView
//
//  Created by 王玉翠 on 16/8/24.
//  Copyright © 2016年 WYC. All rights reserved.
//

import UIKit

import AVFoundation

class CameraView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    //var i = 0  在声明一个变量时,如果不手动初始化,swift不会自动初始化,为他一个默认的值
    var captureSession : AVCaptureSession?//对于optional的变量来说,optional的变量在声明的时候没有给他一个初始值,系统会自动给他一个默认的nil值
    var stillImageOutput :AVCaptureStillImageOutput?
    var previewLayer :AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        previewLayer?.frame = imageView.frame
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(true)
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error:NSError?
        
        var input:AVCaptureDeviceInput!
        
        do{
            input = try AVCaptureDeviceInput(device: backCamera)
        }
        catch let error1 as NSError{
            error = error1
            input = nil
            
        }
        
        if error == nil && captureSession?.canAddInput(input) != nil  {
            captureSession?.addInput(input)
            //一般初始化方法
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
            if captureSession?.canAddOutput(stillImageOutput) != nil {
                captureSession?.addOutput(stillImageOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session:captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                imageView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
                
                
            }
        }
        
       
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
