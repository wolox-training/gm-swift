//
//  LibraryViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 13/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class LibraryViewController: UIViewController {
    
    // MARK: Properties
    private let libraryView: LibraryView = LibraryView.loadFromNib()!
    private let viewModel: LibraryViewModel
    
    private static let cellId = "library_view_cell_id"
    private static let imagePlaceholder = "image_placeholder"

    init(viewModel: LibraryViewModel = LibraryViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = libraryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        libraryView.tableView.delegate = self
        libraryView.tableView.dataSource = self
        
        libraryView.tableView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellReuseIdentifier: LibraryViewController.cellId)
        
        setupBindings()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate
extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryViewController.cellId) as! LibraryCell
        let book: Book = viewModel.books.value[indexPath.row]
        
        cell.libraryPhoto?.image = UIImage(named: LibraryViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            cell.libraryPhoto?.load(url: url)
        }
        
        cell.libraryTitle?.text = book.title
        cell.libraryAuthor?.text = book.author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book: Book = viewModel.books.value[indexPath.row]
        let bookViewModel: BookViewModel = viewModel.createBookViewModel(book: book)
        let bookViewController = BookViewController(book: book, viewModel: bookViewModel)
        navigationController?.pushViewController(bookViewController, animated: true)
    }
    
}

// MARK: - Bindings
private extension LibraryViewController {
    
    func setupBindings() {
        viewModel.books.producer.startWithValues { [unowned self] _ in
            self.libraryView.tableView.reloadData()
        }
    }
    
}
