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
            switch response?.textEncodingName {
            case "iso-8859-1":
                debugPrint("The encoding is not supported. Workaround is necessary.")
                var t: T?
                if let jsonString = String(data: data, encoding: .isoLatin1),
                    let utf8String = jsonString.cString(using: .utf8),
                    let str = String(utf8String: utf8String),
                    let data = str.data(using: .utf8) {
                    t = try? JSONDecoder().decode(T.self, from: data)
                }
                completionHandler(t, response, nil)
            default:
                let t = try? JSONDecoder().decode(T.self, from: data)
                if t == nil {
                    debugPrint("Expecting UTF-8 or other data supported by JSONDecoder. `\(response?.textEncodingName ?? "")` encoding is not supported")
                }
                completionHandler(t, response, nil)
            }
           
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
