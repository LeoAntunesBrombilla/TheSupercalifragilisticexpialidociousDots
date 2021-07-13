local g = vim.g


g.dashboard_custom_header = O.dashboard.custom_header

g.dashboard_default_executive = 'telescope'

g.dashboard_custom_section = {
    a = {description = {'  New File            '}, command = 'DashboardNewFile'},
    b = {description = {'  Find File           '}, command = 'Telescope find_files'},
    c = {description = {'  Recently Used Files '}, command = 'Telescope oldfiles'},
    d = {description = {'  Find Word           '}, command = 'Telescope live_grep'},
    e = {description = {'  Marks               '}, command = 'Telescope marks'},
    f = {description = {'  Load Last Session   '}, command = 'SessionLoad'},
    g = {description = {'  Settings            '}, command = ':e ~/.config/nvim/lv-settings.lua'},
}
g.dashboard_custom_header = {
	"		     ) (			 _   _ _   _______                  ",
	"		    (    )			| \\ | | | | |  _  \\                 ",
	"		   ____(___			|  \\| | | | | | | |___  _ __   ___  ",
	"	    _|`--------`|		| . ` | | | | | | / _ \\| '_ \\ / _ \\ ",
	"	   (C|          |__		| |\\  \\ \\_/ / |/ / (_) | |_) |  __/ ",
	"   /` `\\          /  `\\	\\_| \\_/\\___/|___/ \\___/| .__/ \\___| ",
	"   \\    `========`    /	                       | |          ",
	"	  `'--------------'`		                   |_|          ",
}


-- g.dashboard_session_directory = '~/.cache/nvim/session'
g.dashboard_custom_footer = {"Pocco81"}

