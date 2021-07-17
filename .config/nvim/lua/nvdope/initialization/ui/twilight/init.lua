require("twilight").setup {
    dimming = {
        alpha = 0.25,
        color = {"Normal", "#ffffff"}
    },
    context = 10,
    expand = {
        "function",
        "method",
        "table",
        "if_statement"
    }
}
