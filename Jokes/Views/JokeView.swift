//
//  JokeView.swift
//  Jokes
//
//  Created by Oliver Finlayson on 2023-04-14.
//

import SwiftUI

struct JokeView: View {
    
    //MARK: Stored Properties
    @State var punchlineOpacity = 0.0
    
    @State var currentJoke: Joke?
    
    //MARK: Computed Properties
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                Spacer()
              
                if let currentJoke = currentJoke {
                    
                    Text(currentJoke.setup)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Button (action: {
                        withAnimation(.easeIn(duration: 1.0)){
                            punchlineOpacity = 1.0
                        }
                    }, label: {
                        Image (systemName: "arrow.down.circle.fill")
                            .resizable ()
                            .scaledToFit ()
                            .frame (width: 40)
                            .tint (.black)
                        
                    })
                    Text (currentJoke.punchline)
                        .font (.title)
                        .multilineTextAlignment (.center)
                        .opacity(punchlineOpacity)
                    
                } else {
                   
                    ProgressView()
                    
                }
               
                Spacer()
                
                Button(action: {
                    // Reset the interface
                    punchlineOpacity = 0.0

                    Task {
                        // Get another joke
                        withAnimation {
                            currentJoke = nil
                        }
                        currentJoke = await NetworkService.fetch()
                    }
                }, label: {
                    Text("Fetch another one")
                })
                .disabled(punchlineOpacity == 0.0 ? true : false)
                .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("Random Jokes")
            
        }
        .task{
            currentJoke = await NetworkService.fetch()
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
