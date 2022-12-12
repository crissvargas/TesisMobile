//
//  TesisViewModel.swift
//  Tesis
//
//  Created by Cristhina Vargas on 2/12/22.
//
import Foundation

class TesisViewModel{
    
    var tesis = [Tesis]()
    let  URL_API: String = "https://us-central1-tesis-324da.cloudfunctions.net/app/api/tesis-publicas"
    
    func getDataFromAPI() async{
        //Convert to string
        guard let url = URL(string: URL_API) else {return}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decoder = try? JSONDecoder().decode([Tesis].self, from: data) {
                DispatchQueue.main.async(execute: {
                    decoder.forEach { i in
                        self.tesis.append(i)
                    }
                })
            }
        }catch {
            print("Error encontrado")
        }
    }
}

