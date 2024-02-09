//
//  DetallesPerro.swift
//  ListasListas
//
//  Created by Rodolfo Castillo on 08/02/24.
//

import Foundation
import SwiftUI

// Vista que muestra la información de Pomela
struct DogView: View {
    @ObservedObject var controller: DogController
    
    var body: some View {
        VStack {
            Image("pomela")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4))
            
            Text("Nombre: \(controller.dog.name)")
            Text("Edad: \(controller.dog.age) años")
            Text("Due~no: \(controller.dog.owner)")
        }
        .padding()
        .navigationTitle("Pomela")
    }
}

// Controlador que maneja la información del modelo de Pomela
class DogController: ObservableObject {
    @Published var dog: Perro
    
    init(dog: Perro) {
        self.dog = dog
    }
    
    // Aquí puedes agregar métodos para actualizar los datos de Pomela si es necesario
}

struct DetallesPerros_Preview: PreviewProvider {
    static var previews: some View {
        let pomela = Perro(name: "Pomela", owner: "Aimecita", age: 6)
        let controller = DogController(dog: pomela)
        
        // Pasamos el controlador a la vista
        DogView(controller: controller)
    }
}
