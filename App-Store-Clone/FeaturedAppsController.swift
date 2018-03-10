//
//  ViewController.swift
//  App-Store-Clone
//
//  Created by Mac Gallagher on 3/9/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var appCategories: [AppCategory]?
    var bannerCategory: AppCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(CategoryCell.self, forCellWithReuseIdentifier: "cellId")
        
        fetchFeaturedApps { (featuredApps) in
            self.bannerCategory = featuredApps.bannerCategory
            self.appCategories = featuredApps.categories
            self.collectionView?.reloadData()
        }
        
    }

    func fetchFeaturedApps(completionHandler: @escaping (FeaturedApps) -> ()){
        let urlString = "https://api.letsbuildthatapp.com/appstore/featured"
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let featuredApps = try JSONDecoder().decode(FeaturedApps.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(featuredApps)
                }
            } catch let err{
                print(err)
            }
            
        }.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CategoryCell
        
        cell.appCategory = appCategories?[indexPath.item]
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = appCategories?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 230)
    }

}

