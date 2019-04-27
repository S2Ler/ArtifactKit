import Foundation

public enum CardType: String, Decodable {
  case ability = "Ability"
  case creep = "Creep"
  case hero = "Hero"
  case improvement = "Improvement"
  case item = "Item"
  case pathing = "Pathing"
  case passiveAbility = "Passive Ability"
  case spell = "Spell"
  case stronghold = "Stronghold"
  case mutation = "Mutation"
}
