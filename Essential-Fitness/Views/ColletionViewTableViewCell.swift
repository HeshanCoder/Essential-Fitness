//
//  ColletionViewTableViewCell.swift
//  Essential-Fitness
//
//  Created by heshandev on 5/6/23.
//

import UIKit

// for collection view inside the table view cell
class ColletionViewTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // same like that one that use for registering a normal cell that we used in registering the cell
    // wen dequeng the cell we need a identifyer the identyfy in wich tableview to use this cell
    static let identifire = "ColletionViewTableViewCell"
    
    // override the init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

