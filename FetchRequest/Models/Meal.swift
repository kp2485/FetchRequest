//
//  Meal.swift
//  FetchRequest
//
//  Created by Kyle Peterson on 5/1/23.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Identifiable, Decodable, Equatable {
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case imageLocation = "strMealThumb"
    }
    
    let id: String
    let name: String
    let imageLocation: String
    
}
