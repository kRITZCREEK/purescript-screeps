## Module Screeps.Stores

#### `Stores`

``` purescript
class Stores a 
```

##### Instances
``` purescript
Stores AnyStore
```

#### `AnyStore`

``` purescript
data AnyStore :: Type
```

##### Instances
``` purescript
RoomObject AnyStore
Owned AnyStore
HasId AnyStore
EncodeJson AnyStore
DecodeJson AnyStore
Eq AnyStore
Structural AnyStore
Structure AnyStore
Show AnyStore
Stores AnyStore
Destructible AnyStore
```

#### `toAnyStore`

``` purescript
toAnyStore :: forall s. Structure s => s -> Maybe AnyStore
```

#### `asAnyStore`

``` purescript
asAnyStore :: forall s. Stores s => s -> AnyStore
```

#### `store`

``` purescript
store :: forall a. Stores a => a -> Store
```

#### `storeGet`

``` purescript
storeGet :: forall a. Stores a => a -> ResourceType -> Int
```

#### `storeCapacity`

``` purescript
storeCapacity :: forall a. Stores a => a -> Int
```

#### `Store`

``` purescript
newtype Store
  = Store (StrMap Int)
```

##### Instances
``` purescript
Show Store
```

#### `heldResources`

``` purescript
heldResources :: Store -> Array ResourceType
```

#### `amountHeld`

``` purescript
amountHeld :: Store -> ResourceType -> Maybe Int
```


