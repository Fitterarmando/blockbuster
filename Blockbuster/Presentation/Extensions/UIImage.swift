//
//  UIImage.swift
//  Blockbuster
//
//  Created by Juan Armando Frías Ramírez on 16/03/23.
//

import UIKit

extension UIImageView {
    func load(url: String?, completion: @escaping () -> Void = {}) {
        if let stringUrl = url, !stringUrl.isEmpty, let url = URL(string: stringUrl) {
            DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            completion()
                        }
                    }
                }
            }
        }
    }
}
