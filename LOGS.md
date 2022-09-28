

BUG FIXES:
[

-Inconsitency in jump pad movement
*Use is_on_floor() and motion.y > 0
*Dont add to the speed of movement effects with jump speed, set the value (ref, Happy Hop)

]

Animation:
*Duplicating keys, auto set at active frame

*queue_free() = Remove a node from the game instead of hiding it

RigidBody2d
-Not controlled directly
-Forces are applied to it
-Great for objects moved by something else, not player control

KinematicBody2D
-Controlled directly
-not affected by 2d physics engine 
-Meant for player control

Delta
-Time in seconds between frames
-Makes things not frame dependant

Layer
-Set an object to a specific layer to exist
Mask
-Set which layer to interact with




