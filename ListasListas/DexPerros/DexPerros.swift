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
    
    let perrosConocidos: [Perro] = [
        Perro(name: "Rockett", owner: "Aimee", age: 12),
        Perro(name: "Tessa", owner: "Aira", age: 7),
        Perro(name: "Pomela", owner: "Aimee", age: 4),
        Perro(name: "Rogelio", owner: "Rodo", age: 8),
        Perro(name: "Nymeria", owner: "Khan", age: 9),
        Perro(name: "Tsume", owner: "Mauricio", age: 8),
        Perro(name: "Gos", owner: "Hada", age: 9),
        Perro(name: "Sasha", owner: "Hada", age: 13),
        Perro(name: "Gordita", owner: "Lola", age: 5),
        Perro(name: "Federica", owner: "Melany", age: 2),
        Perro(name: "Toby", owner: "Lola", age: 3),
        Perro(name: "Teddy", owner: "Melissa", age: 3),
        Perro(name: "Coco", owner: "Gabriel", age: 8),
        Perro(name: "Chento", owner: "Melissa", age: 7)
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
                    Text ("Dueño")
                        .font(.headline)
                    Text ("Edad")
                        .font(.headline)
                }
                
                getList()
                // Aquí puedes mostrar un ejemplo más avanzado, como una lista con elementos personalizados,
                // interacción con los datos, etc. Asegúrate de que sea un ejemplo que se pueda probar en un Playground.
                
                // Ejemplo de lista con datos dinámicos y vistas personalizadas
            }
        }
    }
    
    func getList() -> some View {
        List(self.perrosConocidos, id: \.self) { dog in
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
