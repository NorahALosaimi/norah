import SwiftUI


struct ContentView: View {
    var body: some View {
        
        
        List{
            
            
            VStack{
                
                
                Image(._1041316745139677463)
                    .resizable()
                    .frame(width: 120,height: 120)
                
                Text("Norah,\(25)")
                    .font(.title2)
                    .fontWeight(.bold)
                
            }
            
                
                Section{
                    
                    
                    Text("I'm interested in maekiting and coding ,I enjoy collecting books,exploring new ideas and greaning new skills")
                }
            header:{ Text("About")
                
            }
            }
            
            
        }

    }


#Preview {
    ContentView()
    
}
