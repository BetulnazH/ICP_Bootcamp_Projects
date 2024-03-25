//importlar

import Map "mo:base/HashMap";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import Bool "mo:base/Bool";

actor Assistant {

  type ToDo = {
    description: Text;
    completed: Bool;
  };

  func natHash(n: Nat) : Hash.Hash {
    Text.hash(Nat.toText(n))
  };

  var toDos = Map.HashMap<Nat, ToDo>(0, Nat.equal, natHash);
  var nextId: Nat =0;

  public query func getTodos(): async [ToDo] {
    Iter.toArray(toDos.vals())
  };

  public func addToDo(description: Text) : async Nat {

    let id = nextId;
    toDos.put(id, {description = description ; completed = false});
    nextId += 1;
    id // return id;
  };

  public func completeToDo(id:Nat) : async () {
    ignore do ? {
      let description = toDos.get(id)!.description;
      toDos.put(id, {description; completed =true});
    }
  };

  public query func showTodos() : async Text {
    var output: Text = "\n_________TO-DOs_________";
    for (toDo:ToDo in toDos.vals()){
      output #= "\n" # toDo.description;
      if ( toDo.completed) {output #= " +"};
    };
    output # "\n"
  };

  public func clearCompleted() : async () {
    toDos := Map.mapFilter<Nat,ToDo, ToDo>(toDos, Nat.equal, natHash,
    func(_,toDo) {if ( toDo.completed) null else ?toDo});
  };


}