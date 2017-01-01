module Screeps.Id(Id(..), class HasId, id) where

import Control.Category           ((<<<))
import Control.Monad.Eff          (Eff)

import Data.Argonaut.Encode.Class (class EncodeJson, gEncodeJson)
import Data.Argonaut.Decode.Class (class DecodeJson, gDecodeJson)
import Data.Generic               (class Generic,    gEq, gShow)
import Data.Eq                    (class Eq)
import Data.Maybe                 (Maybe(..))
import Data.Show                  (class Show)

import Screeps.FFI                (unsafeField)
import Screeps.Effects            (TICK)

class HasId a

newtype Id a = Id String

-- | Get a unique id of an object.
id :: forall a. HasId a => a -> Id a
id  = unsafeField "id"

idAsString :: forall a. Id a -> String
idAsString (Id s) = s

-- | This is unsafe method, for restoring objects by id stored in memory.
-- | WARNING: This is somewhat unsafe method, since the object is never checked for its type!
foreign import unsafeGetObjectById :: forall a. Id a -> Maybe a

-- | WARNING: This is somewhat unsafe method, since the object should be checked for its type!
foreign import unsafeGetObjectByIdEff :: forall a e. Eff (tick :: TICK | e) (Id a) -> (Maybe a)

derive instance genericId    :: Generic    (Id a)
instance        eqId         :: Eq         (Id a) where eq         = gEq
instance        showId       :: Show       (Id a) where show       = gShow
instance        decodeJsonId :: DecodeJson (Id a) where decodeJson = gDecodeJson
instance        encodeJsonId :: EncodeJson (Id a) where encodeJson = gEncodeJson
