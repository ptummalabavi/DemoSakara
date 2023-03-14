//
//  ViewModel.swift
//  DemoSakara
//
//  Created by Prashanth reddy on 3/14/23.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func populateListView()
}

final class ViewModel {
    
    weak var delegate: ViewModelDelegate?
    let urlSession = URLSession.shared
    private(set) var shipsModel: StarShipsModel?
    
    func processSwapAPIRequest() {
        let dataTask = urlSession.dataTask(with: URL(string: "https://swapi.dev/api/starships")!) {[weak self] data, urlResponse, error in
            
            if error == nil {
                
                if let reponseData = data {
                    let result = try? JSONDecoder().decode(StarShipsModel.self, from: reponseData)
                    self?.shipsModel = result
                    self?.delegate?.populateListView()
                }
                
            }
            
        }
        
        dataTask.resume()
    }

}
