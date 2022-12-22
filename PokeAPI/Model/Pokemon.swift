//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Stephen Giovanni Saputra on 22/12/22.
//

import Foundation

// MARK: - Pokemon
struct PokemonResponse: Decodable {
    
    let results: [PokemonResult]
}

struct PokemonResult: Codable {
    
    let name: String
    let url: String
}

struct Pokemon: Codable {
    
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let isDefault: Bool
    let order: Int
    let weight: Int
    let abilities: [Ability]
    let forms: [Species]
    let gameIndices: [GameIndex]
    let heldItems: [HeldItem]
    let locationAreaEncounters: String
    let moves: [Move]
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let pastTypes: [PastType]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case baseExperience = "base_experience"
        case height = "height"
        case isDefault = "is_default"
        case order = "order"
        case weight = "weight"
        case abilities = "abilities"
        case forms = "forms"
        case gameIndices = "game_indices"
        case heldItems = "held_items"
        case locationAreaEncounters = "location_area_encounters"
        case moves = "moves"
        case species = "species"
        case sprites = "sprites"
        case stats = "stats"
        case types = "types"
        case pastTypes = "past_types"
    }
}

// MARK: - Ability
struct Ability: Codable {
    let isHidden: Bool
    let slot: Int
    let ability: Species

    enum CodingKeys: String, CodingKey {
        case isHidden = "is_hidden"
        case slot = "slot"
        case ability = "ability"
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

// MARK: - GameIndex
struct GameIndex: Codable {
    let gameIndex: Int
    let version: Species

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version = "version"
    }
}

// MARK: - HeldItem
struct HeldItem: Codable {
    let item: Species
    let versionDetails: [VersionDetail]

    enum CodingKeys: String, CodingKey {
        case item = "item"
        case versionDetails = "version_details"
    }
}

// MARK: - VersionDetail
struct VersionDetail: Codable {
    let rarity: Int
    let version: Species

    enum CodingKeys: String, CodingKey {
        case rarity = "rarity"
        case version = "version"
    }
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move = "move"
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let versionGroup: Species
    let moveLearnMethod: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case versionGroup = "version_group"
        case moveLearnMethod = "move_learn_method"
    }
}

// MARK: - PastType
struct PastType: Codable {
    let generation: Species
    let types: [TypeElement]

    enum CodingKeys: String, CodingKey {
        case generation = "generation"
        case types = "types"
    }
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let slot: Int
    let type: Species

    enum CodingKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }
}

// MARK: - GenerationV
struct GenerationV: Codable {
    let blackWhite: Sprites

    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
}

// MARK: - GenerationIv
struct GenerationIv: Codable {
    let diamondPearl: Sprites
    let heartgoldSoulsilver: Sprites
    let platinum: Sprites

    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum = "platinum"
    }
}

// MARK: - Versions
struct Versions: Codable {
    let generationI: GenerationI
    let generationIi: GenerationIi
    let generationIii: GenerationIii
    let generationIv: GenerationIv
    let generationV: GenerationV
    let generationVi: [String: Home]
    let generationVii: GenerationVii
    let generationViii: GenerationViii

    enum CodingKeys: String, CodingKey {
        case generationI = "generation-i"
        case generationIi = "generation-ii"
        case generationIii = "generation-iii"
        case generationIv = "generation-iv"
        case generationV = "generation-v"
        case generationVi = "generation-vi"
        case generationVii = "generation-vii"
        case generationViii = "generation-viii"
    }
}

// MARK: - Sprites
class Sprites: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    init(frontDefault: String) {
        self.frontDefault = frontDefault
    }
}

// MARK: - GenerationI
struct GenerationI: Codable {
    let redBlue: RedBlue
    let yellow: RedBlue

    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow = "yellow"
    }
}

// MARK: - RedBlue
struct RedBlue: Codable {
    let backDefault: String
    let backGray: String
    let frontDefault: String
    let frontGray: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backGray = "back_gray"
        case frontDefault = "front_default"
        case frontGray = "front_gray"
    }
}

// MARK: - GenerationIi
struct GenerationIi: Codable {
    let crystal: Crystal
    let gold: Crystal
    let silver: Crystal

    enum CodingKeys: String, CodingKey {
        case crystal = "crystal"
        case gold = "gold"
        case silver = "silver"
    }
}

// MARK: - Crystal
struct Crystal: Codable {
    let backDefault: String
    let backShiny: String
    let frontDefault: String
    let frontShiny: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - GenerationIii
struct GenerationIii: Codable {
    let emerald: Emerald
    let fireredLeafgreen: Crystal
    let rubySapphire: Crystal

    enum CodingKeys: String, CodingKey {
        case emerald = "emerald"
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
}

// MARK: - Emerald
struct Emerald: Codable {
    let frontDefault: String
    let frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

// MARK: - Home
struct Home: Codable {
    let frontDefault: String
    let frontFemale: JSONNull?
    let frontShiny: String
    let frontShinyFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

// MARK: - GenerationVii
struct GenerationVii: Codable {
    let icons: DreamWorld
    let ultraSunUltraMoon: Home

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
}

// MARK: - DreamWorld
struct DreamWorld: Codable {
    let frontDefault: String
    let frontFemale: JSONNull?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }
}

// MARK: - GenerationViii
struct GenerationViii: Codable {
    let icons: DreamWorld

    enum CodingKeys: String, CodingKey {
        case icons = "icons"
    }
}

// MARK: - Other
struct Other: Codable {
    let dreamWorld: DreamWorld
    let home: Home
    let officialArtwork: OfficialArtwork

    enum CodingKeys: String, CodingKey {
        case dreamWorld = "dream_world"
        case home = "home"
        case officialArtwork = "official-artwork"
    }
}

// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat: Int
    let effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

