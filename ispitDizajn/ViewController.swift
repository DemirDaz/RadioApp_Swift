//
//  ViewController.swift
//  ispitDizajn
//
//  Created by Demir Dazdarevic on 17.2.21..
//

import UIKit
import InteractiveSideMenu
//import PresenterKit
//import FRadioPlayer


class ViewController: UIViewController, FRadioPlayerDelegate, SideMenuItemContent, Storyboardable {
    @IBOutlet weak var imestanice: UILabel!
    
    @IBOutlet weak var skrol: UIScrollView!
    @IBOutlet weak var imepesme: UILabel!
    
    @IBOutlet weak var pauza: UIButton!
    @IBOutlet weak var dugme: UIButton!
    @IBOutlet weak var imepevaca: UILabel!
    
    @IBOutlet weak var frekvenca: UILabel!
   
    
    @IBOutlet weak var stekpesama: UIStackView!
    @IBOutlet weak var sideme: UIButton!
    @IBOutlet weak var plej: UIButton!
    var selected = ""
    var freq = ""
    let player = FRadioPlayer.shared
    let MAX_PAGE = 20
        let MIN_PAGE = 0
        var currentPage = 0
    //var myTimer:Timer
    
    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
    
        
        
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
        if state == .playing {
            plej.tintColor = UIColor.orange
            pauza.tintColor = UIColor.gray
        }
        if state == .paused {
            plej.tintColor = UIColor.gray
            pauza.tintColor = UIColor.orange
        }
        
    }
    func radioPlayer(_ player: FRadioPlayer, metadataDidChange artistName: String?, trackName: String?) {
        
        
        frekvenca.text = freq
        imestanice.text = selected
        
        let preferences = UserDefaults.standard
        
        if selected != "Play Radio" {
            
        imepesme.text = trackName
        //print(trackName?.debugDescription)
            imepevaca.text = artistName }
        preferences.setValue(imepesme.text, forKey: "pesma")
        preferences.setValue(imepevaca.text, forKey: "pevac")
        updateLabels()
    }
    func radioPlayer(_ player: FRadioPlayer, itemDidChange url: URL?) {
        
        imestanice.text = url?.baseURL?.absoluteString
    }
    

    override func viewDidLoad() {
        //self.imepesme.slideInFromLeft()
        //self.imepevaca.slideInFromLeft()
        
        player.delegate = self
            // player.radioURL = URL(string: "")
        //player.radioURL = URL(string: "https://current.stream.publicradio.org/kcmp.mp3")
       // player.play()
        self.view.bringSubviewToFront(plej)
        self.view.bringSubviewToFront(pauza)
        self.view.bringSubviewToFront(dugme)
       
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func detectSwipe (_ sender: UISwipeGestureRecognizer) {
        if (currentPage < MAX_PAGE && sender.direction == UISwipeGestureRecognizer.Direction.left) {
            moveScrollView(direction: 1)
        }
        if (currentPage > MIN_PAGE && sender.direction == UISwipeGestureRecognizer.Direction.right) {
            moveScrollView(direction: -1)
        }
    }



    func moveScrollView(direction: Int) {
        currentPage = currentPage + direction
        let point: CGPoint = CGPoint(x: skrol.frame.size.width * CGFloat(currentPage), y: 0.0)
        skrol.setContentOffset(point, animated: true)

        // Create a animation to increase the actual icon on screen
        
        }
    
    @IBAction func open(_ sender: Any) {
        showSideMenu()
                    }
        
      
       
        //showSideMenu()
    func updateLabels() {

        
            /* _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (t) in
                    self.imepesme.text = self.imepesme.text
                    self.imepevaca.text = self.imepevaca.text
                   DispatchQueue.main.async(execute: {
                    UIView.animate(withDuration: 5.0, delay: 1, options: ([.curveLinear, .repeat]), animations: {() -> Void in
                        self.imepesme.center = CGPoint(x:0 - self.imepesme.bounds.size.width, y:self.imepesme.center.y)
                    }, completion:  nil)
                })
                                        
                }
 */
            }

    @IBAction func radio1(_ sender: Any) {
        player.radioURL = URL(string: "https://current.stream.publicradio.org/kcmp.mp3")
        selected = "Public R"
        freq = "102.8"
        player.play()
        let n = Int(arc4random_uniform(6))
        
        stekpesama.addArrangedSubview(self.stekpesama.subviews[n])
       
    }
    @IBAction func radio2(_ sender: Any) {
        player.radioURL = URL(string: "http://79.172.194.189:4120/live.mp3")
        selected = "Cannes B"
        freq = "103.6"
        player.play()
        let n = Int(arc4random_uniform(6))
        stekpesama.addArrangedSubview(self.stekpesama.subviews[n])
    }
    @IBAction func radio3(_ sender: Any) {
       player.radioURL = URL(string: "http://82.135.234.195:8000/gerasfm.mp3")
        selected = "US Now"
        freq = "112.8"
        player.play()
        let n = Int(arc4random_uniform(6))
        stekpesama.addArrangedSubview(self.stekpesama.subviews[n])
        
    }
    @IBAction func radio4(_ sender: Any) {
        player.radioURL = URL(string: "https://stream.playradio.rs:8443/play.aac")
        selected = "Play Radio"
        freq = "82.6"
        imepesme.text = "Magic"
        imepevaca.text = "Chain Smokers"
        let n = Int(arc4random_uniform(6))
        stekpesama.addArrangedSubview(self.stekpesama.subviews[n])
    }
    @IBAction func pauseBtn(_ sender: Any) {
        player.pause()
        
    }
    
    @IBAction func playBtn(_ sender: Any) {
        player.play()
    }
    
    
}
extension UIView {
    // Name this function in a way that makes sense to you...
     // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideInFromLeft(duration: TimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
 // Create a CATransition animation
 let slideInFromLeftTransition = CATransition()

        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }

        // Customize the animation's properties
        slideInFromLeftTransition.type = CATransitionType.push
        slideInFromLeftTransition.subtype = CATransitionSubtype.fromLeft
       slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInFromLeftTransition.fillMode = CAMediaTimingFillMode.removed

       // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
}

