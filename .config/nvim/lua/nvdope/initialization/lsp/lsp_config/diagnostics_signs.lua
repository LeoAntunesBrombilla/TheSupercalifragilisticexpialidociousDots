local fn = vim.fn

fn.sign_define(
	"LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"}
)
fn.sign_define(
	"LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"}
)
fn.sign_define(
	"LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"}
)
fn.sign_define(
	"LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"}
)

