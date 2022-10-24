

BUG FIXES:
[

-Inconsitency in jump pad movement
*Use is_on_floor() and motion.y > 0
*Dont add to the speed of movement effects with jump speed, set the value (ref, Happy Hop)

]

Static - Dont move 
Rigidbody - Moved by forces, doesnt move itself, is moved
Kinematicbody - Moves itself
vehiclebody - inherits rigidbody


remote: other players 
sync: other players and me 



[

rpc = tcp
unreliable = udp

rpc("do_thing")
rpc_id(int id, "do_thing)
rpc_unreliable("do_thing")
rpc_id_unreliable(int id, "do_thing)

]


*Static Body with a colision shape prevents things passing through

Signals
-Great for linking an event to another node

Groups are broadcasts
-get_tree().call_group()

Animation:
*Duplicating keys, auto set at active frame

*Visibility Notifier
-Can delete an object if off screen 

*queue_free() = Remove a node from the game instead of hiding it

Area2D
-Used for entities that trigger when touched

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




