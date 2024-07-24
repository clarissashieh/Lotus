//
//  SnackView.swift
//  Lotus
//
//  Created by Cara Lee on 2/4/22.
//

import SwiftUI

struct SnackView: View {
    @State private var searchText = ""
    let links = [
            "banana nut muffins": "https://www.foodnetwork.com/recipes/tyler-florence/banana-nut-muffins-recipe-1915828",
            "blueberry muffins": "https://www.foodnetwork.com/recipes/alton-brown/blueberry-muffins-recipe-1941521",
            "blueberry smoothie": "https://www.dinneratthezoo.com/blueberry-smoothie/",
            "granola": "https://www.loveandlemons.com/granola/",
            "guacamole": "https://www.allrecipes.com/recipe/14231/guacamole/",
            "hummus": "https://www.foodnetwork.com/recipes/hummus-3592531",
            "kale chips": "https://www.allrecipes.com/recipe/176957/baked-kale-chips/",
            "roasted cashews": "https://thetoastedpinenut.com/sweet-sesame-roasted-cashews/#tasty-recipes-15769",
            "strawberry banana smoothie": "https://downshiftology.com/recipes/strawberry-banana-smoothie/",

                ]
    
    var foods : Array<String>
        
    init() {
        self.foods = links.keys.map({$0})
    }

    var body: some View {
            List {
                
                ForEach(searchText == "" ? foods: self.foods.filter{ $0.lowercased().hasPrefix(searchText.lowercased()) }, id: \.self) { food in
                    Link(destination: URL(string: links[food]!)!) {
                        Image(food)
                            .resizable()
                            .scaledToFit()
                    }
                }
                .navigationTitle("Snack")
                
            }
            .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always))
        }
}

