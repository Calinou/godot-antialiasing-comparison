extends Node3D


func _ready() -> void:
	DirAccess.make_dir_recursive_absolute("user://tutorials/3d/img")

	%NoAALabel.text = "Scale 1.0 (Native)"

	%AASubViewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	%AASubViewport.scaling_3d_scale = 0.5
	%AALabel.text = "Bilinear Scale 0.5"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/resolution_scaling_bilinear_0.5.png")

	%AASubViewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR
	%AALabel.text = "FSR1 Scale 0.5"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/resolution_scaling_fsr1_0.5.png")

	%NoAASubViewport.msaa_3d = Viewport.MSAA_4X
	%NoAALabel.text = "Scale 1.0 (Native)\n4× MSAA"
	%AASubViewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	%AASubViewport.msaa_3d = Viewport.MSAA_4X
	%AALabel.text = "Bilinear Scale 0.5\n4× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/resolution_scaling_bilinear_msaa_4x_0.5.png")

	%AASubViewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_FSR
	%AALabel.text = "FSR1 Scale 0.5\n4× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/resolution_scaling_fsr1_msaa_4x_0.5.png")

	%NoAASubViewport.msaa_3d = Viewport.MSAA_DISABLED
	%NoAALabel.text = "No antialiasing"
	%AASubViewport.msaa_3d = Viewport.MSAA_DISABLED
	%AASubViewport.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	%AASubViewport.scaling_3d_scale = 1.0

	%AASubViewport.msaa_3d = Viewport.MSAA_2X
	%AALabel.text = "2× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_msaa_2x.png")

	%AASubViewport.msaa_3d = Viewport.MSAA_4X
	%AALabel.text = "4× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_msaa_4x.png")

	%AASubViewport.msaa_3d = Viewport.MSAA_8X
	%AALabel.text = "8× MSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_msaa_8x.png")
	%AASubViewport.msaa_3d = Viewport.MSAA_DISABLED

	%AASubViewport.screen_space_aa = Viewport.SCREEN_SPACE_AA_FXAA
	%AALabel.text = "FXAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_fxaa.png")
	%AASubViewport.screen_space_aa = Viewport.SCREEN_SPACE_AA_DISABLED

	%AASubViewport.use_taa = true
	%AALabel.text = "Temporal AA"
	for i in 30:
		# Wait for TAA to fully converge.
		await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_taa.png")
	%AASubViewport.use_taa = false

	%AASubViewport.scaling_3d_scale = 1.5
	%AALabel.text = "2.25× SSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_ssaa_2.25x.png")

	%AASubViewport.scaling_3d_scale = 2.0
	%AALabel.text = "4× SSAA"
	await RenderingServer.frame_post_draw
	get_viewport().get_texture().get_image().save_png("user://tutorials/3d/img/antialiasing_ssaa_4x.png")

	OS.shell_open(ProjectSettings.globalize_path("user://tutorials/3d/img"))
	get_tree().quit()
