//
//  NetworkManager.swift
//  FoodRecipe
//
//  Created by PavunRaj on 12/04/24.
//

import Foundation
import Combine



final class NetworkManager {
 
    func fetchRecipeData<T>(url: URL, response:T.Type) -> some Publisher<T, Error>  where T:Decodable   {
        
        return URLSession
            .shared
            .dataTaskPublisher(for:url)
            .map(\.data)
            .decode(type: response.self, decoder: jsonDecoder)
            .eraseToAnyPublisher()

    }
    
}
