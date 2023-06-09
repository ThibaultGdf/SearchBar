//
//  ContentView.swift
//  SearchBar
//
//  Created by Thibault GODEFROY on 06/06/2023.
//

import SwiftUI

// MARK: - SearchBarView
struct SearchBarView: View {

    // MARK: Properties
    let viewModel = SearchBarViewModel()

    @State private var searchText = "" 

    // MARK: Body
    var body: some View {

        NavigationStack {
            List {
                ForEach(countries, id: \.self) { country in
                    HStack {
                        Text(country.capitalized)
                    }.padding(8)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Countries")
        }
    }

    /**
     Permet d'ajouter le texte en minuscule pour faciliter la recherche de l'utilisateur.
     */
    var countries: [String] {
        let lowerCaseCountries = viewModel.countryRepository.countries.map { $0.name.lowercased()}

        return searchText == "" ? lowerCaseCountries : lowerCaseCountries.filter {
            $0.contains(searchText.lowercased())
        }
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
