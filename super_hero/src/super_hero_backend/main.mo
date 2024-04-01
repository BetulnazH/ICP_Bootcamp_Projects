import Nat32 "mo:base/Nat32";
import Trie "mo:base/Trie";
import Option "mo:base/Option";
import List "mo:base/List";
import Text "mo:base/Text";
import Bool "mo:base/Bool";

actor Superheroes {

  public type Superhero_id = Nat32;

  public type Superhero = {
    name:Text;
    superpowers:List.List<Text>;
  };

  private stable var next: Superhero_id=0;

  private stable var superheroes: Trie.Trie<Superhero_id, Superhero> = Trie.empty();

  // yüksek seviye API

  public func create(superhero: Superhero) : async Superhero_id {
    let superhero_id = next;
    next += 1;
    superheroes := Trie.replace(
      superheroes,
      key(superhero_id),
      Nat32.equal,
      ?superhero,
    ).0;
    superhero_id
  };

  public query func read(superhero_id : Superhero_id, superhero: Superhero) : async Bool {
    let result = Trie.find(superheroes, key(superhero_id), Nat32.equal);
    let exists = Option.isSome(result);
    if(exists) {
      superheroes := Trie.replace(
        superheroes,
        key(superhero_id),
        Nat32.equal,
        ?superhero,
      ).0;
    };
  exists
  };


  public func delete(superhero_id: Superhero_id): async Bool{
    let result = Trie.find(superheroes, key(superhero_id), Nat32.equal);
    let exists = Option.isSome(result);
    if(exists) {
      superheroes := Trie.replace(
        superheroes,
        key(superhero_id),
        Nat32.equal,
        null,
      ).0;
    };
    exists
  };

  private func key(x: Superhero_id): Trie.Key<Superhero_id>{
    { hash = x; key = x };
  };




};
