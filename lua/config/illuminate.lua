require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetypes_denylist = {},
    filetypes_allowlist = {
	'javascript',
	'php',
	'twig',
    },
    under_cursor = true,
    min_count_to_highlight = 2,
    case_insensitive_regex = false,
})
