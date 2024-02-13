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


struct StateAndDOMView: View {
    let similarities = [
        ("Representación del Estado", "Tanto @State en SwiftUI como el DOM representan el estado actual de la interfaz de usuario."),
        ("Actualización Reactiva", "Ambos responden de manera reactiva a cambios en el estado, actualizando automáticamente la interfaz de usuario."),
        ("Reconciliación", "Tanto SwiftUI como las bibliotecas modernas de JavaScript utilizan un proceso de reconciliación para determinar qué partes de la interfaz de usuario deben actualizarse en función de los cambios de estado."),
        ("Inmutabilidad", "Ambos promueven el uso de datos inmutables para gestionar el estado."),
        ("Actualización Eficiente", "Tanto SwiftUI como React emplean técnicas para realizar actualizaciones eficientes en la interfaz de usuario, minimizando la cantidad de manipulación del DOM o la representación de vistas necesaria para reflejar los cambios de estado."),
        ("Facilidad de Desarrollo", "Ambos proporcionan una forma declarativa de definir la interfaz de usuario, lo que facilita el desarrollo y el mantenimiento del código.")
    ]
    
    var body: some View {
        NavigationView {
            List(similarities, id: \.0) { similarity in
                VStack(alignment: .leading, spacing: 4) {
                    Text(similarity.0)
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text(similarity.1)
                        .font(.body)
                }
            }
            .navigationTitle("Similitudes entre @State y el DOM")
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
                    Label("Perros", systemImage: "list.bullet.indent")
                }
            
            StateAndDOMView().tabItem {
                Label("State", systemImage: "list.bullet.star")
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
