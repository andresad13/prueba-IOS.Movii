//
//  SearchInteractor.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 1/08/21.
//  
//

import Foundation

class SearchInteractor: SearchInteractorInputProtocol {
    func interactorGetData(receivedData : String) {
        remoteDatamanager?.externalGetData(receivedData: receivedData)
    }
    

    // MARK: Properties
    weak var presenter: SearchInteractorOutputProtocol?
    var localDatamanager: SearchLocalDataManagerInputProtocol?
    var remoteDatamanager: SearchRemoteDataManagerInputProtocol?
    
}

extension SearchInteractor: SearchRemoteDataManagerOutputProtocol {
 
    
    func RemoteDataManagerCallbackData(with category: ArtistURL) {
        
        print(category.artists.items)
        presenter?.interactorPushDataPresenter(receiverData: category)
        
    }}
