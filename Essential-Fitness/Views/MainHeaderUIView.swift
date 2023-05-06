//
//  MainHeaderUIView.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import UIKit

class MainHeaderUIView: UIView {
    
    class MainHeaderUIView: UIView {
        private let mainImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true //
            imageView.image = UIImage(named: "mainimage.jpg") // add image to assets !
            return imageView
        }()
        
        private let playButton: UIButton = {
            
            let button = UIButton()
            button.setTitle("Play", for: .normal)
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1
            button.translatesAutoresizingMaskIntoConstraints = false // set false so we can use our own constrain
            button.layer.cornerRadius = 5
            return button
        }()
        
        private let downloadButton: UIButton = {
            let button = UIButton()
            button.setTitle("Download", for: .normal)
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.borderWidth = 1
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 5
            return button
        }()
        
        // intialize ith the frame. the frame get created when initializing
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(mainImageView)
            addGradient()
            addSubview(playButton) // if you add constrant for elemtn but you fogot to init in you got black screen and throw error.
            addSubview(downloadButton)
            applyConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError()
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            mainImageView.frame = bounds
        }
        
        private func addGradient() {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [
                UIColor.clear.cgColor, // clear / absent of color( show any color that is in that area.
                UIColor.systemBackground.cgColor // whatever color in system backgroung
            ]
            gradientLayer.frame = bounds // need a frame to apply this
            layer.addSublayer(gradientLayer)
        }
        private func applyConstraints() {
            
            // left anchor and right anchor is variate base on location you ara in . example arabic so we can use leadingAnchor so it behave deferently base on language
            let playButtonConstraints = [
                playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
                playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                playButton.widthAnchor.constraint(equalToConstant: 120)
            ]
            
            let downloadButtonConstraints = [
                downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
                downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
                downloadButton.widthAnchor.constraint(equalToConstant: 120)
            ]
            
            // activate constraints
            NSLayoutConstraint.activate(playButtonConstraints)
            NSLayoutConstraint.activate(downloadButtonConstraints)
            
        }
    }
}
