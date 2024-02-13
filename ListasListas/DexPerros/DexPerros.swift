//
//  DexPerros.swift
//  ListasListas
//
//  Created by Rodolfo Castillo on 08/02/24.
//

import SwiftUI

struct Perro: Hashable {
    let name: String
    let owner: String
    let age: Int
    let details: String
    
    static func == (lhs: Perro, rhs: Perro) -> Bool {
        return lhs.name == rhs.name && lhs.owner == rhs.owner && lhs.age == rhs.age
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(owner)
        hasher.combine(age)
    }
}

struct AdvancedListView: View {
    
    /// `@State` es un tipo de propiedad en SwiftUI que se utiliza para almacenar el estado de una vista.
    /// Cuando el valor de una propiedad `@State` cambia, SwiftUI vuelve a representar la vista para reflejar ese cambio.
    ///
    /// Aquí hay algunas características clave de `@State`:
    ///
    /// 1. **Almacenamiento de estado:** `@State` se utiliza para almacenar valores que afectan la apariencia o el comportamiento de una vista.
    /// 2. **Propiedad envuelta:** `@State` es una propiedad envuelta que debe ser declarada con el prefijo `@State`.
    /// 3. **Modificación con Binding:** `@State` proporciona un `Binding` a su valor, lo que permite que la vista que lo utiliza modifique su estado.
    /// Esto significa que puede actualizar el valor de `@State` desde dentro de la vista.
    /// 4. **Reactividad automática:** Cuando el valor de una propiedad `@State` cambia, SwiftUI vuelve a representar automáticamente la vista que contiene esa propiedad para reflejar el cambio.
    ///
    /// En el ejemplo anterior, `@State` se utiliza para almacenar el texto ingresado en el campo de búsqueda (`searchText`).
    /// Cuando el usuario ingresa texto en el campo de búsqueda, el valor de `searchText` cambia y la vista se vuelve a representar automáticamente
    /// para filtrar la lista de perros por el nombre del dueño.

    @State private var searchText = ""
    
    let perrosConocidos: [Perro] = [
        Perro(name: "Rockett", owner: "Aimee", age: 12, details: "Enojón, peleonero, amoroso"),
        Perro(name: "Tessa", owner: "Aira", age: 7, details: "Loca, lobita, aulladora"),
        Perro(name: "Pomela", owner: "Aimee", age: 4, details: "Sin ojo, miedosa, corredora veloz"),
        Perro(name: "Rogelio", owner: "Rodo", age: 8, details: "Amoroso, llorón, vejiga pequeña"),
        Perro(name: "Nymeria", owner: "Khan", age: 9, details: "Grande, voz ronca"),
        Perro(name: "Tsume", owner: "Mauricio", age: 8, details: "Mamoncito, consentido"),
        Perro(name: "Gos", owner: "Hada", age: 9, details: "Gigante, juguetón"),
        Perro(name: "Sasha", owner: "Hada", age: 13, details: "Tuta, tranquila"),
        Perro(name: "Gordita", owner: "Lola", age: 5, details: "Muda, tranquila, preciosa"),
        Perro(name: "Federica", owner: "Melany", age: 2, details: "Juguetona, hiperactiva, sobreviviente"),
        Perro(name: "Toby", owner: "Lola", age: 3, details: "Mamoncito, ladrador"),
        Perro(name: "Teddy", owner: "Melissa", age: 3, details: "Miedoso, ladrador"),
        Perro(name: "Coco", owner: "Gabriel", age: 8, details: "Enojón, apestoso"),
        Perro(name: "Chento", owner: "Melissa", age: 7, details: "Peleonero, trucos de circo")
    ]
    
    var body: some View {
        NavigationView {
            VStack (spacing: 12) {
                Text("Perros que conozco")
                    .font(.largeTitle)
                    .padding(.bottom, 4.0)
                HStack {
                    Text ("Nombre")
                        .font(.headline)
                    Text ("Edad")
                        .font(.headline)
                    Text ("Dueño")
                        .font(.headline)
                }
                
                SearchBar(text: $searchText)
                
                getList()
            }
            .padding()
        }
    }
    
    func getList() -> some View {
        let filteredPerros = perrosConocidos.filter {
            searchText.isEmpty || $0.owner.localizedCaseInsensitiveContains(searchText)
        }
        
        return List(filteredPerros, id: \.self) { dog in
            HStack {
                NavigationLink {
                    let controller = DogController(dog: dog)
                    
                    // Pasamos el controlador a la vista
                    DogView(controller: controller)
                } label: {
                    Text(dog.name)
                }
                Text ("\(dog.age)")
                    .font(.headline)
                    .fontWeight(.thin)
                Text (dog.owner)
                    .font(.caption)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Buscar dueño", text: $text)
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 15)
        }
        .padding(.top, 8)
    }
}

