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
    
    private let bookView: BookView = BookView.loadFromNib()!
    public let book: Book
    private let viewModel: BookViewModel
    
    private static let imagePlaceholder = "image_placeholder"
    private static let userPlaceholder = "user_placeholder"
    private static let cellId = "book_view_cell_id"
    
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
        
        bookView.tableView.register(UINib(nibName: "CommentCell", bundle: nil), forCellReuseIdentifier: BookViewController.cellId)
        
        setupBindings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarStyle()
    }
    
}

//MARK: - Private
private extension BookViewController {
    
    private static let statusBarTitle = "ADD NEW BOOK"
    
    func setupView() {
        navigationItem.title = BookViewController.statusBarTitle
        bookView.bookPhoto.image = UIImage(named: BookViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            bookView.bookPhoto.load(url: url)
        }
        
        bookView.bookTitle.text = book.title
        bookView.bookAuthor.text = book.author
        bookView.bookGenre.text = book.genre
        bookView.bookYear.text = book.year
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
        viewModel.comments.producer.startWithValues { [unowned self] _ in
            self.bookView.tableView.reloadData()
        }
    }
    
}
