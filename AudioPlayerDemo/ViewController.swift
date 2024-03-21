//
//  ViewController.swift
//  AudioPlayerDemo
//
//  Created by Smita Kankayya on 21/03/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var avPlayer : AVPlayer?
    var btnPlay : UIButton!
    var btnStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createBtnThroughCode()
    }
    
    func createBtnThroughCode(){
        btnPlay = UIButton(frame: CGRect(x: 150, y: 175, width: 100 , height: 40))
        btnPlay.setTitle("Play", for: .normal)
        btnPlay.backgroundColor = .systemBlue
        btnPlay.addTarget(self, action: #selector(playAudio), for: .touchUpInside)
        self.view.addSubview(btnPlay)
        
        btnStop = UIButton(frame: CGRect(x: 150, y: 590, width: 100, height: 40))
        btnStop.setTitle("Stop", for: .normal)
        btnStop.backgroundColor = .systemRed
        btnStop.addTarget(self, action: #selector(stopAudio), for: .touchUpInside)
        self.view.addSubview(btnStop)
    }
    
    
    @objc func playAudio() {
        print("Play button clicked")
        if let url = Bundle.main.url(forResource: "audio_file", withExtension: ".mp3") {
            avPlayer = AVPlayer(url: url)
            avPlayer?.play()
        } else {
            print("Audio file not found")
        }
    }
    @objc func stopAudio() {
        print("Stop button clicked")
        avPlayer?.pause()
        avPlayer?.seek(to: CMTime.zero) // Move the player's time back to the beginning
    }
    
    
    @IBAction func btnClick(_ sender: UIButton) {
        print(sender.tag)
        print(sender.titleLabel?.text! ?? 0)
    }
    
    
}

