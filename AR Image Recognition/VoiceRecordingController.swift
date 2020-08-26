//
//  VoiceRecordingController.swift
//  AR Image Recognition
//
//  Created by Zackary O'Connor on 8/26/20.
//  Copyright © 2020 Zackary O'Connor. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceRecordingController: UIViewController {
    
    var audioRecording: AVAudioPlayer?
    
    let vocalWaves: UIImageView = {
        let view = UIImageView(image: "waveform.path")
        view.contentMode = .scaleAspectFit
        view.constrainWidth(constant: 450)
        view.constrainHeight(constant: 175)
        return view
    }()
    
    let quote = UILabel(text: "quote from person goes here", textColor: .secondaryLabel, textAlignment: .center)
    
    let person = UILabel(text: "- Persons name", textColor: .tertiaryLabel, textAlignment: .center)
    
    let playButton: UIButton = {
        let button = UIButton(title: "Replay", backgroundColor: .secondarySystemBackground, setTitleColor: .tertiaryLabel, cornerRadius: 16)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.16
        button.layer.shadowOffset = CGSize(width: 0, height: 6)
        button.layer.shadowRadius = 8
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let quoteDetailsStack = UIStackView(arrangedSubviews: [vocalWaves,
                                                               UIView(),
                                                               quote,
                                                               person],
                                            customSpacing: 4, axis: .vertical, distribution: .fill)
        
        view.addSubview(quoteDetailsStack)
        quoteDetailsStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 86, left: padding, bottom: 0, right: padding), size: CGSize(width: view.frame.width, height: 250))
        
        view.addSubview(playButton)
        playButton.anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: padding, bottom: padding * 2, right: padding), size: CGSize(width: view.frame.width, height: 64))
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let path = Bundle.main.path(forResource: "seagulls.wav", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            audioRecording = try AVAudioPlayer(contentsOf: url)
            // plays audio when device is in silent mode
            try AVAudioSession.sharedInstance().setCategory(.playback)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.playAudio()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    func playAudio() {
        
        audioRecording?.play()
        
        if audioRecording?.isPlaying == true {
//            playButton.backgroundColor = .systemPink
            playButton.setTitle("Stop", for: .normal)
            return
        } else {
            audioRecording?.stop()
            playButton.backgroundColor = .white
            playButton.setTitle("Replay", for: .normal)
        }
        
    }
}
