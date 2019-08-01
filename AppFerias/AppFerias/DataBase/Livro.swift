//
//  Livro.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

struct Books: Codable {
    var title:String?
    var authors:[String]?
    var publishedDate:String?
    var description:String?
    var pageCount:String?
    var language:String?
    var image:String? //imagem
}

class Intern : NSObject {
    static func getAllBooks() -> [Books] {
        var allBooks: [Books] = []
        do {
            if let path = Bundle.main.path(forResource: "DataBase", ofType: ".json", inDirectory: nil) {
                let url = URL(fileURLWithPath: path)
                let BooksData = try Data(contentsOf: url)
                allBooks = try JSONDecoder().decode([Books].self, from: BooksData)
                return allBooks
            }
        } catch {
            print("Erro")
        }
        return allBooks
    }
}
