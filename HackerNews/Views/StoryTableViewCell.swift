//
//  StoryTableViewCell.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//


import UIKit

class StoryTableViewCell: UITableViewCell {
    
    // MARK: TableViewCell Outlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var authorLabel: UILabel!
    @IBOutlet weak private var scoreLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    
    var id: Int! {
        didSet { //Property Observer
            getStoryDetails(id)
        }
    }
    
    private var storyViewModel: StoryViewModel! {
        didSet {
            self.authorLabel.text = storyViewModel.by
            self.titleLabel.text = storyViewModel.title
            self.scoreLabel.text = "\(storyViewModel.score)"
            self.timeLabel.text = storyViewModel.time
        }
    }
    
    private func getStoryDetails(_ id: Int) {
        ServiceManager.getStory(id: id) { [weak self] (result) in
            self?.storyViewModel = StoryViewModel(story: result)
        }
    }
    
    func didSelect(indexPath: IndexPath, completion: @escaping (String)-> Void) {
        if let url = storyViewModel.url {
            completion(url)
        }
    }
}

