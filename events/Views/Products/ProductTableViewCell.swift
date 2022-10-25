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
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
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
        contentView.addSubview(textStack)
        contentView.addSubview(photoView)
        let textStackContraints = [
            textStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            textStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6),
            textStack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            photoView.rightAnchor.constraint(equalTo: photoView.leftAnchor, constant: 6),
        ]
        let photoViewConstraints = [
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 6),
            photoView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 6),
            photoView.heightAnchor.constraint(equalToConstant: 100),
            photoView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(textStackContraints + photoViewConstraints)
    }
    
    public func boot(product: ProductModel) {
        print(product)
        self.nameView.text = product.name
        self.descriptionView.text = product.description
        self.priceView.text = String(product.price)
        self.photoView.image = UIImage(systemName: "house")
    }

}
