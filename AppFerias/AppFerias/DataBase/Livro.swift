//
//  Livro.swift
//  AppFerias
//
//  Created by Nathalia Melare on 24/07/19.
//  Copyright © 2019 Nathalia Melare. All rights reserved.
//

import Foundation
import UIKit

struct Book: Codable {
    var title:String?
    var authors:[String]?
    var printType:String? //Diz se é Book ou magazine
    var publishedDate:String?
    var description:String?
    var pageCount:Int?
    var language:String?
    var id:String?
    var link:URL?
    var thumbnail:URL? //imagem
}

extension UIImageView {
    public func imageFromServerURL(urlString: String, completion: @escaping (String?, Error?) -> Void) {
        self.image = nil
        let urlStringNew = urlString.replacingOccurrences(of: " ", with: "%20")
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error as Any)
                completion(nil, error)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
//                if ((self.animationImages) != nil) {
//                    self.animationImages?.removeAll()
//                }
                self.image = image
                completion("1", nil)
            })
            
        }).resume()
    }
}

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
}
