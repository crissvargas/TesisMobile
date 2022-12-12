//
//  ViewController.swift
//  Tesis
//
//  Created by Cristhina Vargas on 2/12/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let tesisViewModel: TesisViewModel = TesisViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tesisViewModel.getDataFromAPI()
   
    }
    
