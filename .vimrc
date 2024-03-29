set nocompatible

" =====================
" Vundle plugin manager
" =====================
filetype off

" Syntastic (and possibly other plugins?) don't work well with fish.
set shell=zsh

" Load vundle
call plug#begin()

" System
Plug 'kana/vim-arpeggio'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'antoinemadec/coc-fzf'
Plug 'scrooloose/nerdcommenter'
" brackets
Plug 'tpope/vim-surround'
" sets some defaults
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim'
Plug 'wesQ3/vim-windowswap'
" See https://cirw.in/blog/bracketed-paste
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'haya14busa/vim-poweryank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'

" Languages
Plug 'nvie/vim-flake8'
Plug 'w0rp/ale'
Plug 'JuliaLang/julia-vim'
Plug 'dag/vim-fish'
Plug 'kchmck/vim-coffee-script'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'kkoomen/vim-doge'

Plug 'knsh14/vim-github-link'

" Fun, but not useful
Plug 'altercation/vim-colors-solarized'

" Why is this not run automatically?
source ~/.vim/plugged/vim-colors-solarized/autoload/togglebg.vim

call plug#end()

" Toggle background using F5

" Careful with this: http://stackoverflow.com/a/16433928
syntax enable
filetype plugin indent on

" ==========================================================
" Basic Settings
" ==========================================================

set encoding=utf-8

" Add language/tool-specific paths
set rtp+=$GOROOT/misc/vim  " Go

" On silly ubuntu, they install vim stuff into that, but
" don't have that as a default vim path...
set rtp+=/usr/share/vim/addons

""" Visual
set synmaxcol=2048         " because long lines are slow!

set t_Co=16                " See http://stackoverflow.com/a/5561823
let g:solarized_termcolors=16
set background=dark        " We are using dark background in vim
colorscheme solarized      " rock on

let g:airline_solarized_bg='dark'

set cursorline             " have a line indicate the cursor location
set ruler                  " show the cursor position all the time
set showmatch              " Briefly jump to a paren once it's balanced
set nowrap                 " don't wrap text
set linebreak              " don't wrap text in the middle of a word
set listchars=tab:→·,trail:·,precedes:«,extends:»  " Could also use ▸ for tab?
set list

set number                 " Display line numbers
set numberwidth=1          " using only 1 column (and 1 space) while possible
set title                  " show title in console title bar

""" Moving Around
set nostartofline     " Don't put the cursor in the first col on pgup/down
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=3       " Keep 3 context lines above and below the cursor
set foldmethod=indent " allow us to fold on indents
set foldlevel=99      " don't fold by default

""" Searching
set ignorecase " Ignore case when typing all lowercase...
set smartcase  " ...but match case as soon as there's one uppercase
set gdefault   " Always add a 'g' at the end: s/foo/bar/g
set incsearch  " Incrementally search while typing a /regex
set hlsearch   " Highlight all occurences of the search term. (stop with f+n)

""" Editing
set backspace=2       " Allow backspacing over autoindent, EOL, and BOL
set autoindent        " always set autoindenting on
set nosmartindent     " don't use smart indent, it is annoying with #
set smarttab          " handle tab keypresses more intelligently tho.
set tabstop=4         " <tab> inserts 4 spaces
set shiftwidth=4      " And an indent level is 4 spaces wide.
set softtabstop=4     " <BS> over an autoindent deletes both spaces.
set expandtab         " Use spaces, not tabs, for autoindent/tab key.
set shiftround        " rounds indent to a multiple of shiftwidth

