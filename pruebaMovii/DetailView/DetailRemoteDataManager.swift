//
//  DetailRemoteDataManager.swift
//  pruebaMovii
//
//  Created by Leonel Alfonso on 4/08/21.
//  
//

import Foundation

class DetailRemoteDataManager:DetailRemoteDataManagerInputProtocol {
    var remoteRequestHandler: DetailRemoteDataManagerOutputProtocol?
    
    func externalGetData(receivedData: String) {
        
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: "https://api.spotify.com/v1/artists/\(receivedData)/albums")!)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-fprm-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")
        request.setValue("Bearer BQCHgWSMndTjQlD3-7w2TaZ9KpIcNN5RuzEc9K2t4bY-IZWCBM6IZ9F6qOp6S_ryM5kLQopZVZ-hOhrTPJgAV8hAJmGWmRXvg66vmW99ThSG4LP_NaGeXoc9qcFPlUZgnK9VbCEZx35Aec7nAlBSn1l6rhFz1cUazXkNAk8NVOwL", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: request){(data, response, error) in
        
        guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {
            print("error en llamado \(error!)")
            return
        }
        if respuesta.statusCode == 200 {
            print("traigo \(String(describing: data.hashValue))")

            do{
                let decoder = JSONDecoder()
                let getURL = try decoder.decode(AlbumsURL.self, from: data)
                print(getURL)
                self.remoteRequestHandler?.RemoteDataManagerCallbackData(with: getURL.self)
            }catch{
                print("nose logro parsear")
            }
            
        }else{
            print("ocurio un error")
        }
        
        
    }.resume()
    }

        
        
    }
    
    
 
