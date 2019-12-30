//
//  StoryViewModel.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//

import Foundation

//ViewModel
struct StoryViewModel {
    
    let by: String
    let score: Int
    let title, time: String
    let url: String?
    
    //Dependency Injection
    init(story: Story) {
        self.by = story.by ?? "N/A"
        self.score = story.score ?? 0
        self.time = story.time?.getDateString() ?? ""
        self.title = story.title ?? "N/A"
        self.url = story.url
    }
}
