import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var columns: [GridItem] {
        if viewStyle {
            return [GridItem(.adaptive(minimum: 150), spacing: 12)]
        } else {
            return [GridItem(.flexible())]
        }
    }
    
    @AppStorage("viewStyle") var viewStyle: Bool = true
    
    @State private var pathstore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathstore.path) {
            ZStack(alignment: .topLeading) {
                HorizontalButtons()
                
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { mission in
                            NavigationLink(value: mission) {
                                if viewStyle {
                                    VStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 100)
                                            .padding()
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.headline)
                                                .fontDesign(.rounded)
                                                .foregroundStyle(.white)
                                            
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .fontDesign(.rounded)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity)
                                        .background(.lightBackground)
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    )
                                } else {
                                    HStack {
                                        Image(mission.image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 120, height: 120)
                                            .padding()
                                        
                                        VStack {
                                            Text(mission.displayName)
                                                .font(.title3.bold())
                                                .fontDesign(.rounded)
                                                .foregroundStyle(.white)
                                            
                                            Text(mission.formattedLaunchDate)
                                                .font(.caption)
                                                .fontDesign(.rounded)
                                                .foregroundStyle(.white.opacity(0.5))
                                        }
                                        .padding(.vertical)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .background(.lightBackground)
                                    }
                                    .clipShape(.rect(cornerRadius: 10))
                                    .overlay (
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.lightBackground)
                                    )
                                }
                            }
                            .padding([.bottom,.top], 4)
                        }
                    }
                    .padding([.horizontal, .bottom])
                    .padding(.top, 58)
                    .animation(.easeInOut, value: viewStyle)
                }
            }
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Toggle View", systemImage: "switch.2") {
                    viewStyle.toggle()
                }
            }
            .toolbarTitleDisplayMode(.inlineLarge)
        }
    }
}

#Preview {
    ContentView()
}


struct HorizontalButtons: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button("Hello"){}.buttonStyle(.glass)
                Button("Swift"){}.buttonStyle(.glass)
                Button("SwiftUI"){}.buttonStyle(.glass)
                Button("UIKit"){}.buttonStyle(.glass)
                Button("Objective-C"){}.buttonStyle(.glass)
            }
            .padding(.horizontal)
            .padding(.bottom, 120)
        }
        .zIndex(999)
    }
}
