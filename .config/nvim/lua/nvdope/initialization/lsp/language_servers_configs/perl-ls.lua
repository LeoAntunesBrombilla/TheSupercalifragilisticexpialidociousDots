require("lspconfig")["perlls"].setup {
    cmd = {
        "perl",
        "-MPerl::LanguageServer",
        "-e",
        "Perl::LanguageServer::run",
        "--",
        "--port 13603",
        "--nostdio 0",
        "--version 2.1.0"
    },
    filetypes = {"perl"},
    root_dir = vim.loop.cwd,
    settings = {
        perl = {
            fileFilter = {".pm", ".pl"},
            ignoreDirs = ".git",
            perlCmd = "perl",
            perlInc = " "
        }
    }
}
