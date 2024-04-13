//
//  ContentView.swift
//  FoodRecipe
//
//  Created by PavunRaj on 12/04/24.
//

import SwiftUI
import URLImage
struct HomePageView: View {
    @StateObject var recipeViewModel = RecipeViewModel()
    var body: some View {
        
        NavigationStack {
            
            TabView {
                List {
                    ForEach(recipeViewModel.recipe) { recipe in
                        
                        HStack(alignment:.top,spacing:10) {
                            
                            ZStack(alignment: .topLeading) {
                                ItemImgView(recipe: recipe)
                                AddBtnView()
                            }
                            MenuItemDetail(recipe: recipe)
                            
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "frying.pan.fill")
                    Text("Food")
                    
                }
                
                ProfilePage()
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                        
                    }
            }
            .accentColor(.black)
            
            
            .navigationTitle("Recommended (\(recipeViewModel.recipe.count))")
            .navigationBarTitleDisplayMode(.automatic)
            
        }
        .navigationBarHidden(false)
        
        .onAppear {
            recipeViewModel.APIRequest()
            
        }
        
        
    }
    
}

#Preview {
    HomePageView()
    
}

