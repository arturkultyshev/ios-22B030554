import UIKit
import Kingfisher
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet private weak var heroCover: UIImageView!
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var genderLabel: UILabel!
    @IBOutlet private weak var raceLabel: UILabel!
    @IBOutlet private weak var placeOfBirthLabel: UILabel!
    @IBOutlet private weak var publisherLabel: UILabel!

    @IBOutlet private weak var intelligenceLabel: UILabel!
    @IBOutlet private weak var strengthLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var durabilityLabel: UILabel!
    @IBOutlet private weak var powerLabel: UILabel!
    @IBOutlet private weak var combatLabel: UILabel!

    private let service = HeroServiceModern()
    private let lastHeroKey = "lastHeroKey"

    private let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientBackground()

        loadSavedHero()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    @IBAction private func randomButtonTapped(_ sender: UIButton) {
        loadRandomHero()
    }


    private func setupGradientBackground() {
        gradientLayer.colors = [
            UIColor(red: 1.0, green: 0.98, blue: 0.80, alpha: 1.0).cgColor, // очень светлый жёлтый
            UIColor(red: 1.0, green: 0.85, blue: 0.40, alpha: 1.0).cgColor  // тёплый жёлтый / оранжеватый
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds

        view.layer.insertSublayer(gradientLayer, at: 0)
    }


    private func loadRandomHero() {
        nameLabel.text = "Loading..."
        fullNameLabel.text = ""
        genderLabel.text = ""
        raceLabel.text = ""
        placeOfBirthLabel.text = ""
        publisherLabel.text = ""

        service.fetchRandomHero { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }

                switch result {
                case .success(let hero):
                    self.updateUI(with: hero)
                    self.saveHero(hero)
                case .failure(let error):
                    print("Network error: \(error)")
                    self.showError(message: "Не удалось загрузить героя. Попробуйте ещё раз.")
                    self.clearUI()
                }
            }
        }
    }


    private func updateUI(with hero: HeroModel) {
        nameLabel.text = hero.name
        fullNameLabel.text = "Full name: \(hero.biography.fullName)"
        genderLabel.text = "Gender: \(hero.appearance.gender)"
        raceLabel.text = "Race: \(hero.appearance.race ?? "-")"
        placeOfBirthLabel.text = "Birth: \(hero.biography.placeOfBirth)"
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "-")"

        // Power stats
        intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence)"
        strengthLabel.text = "Strength: \(hero.powerstats.strength)"
        speedLabel.text = "Speed: \(hero.powerstats.speed)"
        durabilityLabel.text = "Durability: \(hero.powerstats.durability)"
        powerLabel.text = "Power: \(hero.powerstats.power)"
        combatLabel.text = "Combat: \(hero.powerstats.combat)"

        if let url = URL(string: hero.images.md) {
            heroImageView.kf.setImage(with: url)
            heroCover.kf.setImage(with: url)
        } else {
            heroImageView.image = nil
            heroCover.image = nil
        }
    }

    private func clearUI() {
        heroImageView.image = nil
        heroCover.image = nil

        nameLabel.text = ""
        fullNameLabel.text = ""
        genderLabel.text = ""
        raceLabel.text = ""
        placeOfBirthLabel.text = ""
        publisherLabel.text = ""

        intelligenceLabel.text = ""
        strengthLabel.text = ""
        speedLabel.text = ""
        durabilityLabel.text = ""
        powerLabel.text = ""
        combatLabel.text = ""
    }


    private func saveHero(_ hero: HeroModel) {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(hero) {
            UserDefaults.standard.set(data, forKey: lastHeroKey)
        }
    }

    private func loadSavedHero() {
        if let data = UserDefaults.standard.data(forKey: lastHeroKey) {
            let decoder = JSONDecoder()
            if let hero = try? decoder.decode(HeroModel.self, from: data) {
                updateUI(with: hero)
                return
            }
        }

        clearUI()
    }


    private func showError(message: String) {
        let alert = UIAlertController(title: "Ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        present(alert, animated: true)
    }
}
