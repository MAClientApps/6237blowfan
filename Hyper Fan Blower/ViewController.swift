//
//  ViewController.swift
//  Hyper Fan Blower
//
//  Created by APPLE on 03/10/23.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet weak var suond1: UIImageView!
    @IBOutlet weak var suond2: UIImageView!
    @IBOutlet weak var suond3: UIImageView!
    @IBOutlet weak var suond4: UIImageView!
    @IBOutlet weak var suond5: UIImageView!
    
    @IBOutlet weak var off: UIImageView!
        
    @IBOutlet weak var med: UIImageView!
    
    @IBOutlet weak var high: UIImageView!
    
    @IBOutlet weak var low: UIImageView!
    
    @IBOutlet weak var onshow: UIImageView!
    
    var currentPlayingImageView: UIImageView?
    
    var player : AVAudioPlayer?
    let imageView = UIImageView()
    var rotateDuration: TimeInterval = 0.3 // Initial rotation duration in seconds
    var isRotating = false // Track if rotation is active
    let scrollView = UIScrollView()
    let rotateOffIV = UIImageView()
    let lowRotateIV = UIImageView()
    let mediumRotateIV = UIImageView()
    let highRotateIV = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //show banner in viewController
        AppDelegate.sharedInstance().mobflow?.showBannerAd(vc: self) //self here is viewController

        // Set up the image view
        imageView.frame = CGRect(x: 100, y: 370, width: 200, height: 200)
        imageView.image = UIImage(named: "img_fan")
        view.addSubview(imageView)
        
        // Rotate the image view
