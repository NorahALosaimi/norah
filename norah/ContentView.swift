import SwiftUI

struct ContentView: View {
    
    let name: String = "norah"
    let age: Int = 24
    let rawBio: String = "I'm interested in marketing and coding, I enjoy collecting books, exploring new ideas and learning new skills"
    var isAvailable: Bool = true
    
    @State private var bio: String = ""
    @State private var isEditing: Bool = false
    @State private var draftBio: String = ""
    
    @State private var skills: [String] = ["Marketing", "Swift", "Reading"]
    
    func validateBio(_ bio: String) -> String {
        let cleaned = bio.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleaned.isEmpty {
            return "no bio"
        }
        return cleaned
    }
    
    var body: some View {
        NavigationStack {
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
                        .buttonStyle(.borderless)
                    } else {
                        Text(bio)
                        
                        Button("Edit Bio") {
                            draftBio = bio == "no bio" ? "" : bio
                            isEditing = true
                        }
                        .buttonStyle(.borderless)
                    }
                }
                
                Section {
                    NavigationLink("Skills") {
                        SkillsView(skills: $skills)
                    }
                }
            }
            .navigationTitle("Profile")
            .onAppear {
                bio = validateBio(rawBio)
            }
        }
    }
}

// الصفحة الثانية: كل المهارات + إضافة
struct SkillsView: View {
    
    @Binding var skills: [String]
    @State private var newSkill: String = ""
    
    func addSkill() {
        let cleaned = newSkill.trimmingCharacters(in: .whitespacesAndNewlines)
        if cleaned.isEmpty || skills.contains(cleaned) {
            return
        }
        skills.append(cleaned)
        newSkill = ""
    }
    
    var body: some View {
        List {
            Section(header: Text("Add a skill")) {
                HStack {
                    TextField("Enter a skill", text: $newSkill)
                    
                    Button("Add") {
                        addSkill()
                    }
                    .buttonStyle(.borderless)
                }
            }
            
            Section(header: Text("All Skills")) {
                ForEach(skills, id: \.self) { skill in
                    Text(skill)
                }
                .onDelete { offsets in
                    skills.remove(atOffsets: offsets)
                }
            }
        }
        .navigationTitle("Skills")
    }
}
