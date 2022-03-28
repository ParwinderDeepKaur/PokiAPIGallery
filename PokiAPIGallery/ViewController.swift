//
//  ViewController.swift
//  PokiAPIGallery
//
//  Created by Cambrian on 2022-03-21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colView: UICollectionView!
    
    var imagesArr = [UIImage]()
    
    var cellIdentifier = "PokeImageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCellInCollectionview()
        
        // Do any additional setup after loading the view.
        PokeAPIHelper.fetchAllImages { images in
            // empty array before appending images
            self.imagesArr = []
            // adding image arr getting from api into images arry decalared in class
            self.imagesArr.append(contentsOf: images)
            
            self.colView.reloadData()
        }
    }

    func registerCellInCollectionview()
    {
        // Register xib Poke Image Cell
        colView.register(UINib.init(nibName: cellIdentifier, bundle: Bundle.main), forCellWithReuseIdentifier: cellIdentifier)
    }

}


// view Controler extennsion with Collection view datasource and delegate
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    //number of all items that need to be displayed
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.imagesArr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PokeImageCell
        
        cell.imgView.image = self.imagesArr[indexPath.row]
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout
{
    //size of everty item in displayed
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.colView.frame.size.width, height: 150.0)
    }
}




