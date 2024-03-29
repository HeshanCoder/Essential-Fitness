//
//  TitleTableViewCell.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/7/23.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    // identifire for the cell
    static let identifier = "TitleTableViewCell"
    
    // to hold a image
    private let titlesPosterUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true // prevent overflowing the container
        return imageView
    }()
    
    // to hold the titel
    private let titleLabel: UILabel = {
        let label = UILabel()
        //
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playTitleButton: UIButton = {
        let button = UIButton(type: .system)
        //let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        //button.setImage(image, for: .normal)
        button.backgroundColor = .yellow
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        button.tintColor = .secondarySystemBackground
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(playTitleButton)
    
        applyConstraints()
        
    }
    
    
    private func applyConstraints() {
        // after we add sub views to this UI view( UITableViewCell )  we can customise how this cell is look like.
        // we can arrange our component in a cell.
        // so when the cell get repeat X times it ceate same like table cells as we define here.
        let titlesPosterUIImageViewConstraints = [
            titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ]
        
        
        let playTitleButtonConstraints = [
            playTitleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            playTitleButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            playTitleButton.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(playTitleButtonConstraints)
    }
    
    // hold the label and poster
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "\(model.posterURL)") else {
            return
        }
        // set image with url
        titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    
    // required initializer
    required init?(coder: NSCoder) {
        fatalError()
    }
}
