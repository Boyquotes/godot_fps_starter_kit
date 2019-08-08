extends RigidBody
var node_blastarea = null
var node_blastcs
## The amount of damage the grenade causes when it explodes
const EX_DAMAGE = 333
var current_health = 40
## The amount of time the grenade takes (in seconds) to explode once it's created/thrown
const GRENADE_TIME = 2
## A variable for tracking how long the grenade has been created/thrown
var grenade_timer = 0

## The amount of time needed (in seconds) to wait before we destroy the grenade scene after the explosion
## (Calculated by taking the particle's life time and dividing it by the particle's speed scale)
const EXPLOSION_WAIT_TIME = 0.48
# A variable for tracking how much time has passed since the grenade exploded
var explosion_wait_timer = 0

## All of the nodes we need
var rigid_shape
var grenade_mesh
var blast_area
var blastcs
var explosion_particles

func _ready():
	## Get all of the nodes we will need
	rigid_shape = $Collision_Shape
	grenade_mesh = $Grenade
	blast_area = $Blast_Area
	explosion_particles = $Explosion
	
	## Make sure the explosion particles are not emitting, and make sure one_shot is enabled.
	explosion_particles.emitting = false
	explosion_particles.one_shot = true


func bullet_hit(damage, bullet_hit_pos):
	var bodies = blast_area.get_overlapping_bodies()
	current_health -= damage
	
	## If we're at 0 health or below, we need to spawn the broken target scene
	if current_health <= 0:
		## Make the explosion particles emit
		explosion_particles.emitting = true

		## Make the grenade mesh invisible, and disable the collision shape for the RigidBody

		for body in bodies:
			if body.has_method("EX_hit"):
				body.EX_hit(EX_DAMAGE, blast_area.global_transform)

		grenade_mesh.visible = false
		rigid_shape.disabled = true
