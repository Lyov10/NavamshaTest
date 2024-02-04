//
//  MantrTableViewCell.swift
//  TestExercise
//
//  Created by 4steps on 04.02.24.
//

import UIKit

class MantrTableViewCell: UITableViewCell {
    
    lazy var playIcon: UIImageView = {
        let playIcon = UIImageView()
        playIcon.image = UIImage(named: "ic_play")
        playIcon.contentMode = .scaleAspectFit
        return playIcon
    }()
    lazy var matnrNameLabel: UILabel = {
        let matnrName = UILabel()
        matnrName.font = .nunitoBold(size: 15)
        matnrName.textColor = .textColor
        return matnrName
    }()
    
    lazy var durationLabel: UILabel = {
        let duration = UILabel()
        duration.font = .nunitoBold(size: 12)
        duration.textColor = .textColor.withAlphaComponent(0.4)
        duration.textAlignment = .right
        return duration
    }()

    lazy  var background: UIView = {
        let background = UIView()
        background.backgroundColor = .cellBackgroundColor
        background.setCornerRadius(radius: 22)
        background.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(background)
        return background
    }()
    
    lazy  var mainStackView: UIStackView = {
        let mainStackView = UIStackView()
        mainStackView.axis = .horizontal
        mainStackView.alignment = .center
        mainStackView.distribution = .equalSpacing
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        return mainStackView
    }()
    
    lazy  var playStackView: UIStackView = {
        let playStackView = UIStackView()
        playStackView.axis = .horizontal
        playStackView.distribution = .fill
        playStackView.alignment = .fill
        playStackView.spacing = 20
        return playStackView
    }()
    
     func setupCell(mantra: Mantra) {
        configureView()
        matnrNameLabel.text = mantra.name
        durationLabel.text = mantra.duration.toMinutesSecondsString()
    }
 
   private  func configureView() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
        
        NSLayoutConstraint.activate([
            background.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            background.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        background.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 26),
            mainStackView.topAnchor.constraint(equalTo: background.topAnchor, constant: 0),
            mainStackView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: 0),
        ])
        
        playStackView.addArrangedSubview(playIcon)
        playStackView.addArrangedSubview(matnrNameLabel)
        mainStackView.addArrangedSubview(playStackView)
        mainStackView.addArrangedSubview(durationLabel)
    }
    
}
