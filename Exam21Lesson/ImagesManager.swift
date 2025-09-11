
protocol ImageRetrievable {
    func getImages() -> [ImageModel]
}

class ImageManager: ImageRetrievable {
    
    func getImages() -> [ImageModel] {
        [
            ImageModel(imageName: "image1", info: "Платье силуэта «песочные часы» с акцентом на талии и объемом на бедрах. Фигурный вырез декольте. Пышные короткие рукава. Подшитая подкладкой модель в красно-винном оттенке застегивается на молнию."),
            ImageModel(imageName: "image2", info: "Платье в ретро-стиле из вискозного бархата в глубоком черном оттенке. Фактурная ткань, отражая свет, создает переливы, подчеркивая изгибы тела. Имитирующая ручное кружево контрастная манишка. Объемная линия плеч на внутреннем слое из сетчатого материала. Слегка зауженный к низу крой подола. Застегивается на молнию и миниатюрную пуговицу. На подкладке."),
            ImageModel(imageName: "image3", info: "Платье в бельевом стиле из вискозного атласа и цветочного кружева. Лиф с вырезом на запáх и широкими бретелями укреплен подкладкой. Застежка-молния в боковом шве."),
            ImageModel(imageName: "image4", info: "Приталенное платье миди из вискозной ткани с добавлением шерсти дополнено полупрозрачным кружевом. Украшенная цветочным принтом модель с объемными плечами в ретро-стиле застегивается на металлические пуговицы с перламутровым основанием. На подкладке из шелковистого лиоцелла."),
            ImageModel(imageName: "image5", info: "Платье приталенного кроя из эластичной ткани с драпировкой по бокам. Закрытые декольте и линия плеч. Верх на подкладке. Застегивается молнией на спине."),
            ImageModel(imageName: "image6", info: "Платье прилегающего кроя из вискозного трикотажа эластичной вязки. Модель макси с воротником-стойкой акцентирована высокими разрезами по бокам.")
        ]
    }
}

struct ImageModel {
    let imageName: String
    let info: String
    
    init(imageName: String, info: String) {
        self.imageName = imageName
        self.info = info
    }
}

// MARK: - CustomStringConvertible
extension ImageModel: CustomStringConvertible {
    var description: String {
        "Название картинки: \(imageName), описание: \(info)"
    }
}

//MARK: - Comparable
extension ImageModel: Comparable {
    static func < (lhs: ImageModel, rhs: ImageModel) -> Bool {
        lhs.imageName < rhs.imageName
    }
}
