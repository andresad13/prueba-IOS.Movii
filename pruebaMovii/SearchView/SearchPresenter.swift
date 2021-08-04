//
//  SearchPresenter.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 1/08/21.
//  
//

import Foundation

class SearchPresenter  {
    
    // MARK: Properties
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorInputProtocol?
    var wireFrame: SearchWireFrameProtocol?
    
}

extension SearchPresenter: SearchPresenterProtocol {
    // TODO: implement presenter methods
    
    func showDetailView(with data: ArtistURL.items) {
        wireFrame?.presentViewNewDetail(from: view!, withData: data)
    }
    func viewDidLoad() {
        print("test presenter")
        
    }
    
    func searchArtist(receivedData: String){
        interactor?.interactorGetData(receivedData: receivedData)
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    
    func interactorPushDataPresenter(receiverData: ArtistURL) {
        
        print(receiverData.artists.items[0].name)
        view?.presenterPushDataView(receivedData: receiverData)
}
}
