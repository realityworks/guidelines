//
//  UIImageView+Extensions.swift
//  guidelines
//
//  Created by Piotr Suwara on 12/5/20.
//  Copyright © 2020 Realityworks. All rights reserved.
//

import UIKit


extension UIImageView {
    private func alphaFadeIn() {
        alpha = 0
        UIView.animate(withDuration: 0.4) { [weak self] in
            self?.alpha = 1
        }
    }
    
    func update(with url: URL?) {
        guard let url = url else {
            image = nil
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200,
                error == nil,
                let data = data,
                let image = UIImage(data: data) else {
                    self?.image = nil
                    print ("Error: \(error?.localizedDescription ?? "UnknownError")")
                    return
            }
            
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}