"""" Reading/Writing
set hidden           " Allow having multiple files opened w/o saving (including undo history)
set noautowrite      " Never write a file unless I request it.
set noautowriteall   " NEVER.
set noautoread       " Don't automatically re-read changed files.
set modeline         " Allow vim options to be embedded in files;
set modelines=5      " they must be within the first or last 5 lines.
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set wildmenu         " Menu completion in command mode on <Tab>
set wildmode=full    " <Tab> cycles between all matching choices.
                     " ...except for these
set wildignore+=*.o,*.obj,.git
set wildignore+=*.pyc,eggs/**,*.egg-info/**

set lazyredraw       " This speeds up repeated macro execution.

" TODO: Use airline for statusline?
set ls=2         " always show status line
set confirm      " Y-N-C prompt if closing with unsaved changes.
set showcmd      " Show incomplete normal mode commands as I type.
set report=0     " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler        " Show some info, even without statuslines.
set laststatus=2 " Always show statusline, even if only 1 window.
set cmdheight=2  " Give more space for displaying messages

set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})
" %{fugitive#statusline()} shows the current git branch.
autocmd VimEnter * if exists('fugitive') | set statusline+=\ %{fugitive#statusline()} | endif

" ==========================================================
" Keymaps
" ==========================================================
"
"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Better automatic brackets
" "inoremap        (  ()<Left>
" "inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
" "inoremap        {  {}<Left>
" "inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
" "inoremap        [  []<Left>
" "inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

call arpeggio#load()

" For versions before 7.3.487, arpeggio will screp up jk columns.
" On ubuntu, use https://launchpad.net/~nmi/+archive/vim-snapshots
" Or just use a saner distro, like arch...

" j and k at the same time instead of escape to leave edit mode
call arpeggio#map('iv', '', 1, 'jk', '<Esc>')

" jo opens the ctrl-p file opener, fe the NERDTree.
" call arpeggio#map('niv', '', 1, 'jo', ':CtrlP<cr>')
" call arpeggio#map('niv', '', 1, 'ft', ':NERDTreeFocus<cr>')

" jc toggles the current line's comment state.
call arpeggio#map('nv', '', 1, 'jc', '<leader>c<space>')
call arpeggio#map('i', '', 1, 'jc', '<ESC><leader>c<space>a')
" f+n for stopping highlighting of search results.
call arpeggio#map('n', '', 1, 'fn', ':noh<CR>')

" map f+hjkl to home/pgup/down/end
call arpeggio#map('nv', '', 1, 'fh', '^')
call arpeggio#map('nv', '', 1, 'fj', '<C-D>')
call arpeggio#map('nv', '', 1, 'fk', '<C-U>')
call arpeggio#map('nv', '', 1, 'fl', '$')

" Makes it easy to un-highlight the previous search.
call arpeggio#map('nv', '', 1, 'fw', ':noh<cr>')

let g:arpeggio_timeoutlen=70

" Run pep8
"let g:pep8_map='<leader>8'

" vv splits the window vertically
map vv <C-w>v<C-w>l

" Yank over SSH
map <Leader>y <Plug>(operator-poweryank-osc52)

" For mac os x if the terminal is setup as in
" http://od-eon.com/blogs/liviu/macos-vim-controlarrow-functionality/
" Still isn't perfect.
noremap <Esc>A <C-W>k
noremap <Esc>C <C-W>l
noremap <Esc>D <C-W>h
noremap <Esc>B <C-W>j

" turn of arrow keys in escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Next and Last
" -------------

" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
" Taken from http://news.ycombinator.com/item?id=3122084

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" Allow saving of files as sudo when I forgot to start vim using sudo.
" Thank you http://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
cmap w!! w !sudo tee > /dev/null %

" ===========================================================
" Other plugin-specific settings
" ===========================================================

" Not sure what's up with Py3, watching https://github.com/Valloric/YouCompleteMe/issues/1278
" YouCompleteMe doesn't work with python3, which is the default on Arch.
"let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
" Doesn't the name say it all already?
let g:ycm_autoclose_preview_window_after_insertion = 1

"let g:flake8_show_in_file=1

" ===========================================================
" add more file types
" ===========================================================
au! Syntax opencl source ~/.vim/syntax/opencl.vim
au BufRead,BufNewFile *.cl set filetype=opencl

" ===========================================================
" FileType specific changes
" ===========================================================

" Markdown: don't fold anything initially.
let g:vim_markdown_initial_foldlevel=5

" Coffee: Fold using indentation
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
" Coffee: use 2-space indentation by default.
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Python: Don't let pyflakes use the quickfix window
"let g:pyflakes_use_quickfix = 0

" Tell supercomplete to be context-sensitive and show the doc
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview

" Python: Add the virtualenv's site-packages to vim path
if has('python')
    py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    base = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(base, 'bin/activate_this.py')
    try:
        execfile(activate_this, dict(__file__=activate_this))
    except IOError:
        # With pyvenv, `activate_this.py` doesn't exist anymore.
        # This is a mediocre replacement that works for me.
        os.environ['PATH'] = os.path.join(base, 'bin') + os.pathsep + os.environ['PATH']
        site_packages = os.path.join(base, 'lib', 'python%s' % sys.version[:3], 'site-packages')
        prev_sys_path = list(sys.path)
        import site
        site.addsitedir(site_packages)
        sys.real_prefix = sys.prefix
        sys.prefix = base
        # Move the added items to the front of the path:
        new_sys_path = []
        for item in list(sys.path):
            if item not in prev_sys_path:
                new_sys_path.append(item)
                sys.path.remove(item)
        sys.path[:0] = new_sys_path
EOF
endif

" Python: Flake8 support by changing binary
let g:python3_host_prog = '/home/pfeiffer/.pyenv/versions/flake8/bin/python'
let g:ycm_python_binary_path = 'python'
let g:ale_linters = {'python': ['flake8']}
let g:airline#extensions#ale#enabled = 1


" PTX: (Nvidia's gpu assembler) tab=8 because 4 looks ugly as fuck.
au BufNewFile,BufRead *.ptx set tabstop=8

" LaTeX: Enable wordwrapping
au BufNewFile,BufRead *.tex set wrap
au BufNewFile,BufRead *.tex set nolist

" HTML: Match < to > just like ( to )
au FileType html set matchpairs+=<:>

" Fish: fold blocks
autocmd FileType fish setlocal foldmethod=expr

" coc.nvim
" Having longer updatetime leads to noticeable delays
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <C-W>d :call CocAction('jumpDefinition', 'vsplit')<CR>


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:doge_doc_standard_python = 'numpy'

" ===========================================================
" Load local vimrc file if there is one
" ===========================================================
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Spelling
set spelllang=en_us
set spell
hi SpellBad cterm=underline


" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
set autoread


" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <silent>  <C-p> :Files <CR>

" ignore .gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
