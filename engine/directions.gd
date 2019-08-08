extends Node

const center = Vector2(0,0)
const left = Vector2(-1,0)
const right = Vector2(1,0)
const up = Vector2(0,-1)
const down = Vector2(0,1)

func random_direction() -> Vector2:
 match (randi()%4):
  0:
   return Vector2.LEFT
  1:
   return Vector2.RIGHT
  2:
   return Vector2.UP
  _:
   return Vector2.DOWN