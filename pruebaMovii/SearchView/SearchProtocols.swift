//
//  SearchProtocols.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 1/08/21.
//  
//

import Foundation
import UIKit

protocol SearchViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SearchPresenterProtocol? { get set }
    func presenterPushDataView(receivedData: ArtistURL)
}

protocol SearchWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSearchModule() -> UIViewController
    func presentViewNewDetail(from view: SearchViewProtocol, withData: ArtistURL.items)

}

protocol SearchPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorInputProtocol? { get set }
    var wireFrame: SearchWireFrameProtocol? { get set }
    func showDetailView(with data: ArtistURL.items)
    func viewDidLoad()
    func searchArtist(receivedData: String)
}

protocol SearchInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func interactorPushDataPresenter(receiverData: ArtistURL)
}

protocol SearchInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SearchInteractorOutputProtocol? { get set }
    var localDatamanager: SearchLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SearchRemoteDataManagerInputProtocol? { get set }
    func interactorGetData(receivedData: String)
}

protocol SearchDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol SearchRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SearchRemoteDataManagerOutputProtocol? { get set }
    func externalGetData(receivedData: String)

}

protocol SearchRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func RemoteDataManagerCallbackData(with categoty: ArtistURL) 
}

protocol SearchLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
