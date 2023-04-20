//
//  Date.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 10/04/23.
//

import Foundation

extension Date {
  
    func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "US")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
