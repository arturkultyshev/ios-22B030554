//
//  ViewController.swift
//  Random
//
//  Created by Артур Култышев on 23.10.2025.
//

import UIKit

struct Item {
    let title: String
    let imageName: String
    let details: String
}

class ViewController: UIViewController {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!


    let items: [Item] = [
        Item(title: "C",          imageName: "C",          details: "Системный язык, высокая производительность, ручное управление памятью."),
        Item(title: "C++",        imageName: "CPlus",      details: "ООП + шаблоны, STL, подходит для игр, движков, высоконагруженных систем."),
        Item(title: "C#",         imageName: "CSharp",     details: ".NET/Unity, удобная ООП-модель, сборщик мусора, кроссплатформенность."),
        Item(title: "Go",         imageName: "GoLang",     details: "Простота, быстрая компиляция, goroutines, серверы и облака."),
        Item(title: "Java",       imageName: "Java",       details: "JVM, крупные бекенды, Android, строгая типизация, огромная экосистема."),
        Item(title: "JavaScript", imageName: "JavaScript", details: "Web-клиент/сервер (Node.js), DOM, асинхронщина (Promise/async/await)."),
        Item(title: "PHP",        imageName: "PHP",        details: "Веб-бекенд, CMS, быстрый старт, современные фреймворки (Laravel/Symfony)."),
        Item(title: "Python",     imageName: "Python",     details: "Читаемость, научпакеты, ML/AI, скрипты, веб (Django/FastAPI)."),
        Item(title: "Ruby",       imageName: "Ruby",       details: "Элегантный синтаксис, Rails, быстрые прототипы веб-приложений."),
        Item(title: "TypeScript", imageName: "Typescript", details: "JS + типы, подсказки IDE, безопаснее и крупные фронтенд-коды.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        show(itemIndex: 0)
    }

    @IBAction func randomizeTapped(_ sender: UIButton) {
        guard !items.isEmpty else { return }
        let randomIndex = Int.random(in: 0..<items.count)
        show(itemIndex: randomIndex)
    }

    private func show(itemIndex: Int) {
        let item = items[itemIndex]
        titleLabel.text = item.title
        detailsLabel.text = item.details
        itemImageView.image = UIImage(named: item.imageName)
    }
}


