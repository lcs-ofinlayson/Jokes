//
//  JokesApp.swift
//  Jokes
//
//  Created by Oliver Finlayson on 2023-04-14.
//

import SwiftUI

@main
struct JokesApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                JokeView()
                    .tabItem {
                        Label("Fresh", systemImage: "carrot")
                    }
                FavouritesView()
                    .tabItem {
                    }
                Label("Favourites", systemImage: "face.smiling")
            }
            // Make the database available to all child views through the environment
            .environment (\.blackbirdDatabase, AppDatabase.instance)
            
        }
    }
}
