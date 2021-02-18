//
//  ViewController.swift
//  ispitDizajn
//
//  Created by Demir Dazdarevic on 17.2.21..
//

import UIKit
import InteractiveSideMenu
import PresenterKit
//import FRadioPlayer


class ViewController: UIViewController, FRadioPlayerDelegate, SideMenuItemContent, Storyboardable {
    @IBOutlet weak var imestanice: UILabel!
    
    @IBOutlet weak var imepesme: UILabel!
    
    @IBOutlet weak var dugme: UIButton!
    @IBOutlet weak var imepevaca: UILabel!
    
    @IBOutlet weak var frekvenca: UILabel!
    @IBOutlet weak var pauza: UIButton!
    
    @IBOutlet weak var sideme: UIButton!
    @IBOutlet weak var plej: UIButton!
    var selected = ""
    var freq = ""
    let player = FRadioPlayer.shared
    
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
        if selected != "Play Radio" {
        imepesme.text = trackName
        //print(trackName?.debugDescription)
            imepevaca.text = artistName }
    }
    func radioPlayer(_ player: FRadioPlayer, itemDidChange url: URL?) {
        imestanice.text = url?.baseURL?.absoluteString
    }
    

    override func viewDidLoad() {
        
       
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
    @IBAction func open(_ sender: Any) {
        showSideMenu()
                    }
        
      
       
        //showSideMenu()
    

    @IBAction func radio1(_ sender: Any) {
        player.radioURL = URL(string: "https://current.stream.publicradio.org/kcmp.mp3")
        selected = "Public R"
        freq = "102.8"
        player.play()
       
    }
    @IBAction func radio2(_ sender: Any) {
        player.radioURL = URL(string: "http://79.172.194.189:4120/live.mp3")
        selected = "Cannes B"
        freq = "103.6"
        player.play()
    }
    @IBAction func radio3(_ sender: Any) {
       player.radioURL = URL(string: "http://82.135.234.195:8000/gerasfm.mp3")
        selected = "US Now"
        freq = "112.8"
        player.play()
        
    }
    @IBAction func radio4(_ sender: Any) {
        player.radioURL = URL(string: "https://stream.playradio.rs:8443/play.aac")
        selected = "Play Radio"
        freq = "82.6"
        imepesme.text = "Magic"
        imepevaca.text = "Chain Smokers"
    }
    @IBAction func pauseBtn(_ sender: Any) {
        player.pause()
        
    }
    
    @IBAction func playBtn(_ sender: Any) {
        player.play()
    }
    
    
}

