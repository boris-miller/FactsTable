//
//  Service.swift
//  FactsTable
//
//  Created by Boris Miller on 6/4/20.
//  Copyright © 2020 Boris Miller. All rights reserved.
//

import Foundation

struct Service {
    private static let endPointURL = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")
    
    private enum Constants {
        static let tableName = "FactsTable"
        static let unknownErrorLocalizedDescriptionKey = NSLocalizedString("unknownErrorLocalizedDescriptionKey", tableName: tableName, comment: "")
        static let invalidUrlLocalizedDescriptionKey = NSLocalizedString("invalidURLLocalizedDescriptionKey", tableName: tableName, comment: "")
    }

    private enum Errors {
        static let domain = "Service"
        static let unknownError = NSError(domain: domain, code: 1, userInfo: [NSLocalizedDescriptionKey: Constants.unknownErrorLocalizedDescriptionKey])
        static let invalidUrl = NSError(domain: domain, code: 2, userInfo: [NSLocalizedDescriptionKey: Constants.invalidUrlLocalizedDescriptionKey])
    }
    
    /// Retrieve `Welcome` data
    /// - Parameter completionHandler: Calls when the data task is complete
    func retrieve(completionHandler: @escaping (Welcome?, Error?) -> Void) {
        guard let url = Self.endPointURL
            else {
                completionHandler(nil, Errors.invalidUrl)
                return
        }
        let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
            if welcome == nil && error == nil {
                debugPrint("***Response: \(String(describing: response))")
                completionHandler(welcome, Errors.unknownError)
            } else {
                completionHandler(welcome, error)
            }
        }
        task.resume()
    }

}
