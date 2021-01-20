//
//  MovieDetailsView.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 20-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailsView: UIView {
    
    var viewModel = ViewModel() {
        didSet {
            titleLabel.text = viewModel.title
            overviewLabel.text = viewModel.overview
            imageView.image = viewModel.posterImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.isDirectionalLockEnabled = true
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = UIView.ContentMode.scaleAspectFit
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let overviewLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.numberOfLines = 0
        view.textAlignment = .justified
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

extension MovieDetailsView {
    private func setUpView() {
        self.backgroundColor = .white
        self.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 8),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: overviewLabel.topAnchor, constant: -8),
        ])

        NSLayoutConstraint.activate([
            overviewLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            overviewLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
        ])
        
    }
}

extension MovieDetailsView {
    struct ViewModel {
        var title = ""
        var overview = ""
        var posterImage: UIImage? = nil
    }
}


