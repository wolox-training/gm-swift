//
//  WishlistViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class WishlistViewController: UIViewController {
    
    // MARK: Properties
    private let wishlistView: WishlistView = WishlistView.loadFromNib()!
    private let viewModel: WishlistViewModel
    
    private static let collectionCellId = "SuggestionCell"
    private static let cellId = "wishlist_view_cell_id"
    private static let imagePlaceholder = "image_placeholder"
    
    
    init(viewModel: WishlistViewModel = WishlistViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = wishlistView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishlistView.tableView.delegate = self
        wishlistView.tableView.dataSource = self
        wishlistView.tableView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellReuseIdentifier: WishlistViewController.cellId)
        
        wishlistView.suggestionContainer.suggestionCollection.delegate = self
        wishlistView.suggestionContainer.suggestionCollection.dataSource = self
        wishlistView.suggestionContainer.suggestionCollection.register(UINib(nibName: WishlistViewController.collectionCellId, bundle: nil),
                                                                       forCellWithReuseIdentifier: WishlistViewController.collectionCellId)
        
        
        setupBindings()
    }
    
}



// MARK: - UITableViewDataSource & UITableViewDelegate
extension WishlistViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.wishes.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishlistViewController.cellId) as! LibraryCell
        let wish: Wish = viewModel.wishes.value[indexPath.row]
        let book: Book = wish.book
        
        cell.libraryPhoto?.image = UIImage(named: WishlistViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            cell.libraryPhoto?.load(url: url)
        }
        
        cell.libraryTitle?.text = book.title
        cell.libraryAuthor?.text = book.author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wish: Wish = viewModel.wishes.value[indexPath.row]
        let book: Book = wish.book
        let wishedBookViewModel: WishedBookViewModel = viewModel.createWishedBookViewModel(book: book)
        let wishedBookViewController = WishedBookViewController(book: book, viewModel: wishedBookViewModel)
        navigationController?.pushViewController(wishedBookViewController, animated: true)
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension WishlistViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private static let suggestionListMaxSize = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.bookSuggestions.value.count
        return min(count, WishlistViewController.suggestionListMaxSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishlistViewController.collectionCellId, for: indexPath) as! SuggestionCell
        let book: Book = viewModel.bookSuggestions.value[indexPath.row]
        
        cell.bookPhoto.image = UIImage(named: WishlistViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            cell.bookPhoto.load(url: url)
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension WishlistViewController: UICollectionViewDelegateFlowLayout {
    
    private static let bookPhotoSize = (width: 55, height: 78)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding = collectionView.frame.size.width / 60
        let cellHeightPadding: CGFloat = 0
        return UIEdgeInsets(top: cellHeightPadding, left: cellWidthPadding, bottom: cellHeightPadding, right: cellWidthPadding)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: WishlistViewController.bookPhotoSize.width, height: WishlistViewController.bookPhotoSize.height)
    }
    
}



// MARK: - Bindings
private extension WishlistViewController {
    
    func setupBindings() {
        viewModel.wishes.producer.startWithValues { [unowned self] _ in
            self.wishlistView.tableView.reloadData()
        }
        
        viewModel.bookSuggestions.producer.startWithValues { [unowned self] _ in
            self.wishlistView.suggestionContainer.suggestionCollection.reloadData()
        }
    }
    
}
