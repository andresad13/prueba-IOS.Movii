//
//  DetailView.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//  
//

import Foundation
import UIKit

class DetailView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDragDelegate, UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let provider = NSItemProvider(object: artistImage as! NSItemProviderWriting)

          let dragItem = UIDragItem(itemProvider: provider)
          return [dragItem]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! AlbumViewCell
        
        cell.albumTitle.text = albums[indexPath.row]?.name
        cell.albumImg.imageFromServerURL(urlString: (albums[indexPath.row]?.images[0].url)!)

        
        return cell
    }
    

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistPopularity: UIProgressView!
    @IBOutlet weak var albumsCollection: UICollectionView!
    // MARK: Properties
    var presenter: DetailPresenterProtocol?
    var albums: [AlbumsURL.Items?] = []

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        albumsCollection.dragDelegate = self
        albumsCollection.dropDelegate = self
        presenter?.viewDidLoad()

    }
    
    
}



extension DetailView: DetailViewProtocol {
    func presenterPushDataView(receivedData: AlbumsURL) {
        self.albums = receivedData.items
        DispatchQueue.main.async {
            self.albumsCollection.reloadData()
        }

    }
    
    // TODO: implement view output methods
    
    func setLabelArtist(withData data: ArtistURL.items) {
        artistLabel.text = data.name
        artistImage.imageFromServerURL(urlString: data.images[0].url)
        let popularity = (Float(data.popularity) / 100)
        artistPopularity.setProgress(Float(popularity), animated: true)
    }
}
