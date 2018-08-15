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
    
    private let libraryView: LibraryView = LibraryView.loadFromNib()!
    private let viewModel = LibraryViewModel()
    private let bookViewController = BookViewController()
    private static let cellId = "cellReuseIdentifier"
    private static let imagePlaceholder = "image_placeholder"
    
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

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LibraryViewController.cellId) as! LibraryCell
        let book: Book = viewModel.books.value[indexPath.row]
        
        
        
        cell.libraryTitle?.text = book.title
        cell.libraryAuthor?.text = book.author
        cell.libraryPhoto?.image = UIImage(named: LibraryViewController.imagePlaceholder)
        
        if let url = book.imageURL {
            cell.libraryPhoto?.load(url: url)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book: Book = viewModel.books.value[indexPath.row]
        bookViewController.book = book
        self.navigationController?.pushViewController(bookViewController, animated: true)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

// MARK: - Private
private extension LibraryViewController {
    
    func setupBindings() {
        viewModel.books.producer.startWithValues { _ in
            self.libraryView.tableView.reloadData()
        }
    }
    
}

private extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
