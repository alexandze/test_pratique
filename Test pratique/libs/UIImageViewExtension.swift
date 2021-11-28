//
//  UIImageViewExtension.swift
//  Test pratique
//
//  Created by Alexandre Andze Kande on 2021-11-28.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = Util.resizeImageWithDefaultDimension(image)
                    }
                    
                    return
                }
                
                DispatchQueue.main.async {
                    self?.image = Util.getDefaultImage()
                }
            }
        }
    }
}
