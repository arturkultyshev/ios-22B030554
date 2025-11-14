import UIKit
import AVFoundation

struct Track {
    let title: String
    let artist: String
    let coverImageName: String
    let audioFileName: String
}

class ViewController: UIViewController {
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    

    private var tracks: [Track] = [
        Track(title: "In The End",
              artist: "Linkin Park",
              coverImageName: "cover1",
              audioFileName: "track1"),
        Track(title: "Smells Like Teen Spirit",
              artist: "Nirvana",
              coverImageName: "cover2",
              audioFileName: "track2"),
        Track(title: "Мертвый Анархист",
              artist: "Король и Шут",
              coverImageName: "cover3",
              audioFileName: "track3"),
        Track(title: "T.N.T.",
              artist: "AC/DC",
              coverImageName: "cover4",
              audioFileName: "track4"),
        Track(title: "Bring Me To Life",
              artist: "Evanescence",
              coverImageName: "cover5",
              audioFileName: "track5")
    ]
    
    private var currentIndex: Int = 0
    
    private var audioPlayer: AVAudioPlayer?
    private var isPlaying: Bool = false
    private let bgGradient = CAGradientLayer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgGradient.colors = [
                    UIColor.systemIndigo.cgColor,
                    UIColor.systemTeal.cgColor
                ]
        bgGradient.startPoint = CGPoint(x: 0, y: 0)
        bgGradient.endPoint   = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(bgGradient, at: 0)
        setupUIAppearance()
        loadCurrentTrack()
        updateUI()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            bgGradient.frame = view.bounds
        }
    
    private func setupUIAppearance() {
        
        
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        artistLabel.textAlignment = .center
        artistLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.layer.cornerRadius = 12
        coverImageView.clipsToBounds = true
        
        previousButton.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        updatePlayPauseButtonIcon()
    }
    
    private func updatePlayPauseButtonIcon() {
        let symbolName = isPlaying ? "pause.fill" : "play.fill"
        playPauseButton.setImage(UIImage(systemName: symbolName), for: .normal)
    }
    
    private func loadCurrentTrack() {
        let track = tracks[currentIndex]
        
        titleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)
        
        if let url = Bundle.main.url(forResource: track.audioFileName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading audio file: \(error.localizedDescription)")
            }
        } else {
            print("Audio file not found: \(track.audioFileName).mp3")
        }
    }
    
    private func updateUI() {
        updatePlayPauseButtonIcon()
    }
    
    private func playCurrentTrack() {
        audioPlayer?.play()
        isPlaying = true
        updateUI()
    }
    
    private func pauseCurrentTrack() {
        audioPlayer?.pause()
        isPlaying = false
        updateUI()
    }
    
    private func goToNextTrack() {
        if currentIndex == tracks.count - 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        
        loadCurrentTrack()
        

        if isPlaying {
            playCurrentTrack()
        } else {
            updateUI()
        }
    }
    
    private func goToPreviousTrack() {
        if currentIndex == 0 {
            currentIndex = tracks.count - 1
        } else {
            currentIndex -= 1
        }
        
        loadCurrentTrack()
        
        if isPlaying {
            playCurrentTrack()
        } else {
            updateUI()
        }
    }
    

    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if isPlaying {
            pauseCurrentTrack()
        } else {
            playCurrentTrack()
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        goToNextTrack()
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        goToPreviousTrack()
    }
}
