

class ImageManager {
    
    func getImages() -> [ImageModel] {
        return [
            ImageModel(imageName: "image1", number: 1)
        ]
    }
    
}

struct ImageModel {
    let imageName: String
    let number: Int
}
