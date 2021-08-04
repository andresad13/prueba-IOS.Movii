//
//  SearchView.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 1/08/21.
//  
//

import Foundation
import UIKit

class SearchView: UIViewController, UISearchBarDelegate  {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableArtist: UITableView!
    
    var artsts: ArtistURL.Artist?
    var presenter: SearchPresenterProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        
       
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchArtist(receivedData: searchBar.text!)
    }
}

extension SearchView: SearchViewProtocol {
    func presenterPushDataView(receivedData: ArtistURL) {
        print(receivedData)
        artsts = receivedData.artists
        DispatchQueue.main.async {
            self.tableArtist.reloadData()
        }
    }
    
    // TODO: implement view output methods
}


extension SearchView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artsts?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = artsts?.items[indexPath.row].name
        
        if ((artsts?.items[indexPath.row].images.count)! > 0){
        cell.imageView?.imageFromServerURL(urlString: artsts?.items[indexPath.row].images[0].url ?? "")
        }
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.showDetailView(with: (artsts?.items[indexPath.row])!)
    }
    
    
    
}
extension SearchView: UITableViewDelegate{
    
}
extension UIImageView {
public func imageFromServerURL(urlString: String) {
    self.image = nil
    let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
    URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in

        if error != nil {
            print(error as Any)
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
        })

    }).resume()
}}
