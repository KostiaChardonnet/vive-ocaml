module ListStack = struct
  (** [empty] is the empty stack. *)
  let empty = failwith "your job"

  (** [is_empty s] is whether [s] is empty. *)
  let is_empty = failwith "your job"

  (** [push x s] pushes [x] onto the top of [s]. *)
  let push x s = failwith "your job"

  (** [Empty] is raised when an operation cannot be applied
      to an empty stack. *)
  exception Empty

  (** [peek s] is the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let peek = failwith "your job"

  (** [pop s] is all but the top element of [s].
      Raises [Empty] if [s] is empty. *)
  let pop = failwith "your job"
end

(* Now we can use the module ListStack as we want: *)

let my_pile = push 1 empty
let y = peek my_pile
let _ = print_int y


(* Now we look at signatures of modules and how
   to use them*)

(* First, declare the signature of a module "ComparableType"
   In contains a type "t" and a function "equal" on "t"*)
module type ComparableType =
  sig
    type t
    val equal : t -> t -> bool
  end

(* Then declare a functor "Set" that take as input a "ComparableType"
   and return a module "Set". *)
module Set (C : ComparableType) =
  struct
    type t = C.t
    type t_set = t list
    let empty = failwith "your job"
    let is_empty = failwith "your job"
    let rec add x s = failwith "your job"
    let rec is_in x s = failwith "your job"
    let remove x s = failwith "your job"
    let union s s' = failwith "your job"
    let inter s s' = failwith "your job"
  end


(* We create an instance of the module "ComparableType" using
   Int. We need to specify "with type t = int" otherwise the
   type checker won't be able to recognize that "t" and "int" are the same
*)
module ComparableInt : ComparableType with type t = int  =
  struct
    type t = int
    let equal x y = x = y
  end

(* Then create the Set of Int *)
module M = Set(ComparableInt)

(* you can now use M *)
let my_empty_set = M.empty
let set_123 = M.add 1 (M.add 2 (M.add 3 my_empty_set))

(* Works trivially with Integer, but let us say you wanted
   to use float with some approximation (for instance you want
   0.000001 = 0.00001 ?) Then you need to define your own "equal"
   on ComparableType, you can't just use the "=" of OCaml*)
