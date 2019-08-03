//
//  LivroHandler.swift
//  AppFerias
//
//  Created by Nathalia Melare on 01/08/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

enum TaskLoadResponse: Error {
    case success(books: [Books])
    case error(description: String)
}

class LivroHandler {
    static func fetchFromWeb(_ pesquisa:String, completion: @escaping (TaskLoadResponse) -> Void) {
        //Server Em Producao
        let serverURL = "https://booksgoglee.herokuapp.com"
        //Server Em Desenvolvimento
        //let serverURL = "http://192.168.1.58:3000"
        
        //tira os espacos e coloca tracos
        let pesquisaFormatada = pesquisa.replace(string: " ", replacement: "-")
        
        let BASE_URL:String = "\(serverURL)/books/search/\(pesquisaFormatada)"
        
        guard let url = URL(string: BASE_URL) else {
            completion(TaskLoadResponse.error(description: "URL não inicializada"))
            return;
        }
        
        //Faz a chamada no Servidor
        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) -> Void in
            guard error == nil, let jsonData = data else {
                completion(TaskLoadResponse.error(description: "Error to unwrapp data variable"))
                return
            }
            
            if let books = try? JSONDecoder().decode([Books].self, from: jsonData) {
                completion(TaskLoadResponse.success(books: books))
            } else {
                completion(TaskLoadResponse.error(description: "Error to convert data to [Task]"))
            }
        }).resume()
    }
}
