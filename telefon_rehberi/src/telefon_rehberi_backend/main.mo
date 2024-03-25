// importlar
import Map "mo:base/HashMap";
import Text "mo:base/Text";

// actor -> canister -> smart contract

actor telefon_rehberi {
  // Motoko -> type language

  type Name = Text;
  type Phone = Text;

  type Entry = {
    desc: Text;
    phone: Phone;
  };

  // variable (değişkenler)
  // let -> immutable ( değiştirilemez)
  // var -> mutable ( değiştirilebilir)

  let phone_book = Map.HashMap<Name, Entry>(0, Text.equal, Text.hash);

  // fonksiyonlar
  // query -> sorgulamak
  // update -> güncelleme

  public func insert(name:Name, entry: Entry) : async () {
    phone_book.put(name,entry);
  };

  public query func lookup(name:Name) : async ?Entry {
    phone_book.get(name) // return phone_book.get(name);

  };

};
