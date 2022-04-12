//
//  myCollectionViewController.swift
//  Hometask 2
//
//  Created by Anton Lebedev on 06.11.2021.
//

import UIKit


class myCollectionViewController: UICollectionViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var photoCategory = ("Trip1","Trip2","Trip3")
    //This below var is necessary for large images scrolling
    var selectedImage: UIImage!
    
    var arrayOfPhotos = ["Lara-photo-1","Lara-photo-2", "Lara-photo-3", "Lara-photo-4", "Lara-photo-5", "Lara-photo-6", "Lara-photo-7", "Lara-photo-8", "Lara-photo-9", "Lara-photo-10", "Lara-photo-11", "Lara-photo-12", "Lara-photo-13", "Lara-photo-14", "Lara-photo-15", "Lara-photo-16", "Lara-photo-17",
        "Lara-photo-18", "Lara-photo-19", "Lara-photo-20", "Lara-photo-21"]
    
    struct Storyboard {
        static let photoCell = "photoCollectionViewCell"
        //Below is the referense to segue from image grid to
        //full-scale image
        static let showDetailVCSegue = "showImageDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView.backgroundColor = .systemPink
            
            myCollectionView.dataSource = self
            //DataSource - это объект, из которого таблица будет брать информацию
            //В данном случае источником информации будет сам класс ViewController
            myCollectionView.delegate = self
            //Delegate определяет, кто будет обрабатывать не информацию, а события
            //В данном случае на эту обработку мы поставили также ViewController
        
        //The below line adds custom transition
        //in NavigationController, via
        //TransitionAnimator and TransitionCoordinator
        navigationController?.addCustomTransitioning()
      
    }

//    extension myCollectionViewController: UICollectionViewDelegate {
//
//    }


//    extension myCollectionViewController: UICollectionViewDataSource {
        
        override func numberOfSections(in collectionView: UICollectionView) -> Int {
            1
        }
        
       override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPhotos.count
        }
        
       override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.photoCell, for: indexPath) as! PhotoCollectionViewCell
        let imageName = arrayOfPhotos[indexPath.row]
       
        cell.imageName = imageName
        
        return cell
        }
    
    //This function is responsible for showing large images
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Now we select the image to magnify
        selectedImage = UIImage(named: arrayOfPhotos[indexPath.item])
        //When we perform the segue
        performSegue(withIdentifier: Storyboard.showDetailVCSegue, sender: nil)
    }
    //This function navigates the large images
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showDetailVCSegue {
            let detailVC = segue.destination as! LargeImageViewComtroller
            detailVC.image = selectedImage
        }
    }
    
   
}

