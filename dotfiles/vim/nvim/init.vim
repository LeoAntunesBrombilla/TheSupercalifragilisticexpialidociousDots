

" =============================================================================
" GENERAL-SETTINGS:
" =============================================================================

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let &t_ut=''
filetype on
syntax on
syntax enable
" syntax sync minlines=20
filetype plugin indent on
filetype plugin on
autocmd FileType c,cpp,cs,java,kotlin setlocal commentstring=//%s


" =============================================================================
" CURSOR:
" =============================================================================
 
"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
 
set guicursor=v-c-sm:block,n-i-ci-ve:ver25,r-cr-o:hor20

" =============================================================================
" PLUGINS:
" =============================================================================

call plug#begin('~/.vim/plugged')

"-------------------=== Other ===-------------------------------
    Plug 'vim-utils/vim-man'
    Plug 'Konfekt/FastFold'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-eunuch'

"-------------------=== Code/Project navigation ===-------------
    Plug 'mbbill/undotree'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'mg979/vim-visual-multi'
    " Plug 'davidhalter/jedi-vim'

"-------------------=== Languages support ===-------------------
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'nvim-treesitter/nvim-treesitter'

    "-------------------=== Java ===-------------------
        Plug 'Dinduks/vim-java-get-set'
        Plug 'cskeeters/javadoc.vim'
        " Plug 'artur-shaik/vim-javacomplete2'

"-------------------=== Personalization ===-----------------------------
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'powerline/powerline'
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'

call plug#end()

" =============================================================================
" SETTINGS:
" =============================================================================

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set smartindent
set mouse=a
set noswapfile
set scrolloff=5
set noerrorbells
set clipboard=unnamedplus
set modelines=0
set nowrap
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set regexpengine=1              "vim 7.4 introduced weaker regex and setting that option will revert it to the older
set synmaxcol=300               " arbitrary number < 3000 (default value)
set laststatus=2
set showmode
set showcmd
set cursorline
set matchpairs+=<:>
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set number
set shell=bash
set hidden
set cmdheight=1
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
"
" Encoding
" set encoding=utf-8
set encoding=UTF-8
set fileencoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
set viminfo='100,<9999,s100
" 2000000
" https://github.com/styled-components/vim-styled-components/issues/28
set mmp=2500

" folds
set foldmethod=syntax
set nofoldenable
set foldlevel=99

" using folds:
" zo - opens folds
" zc - closes fold
" zm - increases auto fold depth
" zr - reduces auto fold depth
" zR - unfold all

" =============================================================================
" COLOR SCHEME:
" =============================================================================
let g:gruvbox_italic=1
let g:gruvbox_bold=1

set background=dark
colorscheme gruvbox
set termguicolors

" =============================================================================
" KEY BINDINGS:
" =============================================================================
" moving between tabs with leader key
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" moving between tabs
map <PageUp> :tabn<CR>
map <PageDown> :tabp<CR>
map <S-PageDown> :tabr<CR>
map <S-PageUp> :tabl<CR>
inoremap <PageUp> <Esc>:tabn<CR>
inoremap <PageDown> <Esc>:tabp<CR>
inoremap <S-PageDown> <Esc>:tabr<CR>
inoremap <S-PageUp> <Esc>:tabl<CR>


" moving to left, right, up & down
map <S-Left> <C-w>h
map <S-Down> <C-w>j
map <S-Up> <C-w>k
map <S-Right> <C-w>l

" rearranging windows to left, right, down and up
map <C-S-Left> <C-w>H
map <C-S-Down> <C-w>J
map <C-S-Up> <C-w>K
map <C-S-Right> <C-w>L

" alternative if ctrl+shift+<arrow_key> does not work in current terminal
" map <leader>q <C-w>H
" map <leader>a <C-w>J
" map <leader>d <C-w>K
" mp <leader>e <C-w>L


" deleting with arrows and backspace
" inoremap <C-w> <C-\><C-o>dB
" inoremap <C-BS> <C-\><C-o>db
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

map <leader>wr :set wrap<CR>
map <leader>nwr :set nowrap<CR>

