//
//  CategoryCollectionViewCell.swift
//  events
//
//  Created by Artur Luis on 20/10/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "house")
        
        return imageView
    }()
    
    private let nameView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bebidas"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
        
  
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameView)
        contentView.addSubview(stackView)
        
        let stackConstrains = [
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 6),
        ]

        NSLayoutConstraint.activate(stackConstrains)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
}
