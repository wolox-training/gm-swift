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

class RentalsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let rentalsView: RentalsView = RentalsView.loadFromNib()!
    private let viewModel: RentalsViewModel
    
    private static let cellId = "SuggestionCell"
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
        
        rentalsView.suggestionCollectionView.delegate = self
        rentalsView.suggestionCollectionView.dataSource = self
        
        rentalsView.suggestionCollectionView.register(UINib(nibName: RentalsViewController.cellId, bundle: nil), forCellWithReuseIdentifier: RentalsViewController.cellId)
    }
    
    
}


internal extension RentalsViewController {
    
    private static let rentalListMaxSize = 5
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //let count = viewModel.comments.value.count
        //return min(count, RentalsViewController.rentalListMaxSize)
        return RentalsViewController.rentalListMaxSize
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RentalsViewController.cellId, for: indexPath) as! SuggestionCell
        //cell.imageView.image = UIImage(named: RentalsViewController.imagePlaceholder)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidthPadding = collectionView.frame.size.width / 60
        let cellHeightPadding: CGFloat = 0
        return UIEdgeInsets(top: cellHeightPadding, left: cellWidthPadding, bottom: cellHeightPadding, right: cellWidthPadding)
    }
 
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:55, height: 78)
    }
    
    
    
}
