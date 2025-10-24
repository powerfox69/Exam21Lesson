

import Foundation

protocol ImageNavigable {
    func getCurrentImage() -> ImageModel
    func getNextImage() -> ImageModel
    func getPreviousImage() -> ImageModel
    func getFirstImage() -> ImageModel
    func findImage(imageName: String) -> ImageModel?
}

class ImageDataManager: ImageNavigable {
    private var images: [ImageModel] = []
    private var currentIndex = 0
    
    
    init(images: [ImageModel]) {
        self.images = images
        
    }
    // MARK: - ImageNavigable methods
        
        func getImageCount() -> Int {
            return images.count
        }
        
        func getImage(at index: Int) -> ImageModel {
            return images[index]
        }
    
    func getCurrentImage() -> ImageModel {
        images[currentIndex]
    }
    
    func getNextImage() -> ImageModel {
        if currentIndex < images.count - 1 {
            currentIndex += 1
        }
        return getCurrentImage()
    }
    
    func getPreviousImage() -> ImageModel {
        if currentIndex > 0 {
            currentIndex -= 1
        }
        return getCurrentImage()
    }
    
    func getFirstImage() -> ImageModel {
        currentIndex = 0
        return getCurrentImage()
    }
    
    // MARK: - New method for finding image by name
    func findImage(imageName: String) -> ImageModel? {
        for image in images {
            if image.imageName == imageName {
                return image
            }
        }
        return nil
    }
    
    // MARK: - New methods for swipe actions
    func deleteImage(at index: Int) {
        guard index >= 0 && index < images.count else { return }
        images.remove(at: index)
    }
    
    func toggleMark(at index: Int) {
            guard index >= 0 && index < images.count else { return }
            images[index].isMark.toggle()
        }
}


