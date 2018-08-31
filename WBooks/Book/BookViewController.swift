//
//  BookViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 15/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore


class BookViewController: UIViewController {
    
    internal let bookView: BookView = BookView.loadFromNib()!
    internal let viewModel: BookViewModel
    
    private static let statusBarTitle = "BOOK DETAIL"
    private static let imagePlaceholder = "image_placeholder"
    private static let userPlaceholder = "user_placeholder"
    private static let cellId = "book_view_cell_id"
    private static let collectionCellId = "SuggestionCell"
    
    
    init(viewModel: BookViewModel) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = bookView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        bookView.tableView.delegate = self
        bookView.tableView.dataSource = self
        bookView.tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: BookViewController.cellId)
        
        bookView.suggestionContainer.suggestionCollection.delegate = self
        bookView.suggestionContainer.suggestionCollection.dataSource = self
        bookView.suggestionContainer.suggestionCollection.register(UINib(nibName: BookViewController.collectionCellId, bundle: nil),
                                                                   forCellWithReuseIdentifier: BookViewController.collectionCellId)
        
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle()
    }
    
    
    internal func setupView() {
        setNavigationBar()
        setButtons()
        setBookDetails()
        setSuggestionCollection()
    }
    
    internal func setNavigationBar() {
        navigationItem.title = BookViewController.statusBarTitle
    }
    
    internal func setBookDetails() {
        bookView.detailsView.photo.image = UIImage(named: BookViewController.imagePlaceholder)
        
        let book = viewModel.book
        if let url = book.imageURL {
            bookView.detailsView.photo.load(url: url)
        }
        
        bookView.detailsView.title.text = book.title
        bookView.detailsView.author.text = book.author
        bookView.detailsView.genre.text = book.genre
        bookView.detailsView.year.text = book.year
    }
    
    internal func setButtons() {
        bookView.detailsView.firstButton.setTitle("ADD TO WISHLIST", for: .normal)
        bookView.detailsView.secondButton.setTitle("RENT", for: .normal)
    }
    
    internal func setSuggestionCollection() {
        bookView.suggestionContainer.isHidden = true
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private static let rentalListMaxSize = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.bookSuggestions.value.count
        return min(count, BookViewController.rentalListMaxSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookViewController.collectionCellId, for: indexPath) as! SuggestionCell
        let book: Book = viewModel.bookSuggestions.value[indexPath.row]
        
        cell.bookPhoto.image = UIImage(named: BookViewController.imagePlaceholder)
        
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
extension BookViewController: UICollectionViewDelegateFlowLayout {
    
    private static let bookPhotoSize = (width: 52, height: 70)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding = collectionView.frame.size.width / 60
        let cellHeightPadding: CGFloat = 0
        return UIEdgeInsets(top: cellHeightPadding, left: cellWidthPadding, bottom: cellHeightPadding, right: cellWidthPadding)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: BookViewController.bookPhotoSize.width, height: BookViewController.bookPhotoSize.height)
    }
    
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension BookViewController: UITableViewDataSource, UITableViewDelegate {
    
    private static let commentListMaxSize = 5
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.comments.value.count
        return min(count, BookViewController.commentListMaxSize)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookViewController.cellId) as! CommentCell
        let commentList = viewModel.comments.value
        let comment = commentList[commentList.count - indexPath.row - 1]
        let user = comment.user
        
        cell.username.text = "\(user.firstName) \(user.lastName)"
        cell.commentContent.text = comment.content
        cell.userPhoto.image = UIImage(named: BookViewController.userPlaceholder)
        
        if let url = user.imageURL {
            cell.userPhoto.load(url: url)
        }
        
        return cell
    }
 
}


// MARK: - Bindings
private extension BookViewController {
    
    func setupBindings() {
        viewModel.bookSuggestions.producer.startWithValues { [unowned self] _ in
            self.bookView.suggestionContainer.suggestionCollection.reloadData()
        }
        
        viewModel.comments.producer.startWithValues { [unowned self] _ in
            self.bookView.tableView.reloadData()
        }
    }
    
}
