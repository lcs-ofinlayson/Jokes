//
//  FavouritesView.swift
//  Jokes
//
//  Created by Oliver Finlayson on 2023-04-19.
//

import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    //MARK: Stored Properties
    
    @BlackbirdLiveModels({ db in try await Joke.read(from: db)
        }) var favoriteJokes
    
    //MARK: Computer Properties
    var body: some View {
      
        NavigationView {
            List(favoriteJokes.results) {
                currentJoke in VStack(alignment: .leading)
                {
                    Text(currentJoke.setup)
                        .bold()
                    Text(currentJoke.punchline)
                }
                }
            .navigationTitle("Favorites")
        }
    
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    //Makes the database available to this view in Xcode previews
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
