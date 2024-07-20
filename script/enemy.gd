extends CharacterBody2D

var speed = 40
var health = 100
var attack_damage = 20 #player damage shouldnt be here

var player_chase = false
var player = null
var player_inattack_range = false
var can_take_damage = true
 

func _physics_process(delta):
	deal_with_damage()
	update_health()
	
	if player_chase:
		position += (player.position - position)/speed
		$AnimatedSprite2D.play("walk_side")
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
			
	else:
		$AnimatedSprite2D.play("idle_side")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_range = true
		


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_range = false
		
func deal_with_damage():
	if player_inattack_range and gmanager.player_current_attack == true:
		if can_take_damage:
			health = health - attack_damage
			$iframe_timer.start()
			can_take_damage = false
			if health <=0:
				self.queue_free()


func _on_iframe_timer_timeout():
	can_take_damage = true


func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
