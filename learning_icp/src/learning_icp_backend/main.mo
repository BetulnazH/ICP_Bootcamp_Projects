// Motoko

// actor -> canister -> smart contract
// actor -> actor [projeIsmi]

// import'lar

import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";




actor Tutorial{

  // değişkenler -> let -> immutable ( değiştirelemez)
  // var -> mutable (değiştirilebilir)

  // Type Language

  let isim: Text = "Betülnaz";
  let soyIsim: Text= "Hayran";

  Debug.print(debug_show ("İsim ve soyisim: " # isim # " " # soyIsim) );
 



}
