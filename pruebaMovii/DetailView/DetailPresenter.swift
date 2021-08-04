//
//  DetailPresenter.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//  
//

import Foundation

class DetailPresenter  {
    
    // MARK: Properties
    weak var view: DetailViewProtocol?
    var interactor: DetailInteractorInputProtocol?
    var wireFrame: DetailWireFrameProtocol?
    var datoURLrecibido: ArtistURL.items?
    
}

extension DetailPresenter: DetailPresenterProtocol {

    
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.setLabelArtist(withData: (datoURLrecibido)!)
        searchAlbums(receivedData: datoURLrecibido!.id )
        
        
    }
    func searchAlbums(receivedData: String){
        interactor?.interactorGetData(receivedData: receivedData)
    }
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func interactorPushDataPresenter(receiverData: AlbumsURL) {
        view?.presenterPushDataView(receivedData: receiverData)
    }
    
    // TODO: implement interactor output methods
}
