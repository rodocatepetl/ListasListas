import SwiftUI

// Diapositiva 1: Introducción a las Listas en SwiftUI
struct IntroListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Listas en SwiftUI")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Conceptos clave:")
                .font(.headline)
            
            Text("• Las listas son contenedores para mostrar una colección de datos de manera organizada.")
            Text("• Son comparables a UITableView en UIKit pero con una API más sencilla y declarativa.")
            Text("• Soportan interacciones como selección, eliminación y reordenamiento.")
        }
        .padding()
    }
}

// Diapositiva 2: Ejemplo de Lista Básica
struct BasicListView: View {
    
    var examples: [String] = [
        "Aira",
        "Aimee",
        "Lluis"
    ]
    
    var body: some View {
        VStack {
            Text("Ejemplo de Lista Básica")
                .font(.title)
            getList()
        }
    }
    
    func getList() -> some View {
        List(examples, id: \.self) { example in
            Text(example)
        }
    }
}

struct HorizontalBasicListView: View {
    
    var examples: [String] = [
        "Ejemplo 1",
        "Ejemplo 2",
        "Ejemplo 3"
    ]
    
    var body: some View {
        VStack {
            Text("Ejemplo de Lista Básica")
                .font(.title)
            
            horizontalExamplesList() // Llama a la función que devuelve la lista horizontal
        }
    }

    // Función que crea y devuelve la vista de la lista en horizontal
    func horizontalExamplesList() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(examples, id: \.self) { example in
                    Text(example)
                        .padding()
                        .frame(minWidth: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}


// Diapositiva 3: Por qué son importantes las Listas
struct ImportanceListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Importancia de las Listas")
                .font(.title)
            
            Text("• Permiten mostrar colecciones de datos de manera eficiente.")
            Text("• Son fundamentales para la creación de interfaces de usuario dinámicas.")
            Text("• Facilitan la implementación de patrones de diseño como MVC o MVVM.")
        }
        .padding()
    }
}

// Diapositiva 4: Ejemplo Avanzado con Playgrounds y Previews
struct AdvancedListView: View {
    var body: some View {
        VStack {
            Text("Ejemplo Avanzado")
                .font(.title)
            
            // Aquí puedes mostrar un ejemplo más avanzado, como una lista con elementos personalizados,
            // interacción con los datos, etc. Asegúrate de que sea un ejemplo que se pueda probar en un Playground.
            
            // Ejemplo de lista con datos dinámicos y vistas personalizadas
        }
    }
}

// Vista contenedora para navegar entre diapositivas
struct PresentationView: View {
    var body: some View {
        TabView {
            IntroListView()
                .tabItem {
                    Label("Introducción", systemImage: "list.bullet")
                }
            
            BasicListView()
                .tabItem {
                    Label("Básico", systemImage: "list.bullet.rectangle")
                }
            
            HorizontalBasicListView()
                .tabItem {
                    Label("Horizontal", systemImage: "list.bullet.rectangle")
                }
            
            ImportanceListView()
                .tabItem {
                    Label("Importancia", systemImage: "exclamationmark.circle")
                }
            
            AdvancedListView()
                .tabItem {
                    Label("Avanzado", systemImage: "list.bullet.indent")
                }
        }
    }
}

// Vista previa para SwiftUI Preview
struct PresentationView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
