//
//  HortCultTests.swift
//  HortCultTests
//
//  Created by Pedro Henrique Santos Rodrigues on 17/07/23.
//

import XCTest
@testable import HortCult

final class HortCultTests: XCTestCase {
    
    func testImageDataConvert() {
        let plantViewModel = PlantViewModel()
        let image1 = UIImage(color: .red, size: CGSize(width: 100, height: 100))!
        let image2 = UIImage(color: .blue, size: CGSize(width: 150, height: 150))!
        let images = [image1, image2]
        
        let result = plantViewModel.imageDataConvert(image: images)
        
        XCTAssertEqual(result.count, 2, "A quantidade de dados convertidos deve ser 2")
        
    }
    
    
    func testGetPlantId(){
        let plantViewModel = PlantViewModel()
        plantViewModel.createPlant(name: "PlantaTeste", information: "DescricaoTeste", category: "CategoriaTeste", frequency: "1", image: [UIImage(color: .red, size: CGSize(width: 100, height: 100))!])
        var plantinha = plantViewModel.getPlant(by: "PlantaTeste")
        guard var idPlanta = plantinha?.id else { return }
        
        var planta2 = plantViewModel.getPlantId(id: idPlanta)
        
        XCTAssertEqual(plantinha, planta2, "As plantas nao sao iguais")
    }
    
    func testGetPlant(){
        let plantViewModel = PlantViewModel()
        plantViewModel.createPlant(name: "PlantaTesteName", information: "DescricaoTeste", category: "CategoriaTeste", frequency: "1", image: [UIImage(color: .red, size: CGSize(width: 100, height: 100))!])
        let plantaBuscada = plantViewModel.getPlant(by: "PlantaTesteName")
        let namePlantaBuscada = plantaBuscada?.name
        
        XCTAssertEqual(namePlantaBuscada, "PlantaTesteName", "As plantas nao sao iguais")
    }
    
    //    func testDataImageConvert(){
    //        var plantViewModel = PlantViewModel()
    //        let image1 = UIImage(color: .red, size: CGSiz e(width: 100, height: 100))!
    //        let image2 = UIImage(color: .red, size: CGSize(width: 100, height: 100))!
    //
    //        let imageToData = plantViewModel.imageDataConvert(image: [image1, image2])
    //
    //        let imageToData2 = plantViewModel.imageDataConvert(image: [image1, image2])
    //
    //        let dataToImage = plantViewModel.dataImageConvert(datas: imageToData)
    //        let imageToDataAgain = plantViewModel.imageDataConvert(image: dataToImage)
    //        //let result = plantViewModel.dataImageConvert(datas: imageToData)
    //        //let firstItem = result.first 3607 6875 // 3653 6921
    //        XCTAssertEqual(imageToDataAgain, imageToData , "As imagens não correspondem")
    //    }
    //}
    
    func testDataImageConvert(){
        let plantViewModel = PlantViewModel()
        let image1 = UIImage(color: .red, size: CGSize(width: 100, height: 100))!
        let image2 = UIImage(color: .blue, size: CGSize(width: 150, height: 150))!
        
        let images = [image1, image2]
        
        let imageToData = plantViewModel.imageDataConvert(image: images)
        let dataToImage = plantViewModel.dataImageConvert(datas: imageToData)
        
        XCTAssertEqual(dataToImage.count, images.count, "Algumas Imagens se perderam durante o processo")
        
    }
    
}
import UIKit

extension UIImage {
    convenience init?(color: UIColor, size: CGSize) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
