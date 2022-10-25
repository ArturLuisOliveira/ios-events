//
//  ProductTableViewCell.swift
//  events
//
//  Created by Artur Luis on 25/10/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    static let identifier = "ProductTableViewCell"
    
    let textStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .leading
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let horizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    let nameView: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let descriptionView: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let priceView: UILabel = {
        let textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.heightAnchor.constraint(equalToConstant: 94).isActive = true
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addConstraints() {
        textStack.addArrangedSubview(nameView)
        textStack.addArrangedSubview(descriptionView)
        textStack.addArrangedSubview(priceView)
        horizontalStack.addArrangedSubview(textStack)
        horizontalStack.addArrangedSubview(photoView)
      
        contentView.addSubview(horizontalStack)
        
        let horizontalStackContraints = [
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 6)
        ]

        NSLayoutConstraint.activate(horizontalStackContraints)
    }
    
    public func boot(product: ProductModel) {
        print(product)
        self.nameView.text = product.name
        self.descriptionView.text = product.description
        self.priceView.text = String(product.price)
        if let image = product.image {
            self.photoView.image = UIImage(named: image)
        }
        
    }

}
