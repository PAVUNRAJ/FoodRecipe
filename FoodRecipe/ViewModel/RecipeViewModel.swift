//
//  RecipeViewModel.swift
//  FoodRecipe
//
//  Created by PavunRaj on 12/04/24.
//

import Foundation
import SwiftUI
import Combine

final class RecipeViewModel:ObservableObject {
    
    @Published var recipe: [Recipe] = []
    private var cancellable: AnyCancellable?
    
    private let networkManager = NetworkManager() // Create an instance of NetworkManager
    
    internal func APIRequest() {
        cancellable = networkManager.fetchRecipeData(url: URL(string: "\(URLPath.baseURL.rawValue)\(URLPath.endPoint.rawValue)")!, response: OrderResponse.self)
            .map { (orderResponse: OrderResponse) -> [Recipe] in
                return orderResponse.recipes ?? []
            }
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink { [weak self] receivedRecipes in
                self?.recipe = receivedRecipes
            }
        
    }
    
}
