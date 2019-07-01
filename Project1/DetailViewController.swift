//
//  DetailViewController.swift
//  Project1
//
//  Created by Faisal Ikwal on 03/06/19.
//  Copyright © 2019 Exilant Technologies. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image  = UIImage(named: imageToLoad)
        }
    }

    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
}
