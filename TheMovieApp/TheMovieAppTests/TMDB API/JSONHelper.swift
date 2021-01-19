//
//  JSONHelper.swift
//  TheMovieApp
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

public enum JSONHelper {

    public static func loadData(withFile fileName: String, inBundle bundle: Bundle) -> Data? {
        if let url = bundle.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                debugPrint(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
}
