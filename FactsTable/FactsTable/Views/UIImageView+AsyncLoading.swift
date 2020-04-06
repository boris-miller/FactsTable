//
//  UIImageView+AsyncLoading.swift
//  FactsTable
//
//  Created by Boris Miller on 6/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedTask(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) -> URLSessionDataTask {
        contentMode = mode
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }
        task.resume()
        return task
    }

    func downloadedTask(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) -> URLSessionDataTask? {
        guard let url = URL(string: link) else { return nil }
        return downloadedTask(from: url, contentMode: mode)
    }
}
