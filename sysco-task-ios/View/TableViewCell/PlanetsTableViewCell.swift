//
//  PlanetsTableViewCell.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import UIKit
import Alamofire
import AlamofireImage

class PlanetsTableViewCell: BaseTableViewCell {
    private var planetImageView: UIImageView!
    
    private var planetNameLabel: UILabel!
    
    private var planetClimateLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        planetImageView.image = nil
        
        planetNameLabel.text = ""
        
        planetClimateLabel.text = ""
    }
    
    override func config() {
        backgroundColor = UIColor.clear
        
        selectionStyle = .none
    }
    
    override func createViews() {
        planetImageView = UIImageView()
        
        planetImageView.contentMode = .scaleAspectFit
        
        planetImageView.layer.cornerRadius = 30
        
        planetImageView.clipsToBounds = true
        
        
        
        planetNameLabel = UILabel()
        
        planetNameLabel.font = .tvTitle
        
        
        
        planetClimateLabel = UILabel()
        
        planetClimateLabel.font = .tvSubTitle
        
    }
    
    override func insertAndLayoutSubviews() {
        let hStackView = UIStackView()
        
        hStackView.axis = .horizontal
        
        hStackView.distribution = .fillProportionally
        
        hStackView.spacing = 12
        
        
        
        
        let vStackView = UIStackView()
        
        vStackView.axis = .vertical
        
        vStackView.addArrangedSubview(planetNameLabel)
        
        vStackView.addArrangedSubview(planetClimateLabel)
        
        
        
        hStackView.addArrangedSubview(planetImageView)
        
        hStackView.addArrangedSubview(vStackView)
        
        planetImageView.activateLayouts([.width: 60, .height: 60])
        
        addSubview(hStackView)
        
        hStackView.activateLayouts(equalConstant: 20, to: self)
        
    }
    
    func updateUIWithData(data: PlanetModel, with imageURLString: String) {
        if let imageURL = URL.init(string: imageURLString) {
            planetImageView.af.setImage(withURL: imageURL)
        }
        
        planetNameLabel.text = data.name.capitalized
        
        planetClimateLabel.text = data.climate.capitalized
    }
    
    // load image from URL
//    private func loadImageFromURL(completionHandler: @escaping (UIImage?) -> Void) {
//        AF.request("https://picsum.photos/200", method: .get).response { response in
//
//           switch response.result {
//            case .success(let responseData):
//               let image = UIImage(data: responseData!, scale:1)
//
//               completionHandler(image)
//
//            case .failure(_):
//               completionHandler(nil)
//
//           }
//        }
//    }
    
}
