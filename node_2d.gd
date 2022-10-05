extends Node2D


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute("user://tutorials/2d/img")
	%SubViewport.msaa_2d = Viewport.MSAA_2X
	%AALabel.text = "2× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/2d/img/antialiasing_msaa_2x.png")

	%SubViewport.msaa_2d = Viewport.MSAA_4X
	%AALabel.text = "4× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/2d/img/antialiasing_msaa_4x.png")

	%SubViewport.msaa_2d = Viewport.MSAA_8X
	%AALabel.text = "8× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/2d/img/antialiasing_msaa_8x.png")

	OS.shell_open(ProjectSettings.globalize_path("user://tutorials/2d/img"))
	get_tree().quit()
