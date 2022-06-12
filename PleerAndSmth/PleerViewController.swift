

import UIKit
import AVFoundation

class PleerViewController: UIViewController {

    var player = AVAudioPlayer()
    
    var musicPlaying = true
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 12
        button.setTitle("Play/Pause", for: .normal)
//        button.tintColor = .blue
//        button.titleColor(for: .normal)
//        button.setTitleColor(.orange, for: .selected)
        button.setTitle("Play/Pause", for: .normal)
        button.addTarget(self, action: #selector(playPause), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var trackSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .orange
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(scrollTrack(slider:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .green
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(scrollVolume(slider:)), for: .valueChanged)
        return slider
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        playTrack()
        setupView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        view.addSubview(playPauseButton)
        let leftButtonConst = playPauseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        let rightButtonConst = playPauseButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        let bottomButtonConst = playPauseButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        let heightButtonConst = playPauseButton.heightAnchor.constraint(equalToConstant: 60)
        
        view.addSubview(trackSlider)
        let leftSliderConst = trackSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        let rightSliderConst = trackSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        let bottomSliderConst = trackSlider.bottomAnchor.constraint(equalTo: playPauseButton.topAnchor, constant: -40)
        
        view.addSubview(volumeSlider)
        let leftSliderVol = volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40)
        let rightSliderVol = volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40)
        let bottomSliderVol = volumeSlider.bottomAnchor.constraint(equalTo: trackSlider.topAnchor, constant: -70)
        
        NSLayoutConstraint.activate([leftButtonConst, rightButtonConst, bottomButtonConst, heightButtonConst, leftSliderConst, rightSliderConst, bottomSliderConst, leftSliderVol, rightSliderVol, bottomSliderVol])
    }
    
    private func playTrack() {
        do {
            if let trackPath = Bundle.main.path(forResource: "bobMoses", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: trackPath))
            }
        }
        catch { print("error") }
        
        self.player.play()
    }
    
    @objc private func playPause() {
        if musicPlaying {
            self.player.pause()
            musicPlaying.toggle()
        } else {
            self.player.play()
            musicPlaying.toggle()
        }
    }
    
    @objc private func scrollTrack(slider: UISlider) {
        if slider == trackSlider {
            self.player.currentTime = TimeInterval(slider.value)
        }
    }
    
    @objc private func scrollVolume(slider: UISlider) {
        if slider == volumeSlider {
            self.player.volume = slider.value
        }
    }

}

