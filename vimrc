set nocompatible
let mapleader = ","

set shell=/bin/bash

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Include user's local vim bundles
" You can also override mapleader here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vim_bundles.local"))
  source ~/.vim_bundles.local
endif

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Git in vim, use ,gs for git status then - to stage then C to commit
" check :help Gstatus for more keys
Plugin 'tpope/vim-fugitive'

" Fugitive commands for github (:GBrowse)
Plugin 'tpope/vim-rhubarb'

" Surrond stuff with things. ysiw" surrounds a word with quotes
" cs"' changes " to '
Plugin 'tpope/vim-surround'

" Lets you use . to repeat some things like vim-surround
Plugin 'tpope/vim-repeat'

" Comment with gc (takes a motion) or ^_^_
Plugin 'tomtom/tcomment_vim'

" Open a file (like cmd-t but better). Use ,f or ,j(something, see bindings
" below)
Plugin 'ctrlpvim/ctrlp.vim'

" Adds :Ack complete w/ quick fix
Plugin 'mileszs/ack.vim'

" Updates your status line to show what selector you're in in sass files
Plugin 'aaronjensen/vim-sass-status'

" Kills a buffer without closing a split, use ,w . Used in conjunction 
" with command-w, below...
Plugin 'vim-scripts/bufkill.vim'

" Smarts around killing buffers, will close the split if it's the last buffer in
" it, and close vim if it's the last buffer/split. Use ,w
Plugin 'nathanaelkane/vim-command-w'

" Shows syntax errors on several types of files
Plugin 'scrooloose/syntastic'

" Use local version of eslint
Plugin 'mtscout6/syntastic-local-eslint.vim'

" Automatically add end at the end of ruby and vim blocks
Plugin 'tpope/vim-endwise'

" Add a few paired mappings, in particular [q and ]q to navigate the quickfix
" list
Plugin 'tpope/vim-unimpaired'

" Handy file manipulations. Favorites are :Remove and :Rename
Plugin 'tpope/vim-eunuch'

" Allows custom textobj motions (like i" or a[)
Plugin 'kana/vim-textobj-user'

" Motion based on indent level. Useful in coffeescript, try vai to select
" everything on the current indent level. vii is similar, but will not ignore
" blank lines
Plugin 'kana/vim-textobj-indent'

" Tab to indent or autocomplete depending on context
Plugin 'ervandew/supertab'

" Vim coffeescript runtime files
Plugin 'kchmck/vim-coffee-script'

" Updated ruby syntax and such
Plugin 'vim-ruby/vim-ruby'

" Some syntax highlighthing for rails and :Rextract to extract partials
Plugin 'tpope/vim-rails'

" Improved javascript indentation
Plugin 'pangloss/vim-javascript'

" React & JSX highlighting
Plugin 'mxw/vim-jsx'

" Vim Git runtime files
Plugin 'tpope/vim-git'

" Vim runtime files for Haml, Sass, and SCSS
Plugin 'tpope/vim-haml'

" Vim Markdown runtime files
Plugin 'tpope/vim-markdown'

" vim handlebars runtime files
Plugin 'nono/vim-handlebars'

" Syntax for jquery keywords and selectors
Plugin 'itspriddle/vim-jquery'
"
" Vim syntax for jst files
Plugin 'jeyb/vim-jst'

" Syntax for nginx
Plugin 'mutewinter/nginx.vim'

" Makes css colors show up as their actual colors, works better with CSApprox
" or macvim
Plugin 'ap/vim-css-color'

" My favorite dark color scheme
Plugin 'mrtazz/molokai.vim'

" Decent light color scheme
Plugin 'nelstrom/vim-mac-classic-theme'

" vim powerline -  The ultimate vim statusline utility
Plugin 'Lokaltog/vim-powerline'

" Typescript syntax highlighting
Plugin 'leafgarland/typescript-vim'

" Typescript typechecking
Plugin 'Quramy/tsuquyomi'

" makes the command line behave like emacs
Plugin 'houtsnip/vim-emacscommandline'

" Adds gr command to replace text (takes a motion)
" similar to v(motion)p but also cuts text into black hole register so it is
" repeatable. So really it's similar to v(motion)"_p
Plugin 'ReplaceWithRegister'

Plugin 'henrik/vim-yaml-flattener'

call vundle#end()
filetype plugin indent on

:runtime macros/matchit.vim

" Backups and swap
set nobackup
set nowritebackup
set noswapfile
set backupdir=~/.vim/backup
set directory=~/.vim/backup


syntax on
set nohidden
set history=10000
set number
set ruler
set switchbuf=useopen
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=longest,list
set wildmenu
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled,tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache,bundler_stubs,build,error_pages,node_modules,bower_components,coverage,dist

" Status bar
set laststatus=2

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=

set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
let g:CSApprox_eterm = 1
color molokai

" Show (partial) command in the status line
set showcmd

set noerrorbells
set visualbell
set t_vb=

