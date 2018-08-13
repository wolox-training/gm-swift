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
    private let cellId = "cellReuseIdentifier"
    private let imagePlaceholder = "image_placeholder"
    private var libraryData: [Book] = []
    
    override func loadView() {
        view = libraryView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        libraryData = LibraryViewModel().getBooks()
        
        libraryView.tableView.delegate = self
        libraryView.tableView.dataSource = self
        
        libraryView.tableView.register(UINib(nibName: "LibraryCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
}

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! LibraryCell
        let book: Book = libraryData[indexPath.row]
        
        cell.libraryTitle?.text = book.title
        cell.libraryAuthor?.text = book.author
        cell.libraryPhoto?.image = UIImage(named: imagePlaceholder)
        
        if let urlPath = book.getImageUrl() {
            let url = URL(string: urlPath)!
            cell.libraryPhoto?.load(url: url)
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
