//
//  Models.swift
//  App-Store-Clone
//
//  Created by Mac Gallagher on 3/10/18.
//  Copyright © 2018 Mac Gallagher. All rights reserved.
//

import UIKit

struct FeaturedApps: Decodable {
    let bannerCategory: AppCategory
    let categories: [AppCategory]
}

struct AppCategory: Decodable {
    var name: String?
    var apps: [App]?
}

struct App: Decodable {
    let id: Int?
    let name: String?
    let category: String?
    let imageName: String?
    let price: Double?
    let screenshots: [String]?
    let desc: String?
    let appInformation: [[String:String]]?
    
    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case category = "Category"
        case imageName = "ImageName"
        case price = "Price"
        case screenshots = "Screenshots"
        case desc = "description"
        case appInformation = "appInformation"
    }
}
