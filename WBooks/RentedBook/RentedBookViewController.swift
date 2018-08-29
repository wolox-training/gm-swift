//
//  RentedBookController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 29/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore

class RentedBookViewController: UIViewController {
    
    internal let bookView: BookView = BookView.loadFromNib()!
    internal let viewModel: BookViewModel
    public let book: Book
    
    private static let imagePlaceholder = "image_placeholder"
    private static let userPlaceholder = "user_placeholder"
    private static let cellId = "book_view_cell_id"
    private static let collectionCellId = "SuggestionCell"
    
    init(book: Book, viewModel: BookViewModel) {
        self.book = book
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
        bookView.tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: RentedBookViewController.cellId)
        
        bookView.suggestionContainer.suggestionCollection.delegate = self
        bookView.suggestionContainer.suggestionCollection.dataSource = self
        bookView.suggestionContainer.suggestionCollection.register(UINib(nibName: RentedBookViewController.collectionCellId, bundle: nil), forCellWithReuseIdentifier: RentedBookViewController.collectionCellId)
        
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle()
    }
    
}


// MARK: - Private
private extension RentedBookViewController {
    
    private static let statusBarTitle = "BOOK DETAILS"
    
    func setupView() {
        setNavigationBar()
        setButtons()
        setBookDetails()
        setSuggestionCollection()
    }
    
    func setNavigationBar() {
        navigationItem.title = RentedBookViewController.statusBarTitle
    }
    
    func setBookDetails() {
        bookView.detailsView.photo.image = UIImage(named: RentedBookViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            bookView.detailsView.photo.load(url: url)
        }
        
        bookView.detailsView.title.text = book.title
        bookView.detailsView.author.text = book.author
        bookView.detailsView.genre.text = book.genre
        bookView.detailsView.year.text = book.year
    }
    
    func setButtons() {
        bookView.detailsView.firstButton.setTitle("ADD A COMMENT", for: .normal)
        bookView.detailsView.secondButton.setTitle("RETURN BOOK", for: .normal)
    }
    
    func setSuggestionCollection() {
        bookView.suggestionContainer.isHidden = false
    }
    
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension RentedBookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private static let rentalListMaxSize = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.bookSuggestions.value.count
        return min(count, RentedBookViewController.rentalListMaxSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RentedBookViewController.collectionCellId, for: indexPath) as! SuggestionCell
        let book: Book = viewModel.bookSuggestions.value[indexPath.row]
        
        cell.bookPhoto.image = UIImage(named: RentedBookViewController.imagePlaceholder)
        
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
extension RentedBookViewController: UICollectionViewDelegateFlowLayout {
    
    private static let bookPhotoSize = (width: 55, height: 78)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding = collectionView.frame.size.width / 60
        let cellHeightPadding: CGFloat = 0
        return UIEdgeInsets(top: cellHeightPadding, left: cellWidthPadding, bottom: cellHeightPadding, right: cellWidthPadding)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: RentedBookViewController.bookPhotoSize.width, height: RentedBookViewController.bookPhotoSize.height)
    }
    
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension RentedBookViewController: UITableViewDataSource, UITableViewDelegate {
    
    private static let commentListMaxSize = 5
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = viewModel.comments.value.count
        return min(count, RentedBookViewController.commentListMaxSize)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RentedBookViewController.cellId) as! CommentCell
        let commentList = viewModel.comments.value
        let comment = commentList[commentList.count - indexPath.row - 1]
        let user = comment.user
        
        cell.username.text = "\(user.firstName) \(user.lastName)"
        cell.commentContent.text = comment.content
        cell.userPhoto.image = UIImage(named: RentedBookViewController.userPlaceholder)
        
        if let url = user.imageURL {
            cell.userPhoto.load(url: url)
        }
        
        return cell
    }
    
}


// MARK: - Bindings
internal extension RentedBookViewController {
    
    func setupBindings() {
        viewModel.bookSuggestions.producer.startWithValues { [unowned self] _ in
            self.bookView.suggestionContainer.suggestionCollection.reloadData()
        }
        
        viewModel.comments.producer.startWithValues { [unowned self] _ in
            self.bookView.tableView.reloadData()
        }
    }
    
}
