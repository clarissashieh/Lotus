//
//  LunchView.swift
//  Lotus
//
//  Created by Cara Lee on 1/28/22.
//

import SwiftUI

struct LunchView: View {
    @State private var searchText = ""
    let links = [
                "butternut squash soup": "https://cookieandkate.com/roasted-butternut-squash-soup/",
                "caesar salad": "https://www.foodnetwork.com/recipes/food-network-kitchen/caesar-salad-1957611",
                "chicken sandwich": "https://www.foodnetwork.com/recipes/claire-robinson/dads-chicken-sandwich-recipe-1949675",
                "cobb salad": "https://www.allrecipes.com/recipe/14415/cobb-salad/",
                "fish": "https://www.theendlessmeal.com/baked-fish/",
                "lentil soup": "https://downshiftology.com/recipes/very-best-lentil-soup/",
                "mediterranean salad": "https://downshiftology.com/recipes/mediterranean-chickpea-salad/",
                "sloppy joes": "https://www.foodnetwork.com/recipes/rachael-ray/super-sloppy-joes-recipe-1953228",
                "tomato soup": "https://www.foodnetwork.com/recipes/ina-garten/easy-tomato-soup-grilled-cheese-croutons-recipe-2109038",
                "tuna salad": "https://www.culinaryhill.com/classic-tuna-salad-sandwich/"
                
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
                .navigationTitle("Lunch")
                
            }
            .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always))
        }
}
