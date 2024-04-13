//
//  DataModel.swift
//  FoodRecipe
//
//  Created by PavunRaj on 12/04/24.
//

import Foundation



// MARK: -JSONDecoder


var jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
   
}()



// MARK: -OrderResponse
struct OrderResponse: Codable {
    let recipes: [Recipe]?
    let total, skip, limit: Int?
}

// MARK: - Recipe
struct Recipe: Codable, Identifiable {
    let id: Int?
    let name: String?
    let ingredients, instructions: [String]?
    let prepTimeMinutes, cookTimeMinutes, servings: Int?
    let difficulty: Difficulty?
    let cuisine: String?
    let caloriesPerServing: Int?
    let tags: [String]?
    let userID: Int?
    let image: String?
    let rating: Double?
    let reviewCount: Int?
    let mealType: [String]?
    var imageURL: URL? {
        image.map { URL(string: "\($0)")! }
    }



    enum CodingKeys: String, CodingKey {
        case id, name, ingredients, instructions, prepTimeMinutes, cookTimeMinutes, servings, difficulty, cuisine, caloriesPerServing, tags
        case userID = "userId"
        case image, rating, reviewCount, mealType
    }
}

enum Difficulty: String, Codable {
    case easy = "Easy"
    case medium = "Medium"
}



