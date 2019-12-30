//
//  ServiceManager.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//

import Foundation

class ServiceManager {
    
    //MARK: - Story
    //Fetching Story details
    static func getStory(id: Int, completion: @escaping (Story)-> Void) {
        
        let urlStr = URL.init(string: Constants.baseUrl + "item/\(id).json")!
        let url = URL(string: urlStr.absoluteString)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard error == nil else {
                print("returning error")
                return
            }
            guard let content = data else {
                print("not returning data")
                return
            }
            
            let decoder = JSONDecoder()
            let story = try! decoder.decode(Story.self, from: content)
            DispatchQueue.main.async {
                completion(story)
            }
        }
        task.resume()
    }
    
    //MARK: - Stories List
    //Fetching Stories list from service
    static func getStoriesList(topStoriesurl: String, completion :@escaping ([Int]) -> Void){
        
        let url = URL(string: topStoriesurl)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard error == nil else {
                print("returning error")
                return
            }
            guard let content = data else {
                print("not returning data")
                return
            }
            
            let decoder = JSONDecoder()
            let storiesList = try! decoder.decode([Int].self, from: content)
            DispatchQueue.main.async {
                completion(storiesList)
            }
        }
        task.resume()
    }
}

