//
//  TopStoriesViewController.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//

import UIKit

class TopStoriesViewController: UIViewController {
    //Tableview outlet
    @IBOutlet weak private var storiesTable: UITableView!
    private var topStoriesList = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Stories"
        storiesTable.register(UINib(nibName: "StoryTableViewCell", bundle: nil), forCellReuseIdentifier: "StoryTableViewCell")
        getTopStories()
    }
}

//MARK: - Tableview Delegate & Datasource methods
extension TopStoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topStoriesList.count >= 20 ? 20 : topStoriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as! StoryTableViewCell
        cell.id = topStoriesList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) as? StoryTableViewCell {
            cell.didSelect(indexPath: indexPath) { [weak self] (url) in
                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                let detailsVC = storyboard.instantiateViewController(withIdentifier: "StoryDetailsViewController") as! StoryDetailsViewController
                detailsVC.storyURL = url
                self?.navigationController?.pushViewController(detailsVC, animated: true)
            }
        }
    }
}

//MARK: - TopStories
//Fetching TopStories
extension TopStoriesViewController {
    
    private func getTopStories() {
        ServiceManager.getStoriesList(topStoriesurl: Constants.baseUrl + "topstories.json") { [weak self] (result) in
            self?.topStoriesList = result
            DispatchQueue.main.async {
            self?.storiesTable.reloadData()
            }
        }
    }
}


