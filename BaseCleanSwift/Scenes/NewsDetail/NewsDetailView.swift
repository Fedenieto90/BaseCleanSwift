//
//  NewsDetailView.swift
//  BaseCleanSwift
//
//  Created by Federico Nieto on 18/08/2021.
//

import UIKit

protocol NewsDetailViewDelegate: AnyObject {

//    func handleButtonPress()
}

class NewsDetailView: UIView {
    
    private struct ViewTraits {
    
        static let margin: CGFloat = 20
        static let imageHeight: CGFloat = 300
    }
    
    // MARK: Views
    
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
    
    let author: UILabel = {
        let author = UILabel()
        author.translatesAutoresizingMaskIntoConstraints = false
        author.textColor = .secondaryLabel
        author.numberOfLines = 0
        return author
    }()
    
    
    // MARK: Parameters

    public weak var viewDelegate: NewsDetailViewDelegate?
    
    // MARK: Init
    override init(frame: CGRect) {
    
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {

        super.init(coder: coder)
        setup()
    }
    
    // MARK: Display
    
    func setData(articleViewModel: NewsDetail.Something.ArticleDetailViewModel) {
        title.text = articleViewModel.title
        desc.text = articleViewModel.description
        if let url = URL(string: articleViewModel.urlToImage ?? "") {
            self.image.af.setImage(withURL: url, imageTransition: .crossDissolve(0.3))
        } else {
            self.image.image = UIImage(named: "placeholder")
        }
        author.text = articleViewModel.author
    }
}

// MARK: - Setup
private extension NewsDetailView {

    func setup() {
        
        setupViews()
        setupViewHierarchy()
        setupViewConstraints()
    }
    
    // MARK: View setup
    func setupViews() {
        
        setupView()
    }

    func setupView() {

        backgroundColor = .systemBackground
    }

    // MARK: View Hierarchy
    func setupViewHierarchy() {
        
        addSubview(title)
        addSubview(desc)
        addSubview(image)
        addSubview(author)
    }

    // MARK: View Constraints
    func setupViewConstraints() {
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: ViewTraits.margin),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.margin),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.margin),
            
            desc.topAnchor.constraint(equalTo: title.bottomAnchor, constant: ViewTraits.margin),
            desc.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.margin),
            desc.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.margin),
            
            image.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: ViewTraits.margin),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.margin),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.margin),
            image.heightAnchor.constraint(equalToConstant: ViewTraits.imageHeight),
            image.bottomAnchor.constraint(lessThanOrEqualTo:bottomAnchor),
            
            author.topAnchor.constraint(equalTo: image.bottomAnchor, constant: ViewTraits.margin),
            author.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.margin),
            author.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.margin),
        ])
    }
}
