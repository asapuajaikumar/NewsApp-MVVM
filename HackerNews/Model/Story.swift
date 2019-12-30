//
//  Story.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//

import Foundation

// MARK: - Story Model
struct Story: Codable {
    let by: String?
    let descendants, id: Int?
    let kids: [Int]?
    let score, time: Int?
    let title, type: String?
    let url: String?
}
