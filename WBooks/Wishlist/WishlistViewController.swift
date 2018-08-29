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
        // TODO: Implement 'didSelectRowAt'
        let wish: Wish = viewModel.wishes.value[indexPath.row]
        print("Wish selected! \(wish)")
    }
    
}

// MARK: - Bindings
private extension WishlistViewController {
    
    func setupBindings() {
        viewModel.wishes.producer.startWithValues { [unowned self] _ in
            self.wishlistView.tableView.reloadData()
        }
    }
    
}
