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
    private lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 20))
    private var searchActive: Bool = false
    private var filteredBooks = [Book]()
    
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
        setupView()
        
        libraryView.tableView.delegate = self
        libraryView.tableView.dataSource = self
        libraryView.tableView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellReuseIdentifier: LibraryViewController.cellId)
        
        searchBar.delegate = self
        
        setupBindings()
    }
    
}


// MARK: - Private
private extension LibraryViewController {
    
    func setupView() {
        setSearchBar()
        showSearchButton()
        hideSearchBar()
    }
    
    func setSearchBar() {
        searchBar.placeholder = "Search books"
        searchBar.showsCancelButton = true
    }
    
    @objc func searchClicked(sender: Any) {
        showSearchBar()
        hideSearchButton()
    }
    
    func showSearchBar() {
        let barItem = UIBarButtonItem(customView: searchBar)
        tabBarController?.navigationItem.leftBarButtonItem = barItem
        searchBar.becomeFirstResponder()
    }
    
    func hideSearchBar() {
        tabBarController?.navigationItem.leftBarButtonItem = nil
    }
    
    func showSearchButton() {
        let searchButtonItem = UIBarButtonItem(image: UIImage(named: "ic_search"), style: .plain, target: self, action: #selector(searchClicked(sender:)))
        tabBarController?.navigationItem.rightBarButtonItem = searchButtonItem
    }
    
    func hideSearchButton() {
        tabBarController?.navigationItem.rightBarButtonItem = nil
    }
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filteredBooks.count
        } else {
            return viewModel.books.value.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryViewController.cellId) as! LibraryCell
        
        let book = getBook(index: indexPath.row)
        
        cell.libraryPhoto?.image = UIImage(named: LibraryViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            cell.libraryPhoto?.load(url: url)
        }
        
        cell.libraryTitle?.text = book.title
        cell.libraryAuthor?.text = book.author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = getBook(index: indexPath.row)
        let bookViewModel: BookViewModel = viewModel.createBookViewModel(book: book)
        let bookViewController = BookViewController(book: book, viewModel: bookViewModel)
        navigationController?.pushViewController(bookViewController, animated: true)
    }
    
    func getBook(index: Int) -> Book {
        if (searchActive) {
            return filteredBooks[index]
        } else {
            return viewModel.books.value[index]
        }
    }
}


extension LibraryViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.searchBar(searchBar, textDidChange: searchBar.text!)
        searchBar.endEditing(true)
        searchActive = false;
        hideSearchBar()
        showSearchButton()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchbar => textDidChange => \(searchText)")
        
        filteredBooks = viewModel.books.value.filter({ (book: Book) -> Bool in
            return book.title.lowercased().contains(searchText.lowercased()) ||
                book.author.lowercased().contains(searchText.lowercased())
        })
        
        searchActive = searchText.isNotEmpty
        libraryView.tableView.reloadData()
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
