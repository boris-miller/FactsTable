//
//  URLSession+WelcomeTask.swift
//  FactsTable
//
//  Created by Boris Miller on 6/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import Foundation

extension URLSession {
    
    /// Returns `URLSessionDataTask` to retrieve and decode `Decodable` data from the endpoint
    /// - Parameters:
    ///   - url: Endpoint URL
    ///   - completionHandler: Calls when the task is complete
    fileprivate func codableDataTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    /// Returns `URLSessionDataTask` to retrieve `Welcome` data
    /// - Parameters:
    ///   - url: `Welcome` data endpoint
    ///   - completionHandler: Calls on complete providing either `Welcome` data or `Error`
    ///   and `URLResponse` (for instance to debug the response)
    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableDataTask(with: url, completionHandler: completionHandler)
    }

}
