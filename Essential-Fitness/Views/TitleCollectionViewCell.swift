//
//  TitleCollectionViewCell.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import UIKit
 import SDWebImage // 15.12.6
 // view cell that responsible for handling everything inside collection view instead of default collection view cell get with collection view
 class TitleCollectionViewCell: UICollectionViewCell {

     // first thing we need is identiire
     static let identifier = "TitleCollectionViewCell"

     // we need a image view so then we can pass the poster
     private let posterImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill // we want to fill the entire cell ith the image
           return imageView
       }()

     // defalt frame
       override init(frame: CGRect) {
           super.init(frame: frame)
         // set image view as a sub view
           contentView.addSubview(posterImageView)

       }

     // need this to avoid errors
     required init?(coder: NSCoder) {
         fatalError()
     }

     // layout the entire view as a whole view of the content view
     override func layoutSubviews() {
          super.layoutSubviews()
          posterImageView.frame = contentView.bounds
      }

     //https://github.com/SDWebImage/SDWebImage.git is a third party package to cache web images. add this using add package. udr thr github url to search
     
     public func configure(with model: String) {

             guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else {
                 return
             }

             posterImageView.sd_setImage(with: url, completed: nil)
         }
 }

