//
//  ViewController.swift
//  Tesis
//
//  Created by Cristhina Vargas on 2/12/22.
//
import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let tesisViewModel: TesisViewModel = TesisViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await setUpData()
        }
        setUpView()
    }
    func setUpData() async {
        await tesisViewModel.getDataFromAPI()
        print(tesisViewModel.tesis)
        tableView.reloadData()
    }
    func setUpView (){
        tableView.delegate = self
        tableView.dataSource = self
    }
}
//Extension del ViewController
extension ViewController:  UITableViewDelegate, UITableViewDataSource {
    //Retorna el numero de celdas que tendra mi tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tesisViewModel.tesis.count
    }
    //Da los valores a la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        //IndexPath.row ayuda a saber la posicion de nuestra celda
        cell.textLabel?.text = tesisViewModel.tesis[indexPath.row].tema.capitalized
        return cell
    }
}



