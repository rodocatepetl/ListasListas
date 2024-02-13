//
//  DietView.swift
//  ListasListas
//
//  Created by Gabriela Aimee Salazar Mata on 08/02/24.
//

import Foundation
import SwiftUI

// Vista que muestra la información de Pomela
struct DietView: View {
    @ObservedObject var controller: DietController
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(controller.ingredient.name)")
                .padding()
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .background(.gray)
                .cornerRadius(8)
            Spacer()
            Image(systemName: "scalemass.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
            Text("Cantidad: \(controller.ingredient.quantity) gramos")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text("Comprar en: \(controller.ingredient.shop)")
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .background(.cyan)
                .cornerRadius(30)
            Spacer()
        }
        .padding()
        .navigationTitle("\(controller.ingredient.name)")
    }
}

// Controlador que maneja la información del modelo de Pomela
class DietController: ObservableObject {
    @Published var ingredient: Ingrediente
    
    init(ingredient: Ingrediente) {
        self.ingredient = ingredient
    }
    
    // Aquí puedes agregar métodos para actualizar los datos de Pomela si es necesario
}

struct DetailsDiet_Preview: PreviewProvider {
    static var previews: some View {
        let yuca = Ingrediente(name: "Yuca", quantity: 150, shop: "Walmart")
        let controller = DietController(ingredient: yuca)
        
        // Pasamos el controlador a la vista
        DietView(controller: controller)
    }
}
