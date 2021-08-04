//
//  DetailProtocols.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//  
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: DetailPresenterProtocol? { get set }
    func setLabelArtist(withData: ArtistURL.items)
    func presenterPushDataView(receivedData: AlbumsURL)

    
}

protocol DetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createDetailModule(with data: ArtistURL.items) -> UIViewController
}

protocol DetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorInputProtocol? { get set }
    var wireFrame: DetailWireFrameProtocol? { get set }
    var datoURLrecibido : ArtistURL.items? {get set}
    func viewDidLoad()
    func searchAlbums(receivedData: String)
}

protocol DetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(receiverData: AlbumsURL)
}

protocol DetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: DetailInteractorOutputProtocol? { get set }
    var localDatamanager: DetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol? { get set }
    func interactorGetData(receivedData: String)
    
}

protocol DetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol DetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol? { get set }
    func externalGetData(receivedData: String)
}

protocol DetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func RemoteDataManagerCallbackData(with categoty: AlbumsURL) 
}

protocol DetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
