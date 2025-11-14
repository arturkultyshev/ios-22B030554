import UIKit

struct FavoriteItem {
    let imageName: String   // asset name or SF Symbol
    let title: String
    let subtitle: String
    let review: String
}

enum FavoriteSection: Int, CaseIterable {
    case movies = 0, music, books, courses

    var title: String {
        switch self {
        case .movies: return "🎬 Favorite Movies"
        case .music:  return "🎵 Favorite Music"
        case .books:  return "📚 Favorite Books"
        case .courses:return "🎓 Favorite Courses"
        }
    }
}

struct FavoritesData {
    static let movies: [FavoriteItem] = [
        .init(imageName: "film1", title: "The Hunger Games", subtitle: "2012",
              review: "A gripping fight for survival in a dystopian world."),
        .init(imageName: "film2", title: "Pirates of the Caribbean: The Curse of the Black Pearl", subtitle: "2003",
              review: "A thrilling mix of adventure, humor, and pirate legends."),
        .init(imageName: "film3", title: "Fast & Furious", subtitle: "2001",
              review: "High-speed action and strong family bonds on the streets."),
        .init(imageName: "film4", title: "Gran Turismo", subtitle: "2023",
              review: "An inspiring racing story based on real events."),
        .init(imageName: "film5", title: "Ford vs Ferrari", subtitle: "2019",
              review: "A powerful drama about passion, rivalry, and innovation in racing.")
    ]

    static let music: [FavoriteItem] = [
        .init(imageName: "song1", title: "In The End", subtitle: "Linkin Park",
              review: "A timeless anthem blending rock energy with emotional lyrics."),
        .init(imageName: "song2", title: "Smells Like Teen Spirit", subtitle: "Nirvana",
              review: "The rebellious grunge anthem that defined a generation."),
        .init(imageName: "song3", title: "Мертвый Анархист", subtitle: "Король и Шут",
              review: "A darkly humorous punk tale with theatrical storytelling."),
        .init(imageName: "song4", title: "T.N.T.", subtitle: "AC/DC",
              review: "Pure hard rock power packed with attitude and fire."),
        .init(imageName: "song5", title: "Bring Me To Life", subtitle: "Evanescence",
              review: "A haunting blend of rock and gothic emotion with soaring vocals.")
    ]

    static let books: [FavoriteItem] = [
        .init(imageName: "book1", title: "Sinners Ring Corporation", subtitle: "Alexander Chubaryan",
              review: "A gripping cyber-thriller exploring human greed and power."),
        .init(imageName: "book2", title: "Labyrinth Rostov", subtitle: "Larisa Bortnikova, Alexandra Davydova",
              review: "A mysterious story full of intrigue and psychological tension."),
        .init(imageName: "book3", title: "Hackers: Basic", subtitle: "Alexander Chubaryan",
              review: "An engaging introduction to hacking culture and digital secrets."),
        .init(imageName: "book4", title: "Che Guevara Bolivian Grandfather", subtitle: "Karina Shainyan",
              review: "A vivid portrait of Che Guevara’s ideals and final mission."),
        .init(imageName: "book5", title: "Marusya Talisman of Immortality", subtitle: "Polina Voloshina",
              review: "A fantasy tale of destiny, courage, and the price of eternal life.")
    ]

    static let courses: [FavoriteItem] = [
        .init(imageName: "sub1", title: "Algorithms", subtitle: "Fall",
              review: "Teaches thinking precisely under constraints."),
        .init(imageName: "sub2", title: "Operating Systems", subtitle: "Spring",
              review: "Threads, memory, filesystems—computers demystified."),
        .init(imageName: "sub3", title: "Machine Learning", subtitle: "Spring",
              review: "Models, data, and generalization; project-heavy."),
        .init(imageName: "sub4", title: "Databases", subtitle: "Fall",
              review: "SQL to transactions; practically useful."),
        .init(imageName: "sub5", title: "Networks", subtitle: "Fall",
              review: "From packets to protocols; hands-on labs.")
    ]

    static func items(for section: FavoriteSection) -> [FavoriteItem] {
        switch section {
        case .movies: return movies
        case .music: return music
        case .books: return books
        case .courses: return courses
        }
    }
}