" =============================================================================
" COC EXTENSIONS:
" =============================================================================

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-clangd',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-emmet',
    \ 'coc-highlight',
    \ 'coc-git',
    \ 'coc-gist',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-java-debug',
    \ 'coc-markdownlint',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-lua',
    \ 'coc-kotlin-dev',
    \ 'coc-marketplace',
    \ 'coc-lists',
    \ 'coc-translator',
    \ 'coc-spell-checker',
    \ 'coc-cspell-dicts',
    \ 'coc-tabnine',
    \ 'coc-sql'
\ ]

"-------------------=== coc-cspell-dicts ===-------------------------------
" cSpellExt.enableDictionaries": ["spanish"]
" cSpell.language": en,es"

" =============================================================================
" GOYO:
" =============================================================================
map <leader>gy :Goyo<CR>

" let
let g:goyo_width = 120
let g:goyo_height = 85
let g:goyo_linenr = 0


" =============================================================================
" LIMELIGHT:
" =============================================================================
map <leader>ll :Limelight!!<CR>

"limelight configs
" Default: 0.5
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"note: :Limelight = turn on limelight
":Limelight! = turn off limelight
":Limelight!! = turn on/off


" =============================================================================
" IndentLine:
" =============================================================================
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_color_term = 239

" to prevent it from hiding MARKDOWN and .json symbols
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" refer to this thread: https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json

