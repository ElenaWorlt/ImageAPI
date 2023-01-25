//
//  ViewController.swift
//  ApiApp
//
//  Created by Елена Душакова on 25.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var imageWidth = ""
    var imageHeigth = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let height = imageView.bounds.height
        self.imageHeigth = String(format: "%0.f", Double(height))
        let width = imageView.bounds.width
        self.imageWidth = String(format: "%0.f", Double(width))
    }
    
    @IBAction func getImageButtonPressed(_ sender: UIButton) {
        // 1. Получить API
        let api = "https://picsum.photos/" + imageWidth + "/" + imageHeigth
        
        // 2.  Создать URL
        guard let apiURL = URL(string: api) else {
            fatalError("somthing is wrong")
        }
        
        // 3. Инициализировать сессию
        let session = URLSession(configuration: .default)
        
        // 4.  Созать запрос DataTask (постановка задачи)
        let task = session.dataTask(with: apiURL) {(data, response, error) in
        // 5. Обработать полученные данные
           guard let data = data, error == nil else {return}
       
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        // 6. Запустить задачу на экране
            task.resume()
    }
}

