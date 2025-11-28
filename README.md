# 🚀 Moonshot  
An iOS app showcasing NASA's Apollo missions and the astronauts who traveled to the Moon.

---

## ✨ Features

- ✅ Browse all Apollo missions (1–17)  
- ✅ Toggle between **grid** and **list** layouts  
- ✅ Detailed mission information with launch dates  
- ✅ Astronaut biographies and photos  
- ✅ Horizontal crew member scroll view  
- ✅ Dark, space-themed UI  
- ✅ Persistent view preferences using `@AppStorage`  

---

## 🏗 Architecture

- **MVVM Pattern** – clean separation of data and UI  
- **SwiftUI** – modern declarative interface  
- **Protocol Extensions** – custom `Bundle` decoding helper  
- **AppStorage** – store user layout preferences  

---

## 🛠 Technologies Used

- **Swift 5.7+**  
- **SwiftUI**  
- **Codable** for JSON parsing  
- **LazyVGrid** for adaptive layouts  
- **NavigationStack**  
- **Custom DateFormatter**  

---

## 📦 Data Structure

### 👨‍🚀 Astronauts
- JSON containing biographies and astronaut IDs

### 🚀 Missions  
- Includes launch dates, crew information, and mission descriptions  
- Type-safe models with computed properties for linked data  

---

## ⚙️ Setup

1. Clone the repository  
2. Open **`MoonShot.xcodeproj`**  
3. Run on any device/simulator with **iOS 15.0+**  
4. No external dependencies required  

---

## 🔍 Code Highlights

- **`Bundle-Decodable.swift`** – Generic JSON decoder with strong error handling  
- **`Mission.swift`** – Contains nested `CrewRole` struct  
- **`ContentView.swift`** – Adaptive grid layout + view style toggle  
- **`MissionView.swift`** – Crew member mapping with Navigation  

---

## 📚 What I Learned

- JSON decoding with custom date formats  
- Building generic functions using protocol extensions  
- Creating adaptive grids with `LazyVGrid`  
- Using `NavigationStack` and deep linking  
- Persisting UI preferences with `@AppStorage`  
- Composing ScrollViews (vertical + horizontal)  
- Custom color themes using `ShapeStyle`  

---

## 🚧 Future Enhancements

- 🔍 Search functionality  
- ⭐ Favorite missions  
- 🕒 Mission timeline view  
- 📢 VoiceOver accessibility improvements  
- 💻 iPad-optimized UI  
- 🎥 Mission audio & video support  

---

## 📬 Contact

**Hafizur Rahman**  
📧 hafizur.rahman.cs@gmail.com  

_Data courtesy of NASA’s Apollo program._  
