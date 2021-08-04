//
//  SearchWireFrame.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 1/08/21.
//  
//

import Foundation
import UIKit

class SearchWireFrame: SearchWireFrameProtocol {

    class func createSearchModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        if let view = navController.children.first as? SearchView {
            let presenter: SearchPresenterProtocol & SearchInteractorOutputProtocol = SearchPresenter()
            let interactor: SearchInteractorInputProtocol & SearchRemoteDataManagerOutputProtocol = SearchInteractor()
            let localDataManager: SearchLocalDataManagerInputProtocol = SearchLocalDataManager()
            let remoteDataManager: SearchRemoteDataManagerInputProtocol = SearchRemoteDataManager()
            let wireFrame: SearchWireFrameProtocol = SearchWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SearchView", bundle: Bundle.main)
    }
    
    func presentViewNewDetail(from view: SearchViewProtocol, withData: ArtistURL.items) {
          

        let newDetailView = DetailWireFrame.createDetailModule(with: withData)
        
        if  let newView = view as?  UIViewController{
            newView.navigationController?.pushViewController(newDetailView, animated: true)
            
        }
            
        
    }

            
        
    
    
}
