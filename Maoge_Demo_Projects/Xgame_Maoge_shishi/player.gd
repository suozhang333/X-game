extends CharacterBody2D

@export var speed = 400
# 实例变量  
var item: Node = null  

func get_input():
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed

func _physics_process(_delta):
	get_input()
	move_and_collide(velocity * _delta)

func _on_body_entered(body):
	if body.name == "Item" and not item:
		item = body
		item.get_parent().remove_child(item) # 从原父节点移除
		add_child(item) # 添加到人物节点下
		# 设置物品的位置跟随在人物左上方
		var offset = Vector2(-250, -210) # 20 向右, -50 向上（因为 Y 轴是向下的）  
		item.position = self.position + offset

	
