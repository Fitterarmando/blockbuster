//
//  UIImage.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 16/03/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    func load(url: URL?, completion: @escaping () -> () = { }) {
        self.sd_setImage (with: url, placeholderImage: nil, options: [], completed: { (theImage, error, cache, url) in
            completion()
        })
    }
    
    func load(
        url: String?,
        completion: @escaping () -> () = { },
        contentMode: ContentMode = UIView.ContentMode.scaleAspectFill
    ) {
        self.contentMode = contentMode
        if let url = url, !url.isEmpty {
            self.sd_setImage (with: URL(string:url), placeholderImage: nil, options: [], completed: { (theImage, error, cache, url) in
                completion()
            })
        }
    }
}
