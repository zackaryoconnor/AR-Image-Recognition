//
//  VoiceRecordingController.swift
//  AR Image Recognition
//
//  Created by Zackary O'Connor on 8/26/20.
//  Copyright © 2020 Zackary O'Connor. All rights reserved.
//

import UIKit

class VoiceRecordingController: UIViewController {
    
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
        let button = UIButton(title: "Replay", backgroundColor: .systemBlue, setTitleColor: .white, cornerRadius: 16)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.25
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
        playButton.anchor(leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: padding, bottom: padding, right: padding), size: CGSize(width: view.frame.width, height: 64))
    }
}