" =============================================================================
" JAVA:
" =============================================================================
    " =============================================================================
    " JAVA FILES:
    " =============================================================================
        au BufEnter *.java :highlight java_class cterm=bold,italic
        au BufEnter *.java :match java_class /class/

    " =============================================================================
    " JAVA GETTER SETTER:
    " =============================================================================
        map <leader>sg :InsertBothGetterSetter<CR>
        map <leader>gs :InsertBothGetterSetter<CR>
        map <leader>se :InsertSetterOnly<CR>
        map <leader>ge :InsertGetterOnly<CR>

    " =============================================================================
    " ABBREVIATIONS:
    " =============================================================================
        " iab sop System.out.println(<Left><Right><Right>;<Left><Left><C-R>=Eatchar('\s')<CR>
        au FileType java :iab sopl System.out.println()<Left><Right>;<Left><Left><C-R>=Eatchar('\s')<CR>
        au FileType java :iab sopf System.out.printf()<Left><Right>;<Left><Left><C-R>=Eatchar('\s')<CR>
        au FileType java :iab jis import static ;<Left><C-R>=Eatchar('\s')<CR>
        au FileType java :iab ji import ;<Left><C-R>=Eatchar('\s')<CR>
        au FileType java :iab jp package ;<Left><C-R>=Eatchar('\s')<CR>
        " au FileType java
        " iab tfc public class TestClss()<Space>{<Left> ;<Left><C-R>=Eatchar('\s')<CR>
        " iab tfc1 public class TestClss()<Space>{<Left><Right><CR><CR><Up><Up><Down><Tab><Tab><BS><C-R>=Eatchar('\s')<CR>
        " iab tes2 import {<Left><Right><C-R>=Eatchar('\s')<CR>
        " iab testc public class TestClass()<Space>{<CR>}<C-R>=Eatchar('\s')<CR>
        " iab cl class ClassName(object):<CR><Tab>"""docstring for ClassName"""<CR>def __init__(self, arg):<CR><Tab>super(ClassName, self).__init__()<CR>self.arg = arg
        " iabbr cl class ClassName(object):<CR><Tab>"""docstring for ClassName"""<CR>def __init__(self, arg):<CR><Tab>super(ClassName, self).__init__()<CR>self.arg = arg
        " <C-R>=Eatchar('\s')<CR>

" =============================================================================
" TAGBAR:
" =============================================================================
" map <S-Tab> :TagbarOpenAutoClose<CR>
" let g:tagbar_autofocus = 1 "move cursor to tagbar as soon as it's toggled



" =============================================================================
" NERDTREE:
" =============================================================================
map <F2> :NERDTreeToggle<CR>
map <Tab> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
" let NERDTreeNodeDelimiter="😀"       "smiley face
" =============================================================================
" UNDOTREE:
" =============================================================================
nnoremap <F5> :UndotreeToggle<CR>

" =============================================================================
" USERDEFINED COMMANDS:
" =============================================================================
" https://stackoverflow.com/questions/3878692/how-to-create-an-alias-for-a-command-in-vim
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wQ wq

" =============================================================================
" SQL:
" =============================================================================
let g:omni_sql_no_default_maps = 1
" https://stackoverflow.com/questions/24931088/disable-omnicomplete-or-ftplugin-or-something-in-vim

" =============================================================================
" AIRLINE CONFIGURATION:
" =============================================================================
let g:airline_theme='minimalist' " this affects vim-airline's theme
let g:airline_powerline_fonts = 1 " affects the style, if deleted it will look 'boxy'
let g:airline#extensions#tabline#enabled = 1 " let vim-airline diplay the tabs
let g:airline#extensions#tabline#formatter = 'unique_tail' " the way the tabs are shown

" =============================================================================
" VimVisualMulti:
" =============================================================================

let g:VM_default_mappings = 0
let g:VM_maps = {}
let g:VM_maps["Add Cursor Up"] = '<C-Up>'
let g:VM_maps["Add Cursor Down"] = '<C-Down>'

" Add Cursor Down       <C-Down>    create cursors vertically
" Add Cursor Up         <C-Up>      ,,       ,,      ,,

" =============================================================================
" CocSnippets:
" =============================================================================
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)


" =============================================================================
" Vim JavacComplete2:
" =============================================================================
" if (&ft=='java')
"     " -------------------=== settings ===-------------------------------
"     " autocmd FileType java setlocal omnifunc=javacomplete#Complete
"     let g:JavaComplete_EnableDefaultMappings = 0
"     let g:JavaComplete_CheckServerVersionAtStartup = 0 " Check server version on startup. Can be disabled on slow start, or infinite recompilation. By default it is 1.
"     let g:JavaComplete_MavenRepositoryDisable = 1 " don't append classpath with libraries specified in pom.xml of your project. By default is 0.
"     let g:JavaComplete_UseFQN = 0 " use full qualified name in completions description. By default is 0.
"     let g:JavaComplete_ClosingBrace = 0 " add close brace automatically, when complete method declaration. Disable if it conflicts with another plugins.
"     let g:JavaComplete_StaticImportsAtTop = 1 " imports sorting with static imports at the top. By default this is 0.
"     let g:JavaComplete_ImportOrder = ['java.', 'javax.', 'com.', 'org.', 'net.'] " Specifies the order of import groups, when use packageName sorting type
"     let g:JavaComplete_CompletionResultSort = 1 " Sort completion results alphabetically.
"     let g:JavaComplete_IgnoreErrorMsg = 1 " When it is greater than 0, the error message will be ignored. By default it is 0.
"     let g:JavaComplete_CheckServerVersionAtStartup = 0 " Check server version on startup. Can be disabled on slow start, or infinite recompilation. By default it is 1.
"      let g:JavaComplete_JavaviLogLevel = 'debug' " enables server side logging (log4j logging levels).

"     " -------------------=== mappings ===-------------------------------
"     nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
"     nmap <leader>jR <Plug>(JavaComplete-Imports-RemovVeUnused)
"     nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
"     nmap <leader>jii <Plug>(JavaComplete-Imports-Add)
"     nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

"     nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
"     nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"     nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"     nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
"     nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
"     nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
"     nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
"     nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

"     vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
"     vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
"     vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
" endif

" =============================================================================
" FUNCTIONS:
" =============================================================================

" consume the space typed after an abbreviation:
func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc
" =============================================================================
" ABBREVIATIONS:
" =============================================================================
" iabbr <silent> 2sop System.out.println()<c-r>=Eatchar('\m\s\<bar>/')<cr>
" iabbr <silent> if if ()<Left><C-R>=Eatchar('\s')<CR>
" https://stackoverflow.com/questions/27662593/is-it-possible-to-abbreviate-two-words-in-vim-by-using-the-command-ab
" :help abbreviations

" special chars
" <Left> moves cursor to the left
" <Right> moves cursor to the right
" you get the idea...
" <C-[> deletes <Space> behind cursor and moves cursor to the left (basically moves two positions) (leaves you in commad line mode)
" <C-]> deletes <Space> in front of cursor and moves cursor to the right (basically moves two positions) (leaves you in command line mode)
" <C-R>=Eatchar('\s')<CR> to remove trailing white space






