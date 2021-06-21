import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
    }

    mutating public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        
        for value in values {
            for suit in suits {
                
                let card = Card(suit: suit, value: value)
                self.cards.append(card)
                print(card)
            }
        }
        return cards
    }

    public mutating func shuffle() {
        var suits = [Suit]()
        suits.append(Suit.clubs)
        suits.append(Suit.diamonds)
        suits.append(Suit.hearts)
        suits.append(Suit.spades)
        
        var values = [Value]()
        values.append(Value.six)
        values.append(Value.seven)
        values.append(Value.eight)
        values.append(Value.nine)
        values.append(Value.ten)
        values.append(Value.jack)
        values.append(Value.queen)
        values.append(Value.king)
        values.append(Value.ace)
        
        
        self.createDeck(suits: suits, values: values)
    }

    public func defineTrump() {

    }

    public func initialCardsDealForPlayers(players: [Player]) {

    }

    public func setTrumpCards(for suit:Suit) {

    }
}

