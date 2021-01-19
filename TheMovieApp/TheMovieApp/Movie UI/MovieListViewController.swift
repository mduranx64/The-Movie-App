//
//  MovieListViewController.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 17-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import UIKit

public protocol MovieListViewControllerDelegate {
    func didRequestMovieList()
}

public class MovieListViewController: UIViewController {

    private var collectionView: UICollectionView?
    private var dataSource: MovieListDataSource
    private var delegate: MovieListViewControllerDelegate
    
    public init(dataSource: MovieListDataSource, delegate: MovieListViewControllerDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView = UICollectionView.makeMovieCollectionView(frame: self.view.frame)
        self.collectionView?.dataSource = dataSource
        self.collectionView?.delegate = self
        self.view = collectionView
        delegate.didRequestMovieList()
    }
}

extension MovieListViewController: UICollectionViewDelegate {

    
}

extension MovieListViewController: MovieListView {
    public func display(_ viewModel: MovieListViewModel) {
        dataSource.update(viewModel.movies)
        collectionView?.reloadData()
    }
}

extension UICollectionView {
    static func makeMovieCollectionView(frame: CGRect) -> UICollectionView {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let cellHeight: CGFloat = 234, marginSpace: CGFloat = 13
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: (frame.width / 2) - marginSpace, height: cellHeight)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.registerCell(withClass: MovieCell.self)
        return collectionView
    }
}

