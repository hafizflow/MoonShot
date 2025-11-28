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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
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
                        .padding(.bottom, 4)
                    }
                }
                .padding([.horizontal, .bottom])
                .animation(.easeInOut, value: viewStyle)
            }
            .background(.darkBackground)
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
            .toolbar {
                Button("Toggle View", systemImage: "switch.2") {
                    viewStyle.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
