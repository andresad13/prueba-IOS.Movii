//
//  DetailWireFrame.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//  
//

import Foundation
import UIKit

class DetailWireFrame: DetailWireFrameProtocol {
    
 
    

    static func createDetailModule(with data: ArtistURL.items) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "DetailView")
    if let view = viewController as? DetailView {
            let presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
            let interactor: DetailInteractorInputProtocol & DetailRemoteDataManagerOutputProtocol = DetailInteractor()
            let localDataManager: DetailLocalDataManagerInputProtocol = DetailLocalDataManager()
            let remoteDataManager: DetailRemoteDataManagerInputProtocol = DetailRemoteDataManager()
            let wireFrame: DetailWireFrameProtocol = DetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            presenter.datoURLrecibido = data
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailView", bundle: Bundle.main)
    }
    
    
}
