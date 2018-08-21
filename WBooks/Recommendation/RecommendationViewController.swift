//
//  RecommendationController.swift
//  WBooks
//
//  Created by Gabriel Leandro Mazzei on 21/8/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift
import WolmoCore


class RecommendationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private let recommendationView: RecommendationView = RecommendationView.loadFromNib()!
    private let viewModel: RecommendationViewModel
    var imagePicker = UIImagePickerController()
    
    
    init(viewModel: RecommendationViewModel = RecommendationViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: .none, bundle: .none)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = recommendationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
}


private extension RecommendationViewController {
    
    func setupView() {
        recommendationView.imagePickerButton.addTarget(self, action: #selector(imagePickerClicked(sender:)), for: .touchUpInside)
    }
    
    @objc func imagePickerClicked(sender : UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}

internal extension RecommendationViewController {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            recommendationView.bookPhoto.image = image
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}


