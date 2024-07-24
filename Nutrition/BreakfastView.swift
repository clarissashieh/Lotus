//
//  BreakfastView.swift
//  Lotus
//
//  Created by Cara Lee on 1/28/22.
//

import SwiftUI

struct BreakfastView: View {

    @State private var searchText = ""
    let links = [
                "acai bowl": "https://www.chelseasmessyapron.com/acai-bowl/",
                "avocado toast": "https://www.foodnetwork.com/recipes/food-network-kitchen/avocado-toasts-3364588",
                "banana bread": "https://www.simplyrecipes.com/recipes/banana_bread/",
                "chia seed pudding": "https://www.foodnetwork.com/recipes/giada-de-laurentiis/chia-seed-pudding-3362661",
                "french toast": "https://www.foodnetwork.com/recipes/robert-irvine/french-toast-recipe-1951408",
                "oatmeal": "https://www.foodnetwork.com/recipes/ina-garten/sunday-morning-oatmeal-recipe-2043129",
                "pancakes": "https://www.allrecipes.com/recipe/21014/good-old-fashioned-pancakes/",
                "scrambled eggs": "https://toriavey.com/how-to/how-to-make-scrambled-eggs/",
                "waffles": "https://www.spendwithpennies.com/fluffy-homemade-waffle-recipe/#wprm-recipe-container-169611"
                
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
            .navigationTitle("Breakfast")
            
        }
        .searchable(text: $searchText,
                placement: .navigationBarDrawer(displayMode: .always))
    }
}
