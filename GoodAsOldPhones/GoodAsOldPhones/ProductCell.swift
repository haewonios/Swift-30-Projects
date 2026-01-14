//
//  ProductCell.swift
//  GoodAsOldPhones
//
//  Created by hyewon on 1/14/26.
//

import UIKit

class ProductCell: UITableViewCell {
    
    private let image = UIImageView()
    private let title = UILabel()
    
    static let identifier: String = "ProductCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 40),
            image.heightAnchor.constraint(equalToConstant: 40),
            
            title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    public func configure(with product: Product) {
        image.image = product.image
        title.text = product.title
        
        accessoryType = .disclosureIndicator
    }
}
