//
//  Utilities.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//

import Foundation

//Date Conversion
extension Int {
    func getDateString() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}
