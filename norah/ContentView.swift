import SwiftUI

struct ContentView: View {
    
    let name: String = "norah"
    let age: Int = 24
    let rawBio: String = "I'm interested in marketing and coding, I enjoy collecting books, exploring new ideas and learning new skills"
    var isAvailable: Bool = true
    
    @State private var bio: String = ""
    @State private var isEditing: Bool = false
    @State private var draftBio: String = ""
    
    func validateBio(_ bio: String) -> String {
        let cleaned = bio.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleaned.isEmpty {
            return "no bio"
        }
        return cleaned
    }
    
    var body: some View {
        List {
            
            VStack {
                Text("\(name), \(age)")
                    .font(.title2)
                    .fontWeight(.bold)
                
                if isAvailable {
                    Image(._1041316745139677463)
                        .resizable()
                        .frame(width: 120, height: 120)
                    Text("available")
                } else {
                    Image(systemName: "circle")
                    Text("unavailable")
                }
            }
            
            Section(header: Text("About")) {
                if isEditing {
                    TextField("Write your bio", text: $draftBio, axis: .vertical)
                    
                    Button("Save") {
                        bio = validateBio(draftBio)
                        isEditing = false
                    }
                } else {
                    Text(bio)
                    
                    Button("Edit Bio") {
                        draftBio = bio == "no bio" ? "" : bio
                        isEditing = true
                    }
                }
            }
        }
        .onAppear {
            bio = validateBio(rawBio)
        }
    }
}

#Preview {
    ContentView()
}
