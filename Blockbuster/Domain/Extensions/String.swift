//
//  String.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 10/04/23.
//

import Foundation

extension String {
    
    func toDate(format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
    func format(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss'Z'", outputFormat : String = "dd MMM yyyy") -> String? {
        return self.toDate(format: inputFormat)?.toString(format: outputFormat)
    }
    
}
