//
//  RentalsViewController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 22/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class RentalsViewController: UIViewController {
    
    private let rentalsView: RentalsView = RentalsView.loadFromNib()!
    private let viewModel: RentalsViewModel
    
    private static let collectionCellId = "SuggestionCell"
    private static let tableCellId = "rentalsTableCell"
    private static let imagePlaceholder = "image_placeholder"
    
    init(viewModel: RentalsViewModel = RentalsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rentalsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rentalsView.rentsTableView.delegate = self
        rentalsView.rentsTableView.dataSource = self
        rentalsView.rentsTableView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellReuseIdentifier: RentalsViewController.tableCellId)
        
        rentalsView.suggestionContainer.suggestionCollection.delegate = self
        rentalsView.suggestionContainer.suggestionCollection.dataSource = self
        rentalsView.suggestionContainer.suggestionCollection.register(UINib(nibName: RentalsViewController.collectionCellId, bundle: nil),
                                                                      forCellWithReuseIdentifier: RentalsViewController.collectionCellId)
        
        setupBindings()
    }
    
    
}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension RentalsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rents.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RentalsViewController.tableCellId) as! LibraryCell
        let rent: Rent = viewModel.rents.value[indexPath.row]
        
        cell.libraryPhoto?.image = UIImage(named: RentalsViewController.imagePlaceholder)
        
        if let url = rent.book.imageURL {
            cell.libraryPhoto?.load(url: url)
        }
        
        cell.libraryTitle?.text = rent.book.title
        cell.libraryAuthor?.text = rent.book.author
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rent: Rent = viewModel.rents.value[indexPath.row]
        let book: Book = rent.book
        let rentedBookViewModel: RentedBookViewModel = viewModel.createRentedBookViewModel(book: book)
        let rentedBookViewController = RentedBookViewController(book: book, viewModel: rentedBookViewModel)
        navigationController?.pushViewController(rentedBookViewController, animated: true)
    }
    
}



// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension RentalsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private static let suggestionListMaxSize = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = viewModel.bookSuggestions.value.count
        return min(count, RentalsViewController.suggestionListMaxSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RentalsViewController.collectionCellId, for: indexPath) as! SuggestionCell
        let book: Book = viewModel.bookSuggestions.value[indexPath.row]
        
        cell.bookPhoto.image = UIImage(named: RentalsViewController.imagePlaceholder)
        
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
extension RentalsViewController: UICollectionViewDelegateFlowLayout {
    
    private static let bookPhotoSize = (width: 55, height: 78)
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding = collectionView.frame.size.width / 60
        let cellHeightPadding: CGFloat = 0
        return UIEdgeInsets(top: cellHeightPadding, left: cellWidthPadding, bottom: cellHeightPadding, right: cellWidthPadding)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: RentalsViewController.bookPhotoSize.width, height: RentalsViewController.bookPhotoSize.height)
    }
    
}

// MARK: - Bindings
private extension RentalsViewController {
    
    func setupBindings() {
        viewModel.bookSuggestions.producer.startWithValues { [unowned self] _ in
            self.rentalsView.suggestionContainer.suggestionCollection.reloadData()
        }
        
        viewModel.rents.producer.startWithValues { [unowned self] _ in
            self.rentalsView.rentsTableView.reloadData()
        }
    }
    
}
