extends Node3D


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute("user://tutorials/3d/img")
	%SubViewport.msaa_3d = Viewport.MSAA_2X
	%AALabel.text = "2× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_msaa_2x.png")

	%SubViewport.msaa_3d = Viewport.MSAA_4X
	%AALabel.text = "4× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_msaa_4x.png")

	%SubViewport.msaa_3d = Viewport.MSAA_8X
	%AALabel.text = "8× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_msaa_8x.png")
	%SubViewport.msaa_3d = Viewport.MSAA_DISABLED

	%SubViewport.screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
	%AALabel.text = "FXAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_fxaa.png")
	%SubViewport.screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED

	%SubViewport.use_taa = true
	%AALabel.text = "Temporal AA"
	for i in 30:
		# Wait for TAA to fully converge.
		await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_taa.png")
	%SubViewport.use_taa = false

	%SubViewport.scaling_3d_scale = 1.5
	%AALabel.text = "2.25× SSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_ssaa_2.25x.png")

	%SubViewport.scaling_3d_scale = 2.0
	%AALabel.text = "4× SSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_ssaa_4x.png")

	OS.shell_open(ProjectSettings.globalize_path("user://tutorials/3d/img"))
	get_tree().quit()
