//
//  DinnerView.swift
//  Lotus
//
//  Created by Cara Lee on 2/4/22.
//

import SwiftUI

struct DinnerView: View {
        @State private var searchText = ""
        let links = [
                    "avocado and tomato salad": "https://www.delish.com/cooking/recipe-ideas/a19872947/avocado-tomato-salad-recipe/",
                    "chicken enchiladas": "https://ifoodreal.com/chicken-enchiladas/#recipe",
                    "feta pasta": "https://www.foodnetwork.com/recipes/food-network-kitchen/baked-feta-pasta-9867689",
                    "fettuccine alfredo": "https://www.foodnetwork.com/recipes/ree-drummond/fettuccine-alfredo-2109163",
                    "garlic butter salmon": "https://cafedelites.com/sheet-pan-garlic-butter-baked-salmon/#recipe",
                    "lasagna": "https://www.foodnetwork.com/recipes/easy-italian-sausage-lasagna-recipe-1961466",
                    "lemon garlic shrimp": "https://www.delish.com/cooking/recipe-ideas/recipes/a55657/easy-lemon-garlic-shrimp-recipe/",
                    "linguine with pesto": "https://www.foodnetwork.com/recipes/sunny-anderson/collard-green-pesto-linguine-recipe-1919556",
                    "zucchini noodles in tomato sauce": "https://www.eatwell101.com/zucchini-noodles-in-garlic-tomato-cream-sauce-recipe"
                    
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
                    .navigationTitle("Dinner")
                    
                }
                .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always))
            }
    }
