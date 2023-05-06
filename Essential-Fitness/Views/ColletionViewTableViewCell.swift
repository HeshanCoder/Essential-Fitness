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
    
    // this cell is consist with collection view
    private let collectionView: UICollectionView = {
        
        let layout  = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // how we scroll horizontaly
        layout.itemSize = CGSize(width: 140, height: 200) // set te size of each cell of the rows
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectioView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectioView
        
    }()
    
    // override the init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView) // add collectionView as sub view to content view
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension ColletionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell" , for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    // 10 from left to right
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
}
