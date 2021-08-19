//
//  ArticleTableViewCell.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 19/08/2021.
//

import UIKit
import AlamofireImage

class ArticleTableViewCell: UITableViewCell {
    
    static let identifier = "ArticleTableViewCell"
    
    private struct ViewTraits {
    
        static let imageHeight: CGFloat = 300
        static let margin: CGFloat = 20
    }
    
    let title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .label
        title.numberOfLines = 0
        return title
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    let desc: UILabel = {
        let desc = UILabel()
        desc.translatesAutoresizingMaskIntoConstraints = false
        desc.textColor = .secondaryLabel
        desc.numberOfLines = 0
        return desc
    }()
    
    var article: NewsList.Something.ArticleViewModel? {
        didSet {
            setup()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        setupViews()
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    func setupViews() {
        setupView()
        setupArticleInformation()
    }
    
    func setupView() {
        selectionStyle = .none
        backgroundColor = .systemBackground
    }
    
    func setupViewHierarchy() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(desc)
    }
    
    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ViewTraits.margin),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.margin),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.margin),
            
            desc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: ViewTraits.margin),
            desc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.margin),
            desc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.margin),
            
            image.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: ViewTraits.margin),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewTraits.margin),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -ViewTraits.margin),
            image.heightAnchor.constraint(equalToConstant: ViewTraits.imageHeight),
            image.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
    
    func setupArticleInformation() {
        title.text = article?.title
        desc.text = article?.description
        if let url = URL(string: article?.urlToImage ?? "") {
            self.image.af.setImage(withURL: url, placeholderImage: UIImage(), imageTransition: .crossDissolve(0.3))
        }
    }

}
