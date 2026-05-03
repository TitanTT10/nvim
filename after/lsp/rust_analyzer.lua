return {
	settings = {
		inlayHints = {
			enable = true,
			-- Customize specific types of hints
			parameterHints = { enable = true },
			typeHints = { enable = true },
			chainingHints = { enable = true },
			lifetimeElisionHints = { enable = true, useParameterNames = true },
		},
		-- Additional Rust analyzer configurations can go here
		diagnostics = {
			enable = true,
			experimental = { enable = true },
		},
	},
}
