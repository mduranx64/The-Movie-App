//
//  Date+InitWithFormat.swift
//  TheMovieAppTests
//
//  Created by Miguel Duran on 19-01-21.
//  Copyright © 2021 mduranx64. All rights reserved.
//

import Foundation

extension Date {
    init(_ dateString: String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.calendar = Calendar(identifier: .iso8601)
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateStringFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval: 0, since:date)
    }
}