" Use modeline overrides
set modeline
set modelines=10

" CTags
" brew install ctags
" $ ctags -R .
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" make uses real tabs
au FileType * set expandtab
au FileType make set noexpandtab

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.hamlbars set ft=haml
au BufNewFile,BufRead *.hamlc set ft=haml
au BufNewFile,BufRead *.jst.ejs set ft=jst

" Add css highlighting for .pcss files
au BufNewFile,BufRead *.pcss set ft=css


au FileType * set softtabstop=2 tabstop=2 shiftwidth=2

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Inserts the path of the currently edited file into a command
" Command mode: %%
cmap %% <C-R>=expand("%:p:h") . "/" <CR>

" close quickfix window if no errors
let g:flow#autoclose = 1

" Make sure TSS is installed globally
" npm install -g clausreinke/typescript-tools
let g:typescript_compiler_binary = 'tsc'
let g:tsuquyomi_completion_detail = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
" let g:syntastic_quiet_warnings=1 DEPRECATED
let g:syntastic_quiet_messages = {'level': 'warnings'}

" Use local version of eslint (not global install)
" part of 'mtscout6/syntastic-local-eslint.vim'
" also need to use npm-which function in bash_profile:
" http://blog.pixelastic.com/2015/10/05/use-local-eslint-in-syntastic/
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
" let b:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))
let g:syntastic_javascript_eslint_exec = StrTrim(system('npm-which eslint'))

" show warnings in window
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
"
" syntastic config using node & eslint. Requires eslint:
"   npm install -g eslint
"   npm install -g eslint-plugin-react
" Also requires an .eslintrc file:
"   http://eslint.org/docs/user-guide/configuring
"
" to debug:
"   let g:syntastic_debug=1 (error level 1 - 3)
"
" make sure you can see version from vim
"   :echo syntastic#util#system('eslint --version')
let g:syntastic_javascript_checkers = ['eslint']

" make sure shellcheck is installed
" brew install shellcheck
let g:syntastic_sh_checkers = ['shellcheck', 'sh']
let g:syntastic_sh_shellcheck_args = "-x"

" Include .js files for jsx syntax
let g:jsx_ext_required = 0

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

"map quick quit
map <leader>qq :qa!<cr>

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" key mapping for line jumping
nmap <S-l> $
nmap <S-h> ^

" Useful for triggering a cucumber run
nmap <Leader>rc :silent !touch features/step_definitions/web_steps.rb<CR>

" Make the current directory
nmap <leader>md :silent !mkdir -p %:h<CR>:redraw!<CR>

" Show 2 lines of context
set scrolloff=2

" Make the window we're on as big as it makes sense to make it
"set winwidth=84

" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
"set winheight=5
"set winminheight=5
"set winheight=999

" don't delay when you hit esc in terminal vim, this may make arrow keys not
" work well when ssh'd in
set ttimeoutlen=5

function! SaveIfModified()
  if &modified
    :w
  endif
endfunction

"key mapping for error navigation
nmap <leader>[ :call SaveIfModified()<CR>:cprev<CR>
nmap <leader>] :call SaveIfModified()<CR>:cnext<CR>

nmap <leader>w :CommandW<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Much stuff stolen from Gary Bernhardt:
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>l :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't manage working directory
let g:ctrlp_working_path_mode = 0