//        highRotate()
        // Create a UITapGestureRecognizer
        let tapoff = UITapGestureRecognizer(target: self, action: #selector(handlerotateOffTap(_:))) // Add the tap gesture recognizer to the UIImageView
        off.addGestureRecognizer(tapoff) // Enable user interaction for the UIImageView
        off.isUserInteractionEnabled = true

        // Create a UITapGestureRecognizer
        let taplow = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))) // Add the tap gesture recognizer to the UIImageView
        low.addGestureRecognizer(taplow) // Enable user interaction for the UIImageView
        low.isUserInteractionEnabled = true
        
        // Create a UITapGestureRecognizer
        let tapmed = UITapGestureRecognizer(target: self, action: #selector(handmediumRotateTap(_:))) // Add the tap gesture recognizer to the UIImageView
        med.addGestureRecognizer(tapmed) // Enable user interaction for the UIImageView
        med.isUserInteractionEnabled = true
        
        // Create a UITapGestureRecognizer
        let taphigh = UITapGestureRecognizer(target: self, action: #selector(handhighRotatefTap(_:))) // Add the tap gesture recognizer to the UIImageView
        high.addGestureRecognizer(taphigh) // Enable user interaction for the UIImageView
        high.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer to suond1
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(suond1Tapped(_:)))
        suond1.isUserInteractionEnabled = true
        suond1.addGestureRecognizer(tapGesture)
        
        // Add tap gesture recognizer to suond2
        let tapsuond2 = UITapGestureRecognizer(target: self, action: #selector(suond2Tapped(_:)))
        suond2.isUserInteractionEnabled = true
        suond2.addGestureRecognizer(tapsuond2)
        
        // Add tap gesture recognizer to suond3
        let tapsuond3 = UITapGestureRecognizer(target: self, action: #selector(suond3Tapped(_:)))
        suond3.isUserInteractionEnabled = true
        suond3.addGestureRecognizer(tapsuond3)
        
        // Add tap gesture recognizer to suond4
        let tapsuond4 = UITapGestureRecognizer(target: self, action: #selector(suond4Tapped(_:)))
        suond4.isUserInteractionEnabled = true
        suond4.addGestureRecognizer(tapsuond4)
        
        // Add tap gesture recognizer to suond5
        let tapsuond5 = UITapGestureRecognizer(target: self, action: #selector(suond5Tapped(_:)))
        suond5.isUserInteractionEnabled = true
        suond5.addGestureRecognizer(tapsuond5)
        
    }
    // Action for suond1 tap gesture
    @objc func suond1Tapped(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                self.playSound(forImageView: self.suond1)
            })
        }
    }
    // Action for suond2 tap gesture
    @objc func suond2Tapped(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                self.playSound(forImageView: self.suond2)
            })
        }
    }
    // Action for suond3 tap gesture
    @objc func suond3Tapped(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                self.playSound(forImageView: self.suond3)
            })
        }
    }
    // Action for suond4 tap gesture
    @objc func suond4Tapped(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                self.playSound(forImageView: self.suond4)
            })
        }
    }
    // Action for suond5 tap gesture
    @objc func suond5Tapped(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                self.playSound(forImageView: self.suond5)
            })
        }
    }
    // Function to play sound for the tapped UIImageView
        func playSound(forImageView imageView: UIImageView) {
            var soundFileName = ""
            
            if imageView == suond1 {
                soundFileName = "sund1"
            } else if imageView == suond2 {
                soundFileName = "sund2"
            } else if imageView == suond3 {
                soundFileName = "sund3"
            } else if imageView == suond4 {
                soundFileName = "sund4"
            } else if imageView == suond5 {
                soundFileName = "sund5"
            }
            
            if let player = player, player.isPlaying {
                // stop playback
                player.stop()
            }else {
                // set up player, and play
                let urlString = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
                do {
                    try AVAudioSession.sharedInstance().setMode(.default)
                    try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                    guard let urlString = urlString else {
                        return
                    }
                    player=try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                    guard let player = player else {
                        return
                    }
                    player.play()
                }
                catch {
                    print("something went wrong")
                }
            }

        }
    
    // Start rotating with the initial speed
    func rotateImageView() {
        if isRotating {
            UIView.animate(withDuration: rotateDuration, delay: 0, options: .curveLinear, animations: {
                self.imageView.transform = self.imageView.transform.rotated(by: CGFloat.pi) // Rotate 180 degrees
            }) { (_) in
                self.rotateImageView() // Repeat the rotation
            }
        }
    }
    @objc func handlerotateOffTap(_ sender: UITapGestureRecognizer) {
        // Call the lowRotate() function when the UIImageView is tapped
        rotateOff()
        // Assuming you have an image named "myImage" in your project's assets
        if let image = UIImage(named: "button") {
            onshow.image = image
        } else {
            // Handle the case where the image couldn't be loaded
            print("Image not found")
        }
    }
    func rotateOff() {
        isRotating = false
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                // Call the lowRotate() function when the UIImageView is tapped
                self.lowRotate()
                // Assuming you have an image named "myImage" in your project's assets
                if let image = UIImage(named: "stopbtn") {
                    self.onshow.image = image
                } else {
                    // Handle the case where the image couldn't be loaded
                    print("Image not found")
                }
            })
        }
    }

    func lowRotate() {
        isRotating = true
        rotateDuration = 1.0 // Low rotation speed in seconds
        rotateImageView()
        playSound(forImageView: suond1)
    }
    @objc func handmediumRotateTap(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                // Call the lowRotate() function when the UIImageView is tapped
                self.mediumRotate()
                // Assuming you have an image named "myImage" in your project's assets
                if let image = UIImage(named: "stopbtn") {
                    self.onshow.image = image
                } else {
                    // Handle the case where the image couldn't be loaded
                    print("Image not found")
                }
            })
        }
    }
    func mediumRotate() {
        isRotating = true
        rotateDuration = 0.5 // Medium rotation speed in seconds
        rotateImageView()
        playSound(forImageView: suond1)
    }
    @objc func handhighRotatefTap(_ sender: UITapGestureRecognizer) {
        DispatchQueue.main.async {
            ///show Interestial Ads
            AppDelegate.sharedInstance().mobflow?.showInterestialAd(onClose: { isSuccess in
            //isSuccess returns bool value which indicates wether ad was shown or not
                // Call the lowRotate() function when the UIImageView is tapped
                self.highRotate()
                // Assuming you have an image named "myImage" in your project's assets
                if let image = UIImage(named: "stopbtn") {
                    self.onshow.image = image
                } else {
                    // Handle the case where the image couldn't be loaded
                    print("Image not found")
                }
            })
        }
    }
    func highRotate() {
        isRotating = true
        rotateDuration = 0.1 // High rotation speed in seconds
        rotateImageView()
        playSound(forImageView: suond1)
    }
}
