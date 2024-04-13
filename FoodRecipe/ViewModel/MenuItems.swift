//
//  MenuItems.swift
//  FoodRecipe
//
//  Created by PavunRaj on 12/04/24.
//

import Foundation
import SwiftUI

struct MenuItemDetail: View {
    var recipe:Recipe
    var body: some View {
        VStack(alignment:.leading,spacing: 5) {
            Text(recipe.name ?? "")
                .fontWeight(.bold)
                .lineLimit(2)
            Text(recipe.cuisine ?? "" )
                .fontWeight(.semibold)
            
            HStack(alignment:.top,spacing: 5) {
                Image(systemName: "star.fill")
                    .foregroundColor(.green)
                Text(String(recipe.rating ?? 0.0))
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text("(\(String(recipe.reviewCount ?? 0)))")
                    .fontWeight(.light)
                
            }
            
            Text("Size: \(recipe.difficulty?.rawValue ?? "")")
            HStack(alignment:.top) {
                ForEach(recipe.mealType ?? [], id: \.self) { type in
                    Text(type)
                }
                
            }
            
        }
    }
}

struct AddBtnView: View {
    var body: some View {
        Button(action: {
            print("Button tapped")
        }) {
            
            Text("ADD")
                .fontWeight(.bold)
                .frame(width: 80,height: 30,alignment: .center)
                .foregroundColor(.green)
                .background(Color.white)
                .clipShape(Rectangle())
                .cornerRadius(5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 8)
                .offset(x: 5, y: 90)
        }
        .padding(.top, 5)
        .frame(minWidth: 100)
    }
}

struct ItemImgView: View {
    var recipe: Recipe
    var body: some View {
        AsyncImage(url: URL(string: recipe.image ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 8)
            
        } placeholder: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .padding()
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(10)
        }
        
        .frame(width: 110,height: 110)
    }
}
