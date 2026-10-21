//
//  ContentView 2.swift
//  norah
//
//  Created by Reema on 10/05/1448 AH.
//


import SwiftUI


struct ContentView2: View {
    var body: some View {
        
        
        List{
            
            
            VStack{
                
                
                Image(._841117667939903581)
                    .resizable()
                    .frame(width: 150,height: 150)
                
                Text("Reema,\(24)")
                    .font(.title2)
                    .fontWeight(.bold)
                
            }
            
                
                Section{
                    
                    
                    Text("Im an artist and a tech person, i love painting and exploring new concepts of art, also new tech trends")
                }
            header:{ Text("About")
                
            }
            }
            
            
        }

    }


#Preview {
    ContentView()
    
}
