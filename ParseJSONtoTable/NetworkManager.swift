//
//  NetworkManager.swift
//  ParseJSONtoTable
//
//  Created by ashraf on 01/11/2022.
//

import Foundation

protocol NetworkDelegate {
    func parseDataToTable (data: [JSON])
}

class NetworkManager {
    
    var delegate: NetworkDelegate!
    
    func fetchJSON () {
        let url = URL(string: "https://jsonplaceholder.typicode.com/comments")!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataArray = try! JSONDecoder().decode([JSON].self, from: data)
                self.delegate.parseDataToTable (data: dataArray)
            }
        }
        task.resume()
    }
    
}
