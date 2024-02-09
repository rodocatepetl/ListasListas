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
