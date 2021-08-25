//
//  ArticleSearchTableViewCell.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 23/08/2021.
//

import Foundation

import UIKit
import AlamofireImage

class ArticleSearchTableViewCell: UITableViewCell {
    
    static let identifier = "ArticleSearchTableViewCell"
    
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
    
    var articleViewModel: NewsListSearch.Search.ArticleViewModel? {
        didSet {
            setupArticleInformation()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: NewsListSearch.Search.ArticleViewModel?) {
        articleViewModel = viewModel
    }
    
    func setup() {
        setupViews()
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    func setupViews() {
        setupView()
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
        title.text = articleViewModel?.title
        desc.text = articleViewModel?.description
        if let url = URL(string: articleViewModel?.urlToImage ?? "") {
            self.image.af.setImage(withURL: url, placeholderImage: UIImage(named: "placeholder"), imageTransition: .crossDissolve(0.3))
        } else {
            self.image.image = UIImage(named: "placeholder")
        }
    }

}