map <leader>jv :let g:ctrlp_default_input = 'app/views/'<cr>:CtrlP<cr>
map <leader>jc :let g:ctrlp_default_input = 'app/controllers/'<cr>:CtrlP<cr>
map <leader>jm :let g:ctrlp_default_input = 'app/models/'<cr>:CtrlP<cr>
map <leader>jh :let g:ctrlp_default_input = 'app/helpers/'<cr>:CtrlP<cr>
map <leader>jl :let g:ctrlp_default_input = 'lib'<cr>:CtrlP<cr>
map <leader>jp :let g:ctrlp_default_input = 'public'<cr>:CtrlP<cr>
map <leader>js :let g:ctrlp_default_input = 'app/stylesheets/'<cr>:CtrlP<cr>
map <leader>jj :let g:ctrlp_default_input = 'app/javascripts/'<cr>:CtrlP<cr>
map <leader>jf :let g:ctrlp_default_input = 'features/'<cr>:CtrlP<cr>
map <leader>f :let g:ctrlp_default_input = 0<cr>:CtrlP<cr>
map <leader>u :let g:ctrlp_default_input = 0<cr>:CtrlPBuffer<cr>
map <leader><leader>f :let g:ctrlp_default_input = 0<cr>:CtrlPClearCache<cr>:CtrlP<cr>
let g:ctrlp_custom_ignore = {
\  'dir' : '\.git$\|build$\|bower_components\|node_modules\|dist\|target'
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>a :Ack!<space>
map <leader>A :Ack! <C-R><C-W><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preview window size hack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ResizePreviewWindow()
  if &previewwindow
    set winheight=999
  endif
endfunction
au WinEnter * call ResizePreviewWindow()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vroom
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vroom_map_keys = 0
let g:vroom_write_all = 1
let g:vroom_use_bundle_exec = 0
let g:vroom_spec_command = 'NOEXEC_DISABLE=1 rspec '
map <leader>t :VroomRunTestFile<cr>
map <leader>T :VroomRunNearestTest<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy paste system clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>y "*y
map <leader>p "*p
map <leader>P "*P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit<cr>
map <leader>ga :Git add --all<cr>:Gcommit<cr>
map <leader>gb :Gblame<cr>

" Use j/k in status
function! BufReadIndex()
  setlocal cursorline
  setlocal nohlsearch

  nnoremap <buffer> <silent> j :call search('^#\t.*','W')<Bar>.<CR>
  nnoremap <buffer> <silent> k :call search('^#\t.*','Wbe')<Bar>.<CR>
endfunction
autocmd BufReadCmd  *.git/index                      exe BufReadIndex()
autocmd BufEnter    *.git/index                      silent normal gg0j

" Start in insert mode for commit
function! BufEnterCommit()
  normal gg0
  if getline('.') == ''
    start
  end
endfunction
autocmd BufEnter    *.git/COMMIT_EDITMSG             exe BufEnterCommit()

" Automatically remove fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quit help easily
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! QuitWithQ()
  if &buftype == 'help'
    nnoremap <buffer> <silent> q :q<cr>
  endif
endfunction
autocmd FileType help exe QuitWithQ()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline configuration, you'll need a powerline patched font.
" You should probably use inconsolata-g (included in fonts directory)
" https://github.com/gabrielelana/awesome-terminal-fonts/wiki/OS-X
"
" If not, you can patch your own.
" See: https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher
" You'll probably need this too: https://github.com/jenius/Fontforge-Installer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_stl_path_style = 'short'
" set encoding=utf-8
" set termencoding=utf-8
" call Pl#Theme#RemoveSegment('fugitive:branch')
" call Pl#Theme#RemoveSegment('fileformat')
" call Pl#Theme#RemoveSegment('fileencoding')
" call Pl#Theme#RemoveSegment('scrollpercent')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This enables iterm cursor changes from vim. In .tmux.conf you'll need:
" set-option -g terminal-overrides '*88col*:colors=88,*256col*:colors=256,xterm*:XT:Ms=\E]52;%p1%s;%p2%s\007:Cc=\E]12;%p1%s\007:Cr=\E]112\007:Cs=\E]50;CursorShape=%?%p1%{3}%<%t%{0}%e%p1%{2}%-%;%d\007'
"
" Source: https://github.com/Casecommons/casecommons_workstation/blob/master/templates/default/dot_tmux.conf.erb
"         https://github.com/Casecommons/vim-config/blob/master/init/tmux.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if exists('$ITERM_PROFILE')
"   if exists('$TMUX')
"     let &t_SI = "\<Esc>[3 q"
"     let &t_EI = "\<Esc>[0 q"
"   else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"   endif
" end

" fix cursor in vim in tmux
" http://blog.terriblelabs.com/blog/2013/02/09/stupid-vim-tricks-how-to-change-insert-mode-cursor-shape-with-tmux/
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
inoremap <special> <Esc> <Esc>hl
set guicursor+=i:blinkwait0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This fixes pasting from iterm (and some other terminals, but you'll need to
" adjust the condition) by using "bracketed paste mode"
" I modified it to work in tmux and not wait for esc (by using f28/f29)
"
" See: http://stackoverflow.com/questions/5585129/pasting-code-into-terminal-window-into-vim-on-mac-os-x
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux wrapping borrowed from vitality.vim: https://github.com/sjl/vitality.vim
function WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

if exists('$ITERM_PROFILE')
  " I'm just setting bracketed paste mode in my bashrc now. Setting and
  " unsetting doesn't work very well with tmux as it affects other shells.
  " put this in your bashrc: [ -n "$ITERM_PROFILE" ] && printf "\e[?2004h"
  "
  " let &t_ti = WrapForTmux("\<Esc>[?2004h") . &t_ti
  " let &t_te = WrapForTmux("\<Esc>[?2004l") . &t_te
  function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction

  execute "set <f28>=\<Esc>[200~"
  execute "set <f29>=\<Esc>[201~"
  map <expr> <f28> XTermPasteBegin("i")
  imap <expr> <f28> XTermPasteBegin("")
  vmap <expr> <f28> XTermPasteBegin("c")
  cmap <f28> <nop>
  cmap <f29> <nop>
end

" Add racket support (use scheme highlighting)
if has("autocmd")
  au BufReadPost *.rkt,*.rktl set filetype=scheme
endif

" Add typescript filename support
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LAST SECTION
" Include user's local vim config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" Fix arrow keys not working in insert mode
imap <ESC>oA <ESC>ki
imap <ESC>oB <ESC>ji
imap <ESC>oC <ESC>li
imap <ESC>oD <ESC>hi
