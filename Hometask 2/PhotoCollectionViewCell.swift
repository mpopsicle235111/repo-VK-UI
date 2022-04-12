//
//  PhotoCollectionViewCell.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 30.11.2021.
// Based on: David Tran
//Build a photo grid with UICollectionView and UINavigationController
//https://youtu.be/YaOV834T8oo

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imageName: String! {
        didSet {
            photoImageView.image = UIImage (named: imageName)
        }
    }
}
