import Foundation

let favoriteSuit = PlayingCardSuit.Heart

enum CardType {
	case Ace
	case King
	case Queen
	case Jack
	case Ten
	case Nine
	case Eight
	case Seven
	case Six
	case Five
	case Four
	case Three 
	case Two
}

let favoriteCard: CardType = .Ace

print("favorite suit: \(favoriteSuit)")
print("favorite card: \(favoriteCard)")
