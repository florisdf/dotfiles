
// Configure CodeMirror Keymap
require([
	'nbextensions/vim_binding/vim_binding',   // depends your installation
], function() {
	// Swap j/k and gj/gk (Note that <Plug> mappings)
	CodeMirror.Vim.map("B", "^", "normal");
	CodeMirror.Vim.map("E", "$", "normal");
	CodeMirror.Vim.map("j", "gj", "normal");
	CodeMirror.Vim.map("k", "gk", "normal");
});
