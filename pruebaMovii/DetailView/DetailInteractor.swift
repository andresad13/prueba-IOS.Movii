//
//  DetailInteractor.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//  
//

import Foundation

class DetailInteractor: DetailInteractorInputProtocol {
    func interactorGetData(receivedData: String) {
        remoteDatamanager?.externalGetData(receivedData: receivedData)

    }
    

    // MARK: Properties
    weak var presenter: DetailInteractorOutputProtocol?
    var localDatamanager: DetailLocalDataManagerInputProtocol?
    var remoteDatamanager: DetailRemoteDataManagerInputProtocol?

}

extension DetailInteractor: DetailRemoteDataManagerOutputProtocol {
    func RemoteDataManagerCallbackData(with categoty: AlbumsURL) {
        print(categoty.items)
        presenter?.interactorPushDataPresenter(receiverData: categoty)
    }
    
    // TODO: Implement use case methods
}
