//
//  ViewModel.swift
//  DesafioHacka09
//
//  Created by Mateus Ottoni on 26/03/25.
//

import Foundation

class ViewModel : ObservableObject {
    
    @Published var personagens : [HaPo] = []
    
    func fetch() {
        // Acesso à API
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor")
                        else { return } // Retornar vazio se a URL não for válida
        
        // Variável para buscar os dados da URL
        let task = URLSession.shared.dataTask(with: url) {
            [weak self] data, _, error in
            
            // Para evitar vazamento de memória
            guard let data = data, error == nil else {
                return
            }
            
            // Parsing
            do {
                let parsed = try JSONDecoder().decode([HaPo].self, from: data)
                
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
            } catch {
                // Print do erro em caso de falha
                print(error)
            }
            
        } // Fim task
        task.resume()
        
        
        
    } // Fim func fetch()
    
    
} // Fim class ViewModel
