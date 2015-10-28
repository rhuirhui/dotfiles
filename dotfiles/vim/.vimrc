" Vim config file
" Part of GuiltyDolphin's dotfiles
" Hosted at: https://www.github.com/GuiltyDolphin/config

set nocompatible              " be iMproved


" Vundle {{{

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Disable to stop Vundle from using syntax plugins.
let g:use_syntax_plugins = 1

if g:use_syntax_plugins
  Plugin 'lervag/vimtex'
  Plugin 'lesliev/vim-inform7'       " Syntax file highlighting for inform
  Plugin 'vim-ruby/vim-ruby'         " Convinient bindings for Ruby
  Plugin 'Twinside/vim-haskellConceal'
  " Plugin 'pbrisbin/vim-syntax-shakespeare'  " Highlighting for Yesod Shakespeare
  Plugin 'ehamberg/vim-cute-python'
endif

" Disable to stop large plugins being used (>10M)
let g:use_big_plugins = 1

if g:use_big_plugins
  Plugin 'valloric/youcompleteme'    " Code completion
endif


Plugin 'altercation/vim-colors-solarized' " Solarized colorscheme
Plugin 'bitc/vim-hdevtools'
Plugin 'dbakker/vim-lint'
Plugin 'eagletmt/neco-ghc'
Plugin 'honza/vim-snippets.git'    " Default ultisnips snippets
Plugin 'jpalardy/vim-slime'        " One way communication to a tmux session
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'      " Syntax error checking
Plugin 'sirver/ultisnips'          " Snippet integration
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'        " Git integration
Plugin 'tpope/vim-surround'        " Allow manipulation of surrounding characters
Plugin 'godlygeek/tabular'         " Text filtering and alignment
Plugin 'plasticboy/vim-markdown'   " Must come after 'godlygeek/tabular'

Plugin 'guiltydolphin/tex-headings-vim' " Who doesn't love to change section headers?

call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Colorscheme {{{
syntax on
set t_Co=256
set background=dark
colorscheme solarized
" }}}

" Custom mappings {{{

" Standard {{{
" Space as leader.
let mapleader = "\<Space>"
nnoremap <Space> <nop>
" Comma as local leader.
let maplocalleader = ','
nnoremap , <nop>

" Provide alternate methods of reversing find.
nnoremap \ ,
nnoremap ,, ,

" Move in actual lines rather than virtual
nnoremap <silent> k gk
nnoremap <silent> j gj

" Open .vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc
nnoremap <silent> <leader>sv :source $MYVIMRC<cr>

" Use ; to access command-line
nnoremap ; :
nnoremap : ;
xnoremap ; :
xnoremap : ;

" Faster saving
nnoremap <silent> <leader>w :write<cr>

" Turn off highlighting for last search
nnoremap <silent> <leader>cs :nohlsearch<CR>

" Toggle spell-checking for current buffer
nnoremap <silent> <leader>cS :setlocal spell!<CR>

" Avoid tmux conflict
nnoremap <silent> <c-n> <nop>

" }}}

" Plugins {{{

" Toggle tagbar window
nnoremap <silent> <leader>b :TagbarToggle<cr>
" Open ctrlp tag window
nnoremap <silent> <leader>p :CtrlPTag<cr>
" Toggle NERDTree window
nnoremap <silent> <leader>n :NERDTreeToggle<cr>

" Ultisnips
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsExpandTrigger = "<c-b>"

" fugitive {{{
nnoremap <silent> <leader>ga :Git add %<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gd :Git diff %<cr>
" }}}
" }}}

" Filetypes {{{

augroup HaskellKeys
  autocmd!
  au FileType haskell nnoremap <buffer> <localleader>ct :HdevtoolsType<cr>
  au FileType haskell nnoremap <buffer> <localleader>cc :HdevtoolsClear<cr>
  au FileType haskell nnoremap <buffer> <localleader>ci :HdevtoolsInfo<cr>
augroup END

augroup RubyKeys
  autocmd!
  au FileType ruby nnoremap <silent><buffer> <localleader>rt :!rake test<cr>
  au FileType ruby nnoremap <buffer> <localleader>ir :exec "!irb" . ruby_version<cr>
augroup END

augroup GitCommitKeys
  autocmd!
  au FileType gitrebase nnoremap <silent><buffer> <localleader>r ^ciwreword<esc>
  au FileType gitrebase nnoremap <silent><buffer> <localleader>s ^ciwsquash<esc>
  au FileType gitrebase nnoremap <silent><buffer> <localleader>e ^ciwedit<esc>
  au FileType gitrebase nnoremap <silent><buffer> <localleader>p ^ciwpick<esc>
  au FileType gitrebase nnoremap <silent><buffer> <localleader>f ^ciwfixup<esc>
  au FileType gitrebase nnoremap <silent><buffer> <localleader>x ^ciwexec<esc>
augroup END

augroup VimKeys
  autocmd!
  au FileType vim nnoremap <silent><buffer> <localleader>sf :source %<cr>
augroup END

augroup GenericTeXKeys
  autocmd!
  au FileType lhaskell,tex,plaintex nnoremap <silent><buffer> <localleader>hh :call TeXHeaderHigher()<cr>
  au FileType lhaskell,tex,plaintex nnoremap <silent><buffer> <localleader>hl :call TeXHeaderLower()<cr>
augroup END
" }}}
" }}}

" Abbreviations {{{

cnorea fl function-list

" }}}

" Options {{{

" Boolean options {{{

" Line numbers
set number         " Display line numbers on left
set relativenumber " Display line numbers relative to current
" Indenting {{{
set autoindent     " Keep indentation of previous line
set copyindent     " Copy indent character used for previous line
set shiftround     " Round autoindenting to a multiple of 'shiftwidth'
set expandtab      " Expand tabs to spaces
set smarttab       " Insert tabs according to shiftwidth
" }}}
" Searching {{{
set ignorecase     " Ignore cases in searches
set smartcase      " Override 'ignorecase' if pattern contains upper case characters
set hlsearch       " Highlight matches for last search
set incsearch      " Highlight next match
" }}}
set hidden         " Hide buffers instead of closing
set nowrap         " Don't show lines wrapping in the buffer
set noerrorbells   " Don't use alerts for errors that have messages
" Backups
set noswapfile     " Don't use swap files for the current buffer
set nobackup       " Don't make backup copies of files when overwriting
"set notimeout     " Allow umlimited time to enter symbols (mathematic.vim)
" }}}

" Number options {{{
" Indenting {{{
set laststatus=2 " Shows the statusline.
set shiftwidth=2 " Generally use 2 spaces for indenting
set softtabstop=2
set tabstop=2
" }}}
" Bash {{{
let g:is_bash = 1 " Default to using bash as filetype.
let g:sh_fold_enabled = 5 " Enable function & if/do/for folding.
" }}}
" }}}

" String options {{{
" Spelling {{{
set dictionary+=/usr/share/dict/words
set dictionary-=/usr/share/dict/words " Avoid duplicate words
set spelllang=en_us " Language to use when spell-checking
" }}}
set backspace=indent,eol,start        " Use backspace jumping in insert mode

" Statusline {{{
set statusline=                 " clear stl for when reloaded
set statusline+=%f\             " Path to the file
set statusline+=[%h%m%r%w]\ -\  " Flags
set statusline+=FileType:       " Label
set statusline+=%y              " Filetype of the file
set statusline+=%=              " Switch to the right side
set statusline+=(%l,\ %c)       " Current line, current column
set statusline+=/               " Separator
set statusline+=%-L             " Total # lines
set statusline+=%4p             " Percentage through file (lines)
" }}}
" }}}

" Variable {{{
" Plugins {{{
" Syntastic {{{
let g:syntastic_python_checkers = ["python", "pep8", "pylint"]
let g:syntastic_python_pylint_quiet_messages = {
            \ "regex": "\\(parens after u'print'"
            \ . "\\|Redefining built-in 'file'\\)" }
let g:syntastic_ruby_checkers = ["mri", "rubylint", "rubocop"]
let g:syntastic_haskell_checkers = ["hdevtools", "hlint"]
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ["perl", "podchecker"]
let g:syntastic_haskell_hdevtools_quiet_messages = { "regex": 'Could not find module' }
" }}}
" vim-slime {{{
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
" }}}
" YouCompleteMe {{{
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_insertion = 1 " Autoclose the info window popup when leaving insert mode
" }}}
" haskellmode {{{
let g:haddock_browser = "/usr/bin/lynx"
let g:ghc = "/usr/bin/ghc"
" }}}
" }}}
" }}}

" FileTypes {{{
" Ruby {{{
let ruby_version = "2.0" " Preferred ruby version
" }}}
" }}}
" }}}

" Plugin Config {{{
" haskellmode {{{
"augroup HaskellMode
"  autocmd!
"  au BufEnter *.hs compiler ghc
"augroup END
" }}}
" }}}

" Autocommands {{{

" Buffer-based {{{

" Delete trailing whitespace when saving
augroup writer
    autocmd!
    autocmd BufWritePre * :%s/\v\s+$//e
augroup END

" Automatically jump to (and center on) last place in file
augroup newfile
    autocmd!
    autocmd BufRead * execute 'normal!' . "'" . '"zz'
augroup END
" }}}

" Bash {{{
augroup bash
  autocmd!
  autocmd FileType bash :setlocal foldmethod=syntax
" }}}

" Inform {{{
augroup inform7
  autocmd!
  au FileType inform7 setlocal noexpandtab
augroup END
" }}}

" Python {{{
augroup Python
  autocmd!
  autocmd FileType python nnoremap <buffer> <localleader>ra :call <SID>PythonTestAll()<CR>
  autocmd FileType python set shiftwidth=4
augroup END

function! s:PythonTestAll()
  let test_file = expand("test_") . expand("%")
  if filereadable("setup.py")
    execute "!python3 setup.py test"
  elseif filereadable("../setup.py")
    execute "!cd ..;python3 setup.py test;cd -"
  else
    echo "No tests found"
  endif
endfunction
" }}}

" Vim {{{
augroup Vim
  autocmd!
  au FileType vim :setlocal foldmethod=marker
augroup END
" }}}

" Haskell {{{
augroup Haskell
  autocmd!
  au FileType haskell setlocal omnifunc=necoghc#omnifunc
  au FileType haskell let g:ycm_semantic_triggers={'haskell' : ['.', '= ', '> ', '- ', ':: '] }
augroup END
" }}}
" }}}

" Hasktags (tagbar) {{{
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
    \ }
" }}}

" Custom functions {{{
" Haskell {{{

" Attempts to generate a suitable Haskell module name for the
" current file.
"
" If the file is part of a cabal project (i.e there exists a .cabal file)
" then the name can be generated intelligently, otherwise the basename
" of the file (without the extension) will be used.
"
" Example:
" If the project is /stuff/cabal-dir/src/Foo/Bar/Baz.hs then the generate
" module name will be Foo.Bar.Baz
"
" If there were no directory containing a .cabal file, then the generated
" module name would be Baz.
function! HaskellModuleName()
 let cabal_path = ProjectRootDirectory("%", "haskell")
 if expand("%") =~ '\v^$'
   echoerr "Not in a valid module file"
   return -1
 endif
 if cabal_path =~ '\v^$'
   return expand("%:t:r")
 endif
 let full_path = expand("%:p:r")
 let below_cabal = substitute(full_path, cabal_path, "", "")
 let module_path = matchlist(below_cabal, '\v/[^/]+/(.*)')[1]
 return substitute(module_path, '/', '.', 'g')
endfunction

" }}}

" Misc {{{

" Project {{{
let s:project_root_globs = {
      \ 'ruby' : '{r,R}akefile',
      \ 'python' : 'setup.py',
      \ 'haskell' : "*.cabal",
      \ }

" Use these if project directory cannot be found.
let s:project_common_root_globs = ['LICEN{S,C}E', 'README*', '.git']
let s:project_root_smartypants = 1

" Attempt to find the root project directory for a file.
"
" Only really works if there is a standard file (or directory structure)
" that indicates the root of a project - e.g, for Haskell (Cabal) projects,
" there is usually a .cabal file at the root of the project.
"
" Optional arguments:
" a:1 - Path to use, defaults to the current path (%:p).
" a:2 - Project type, defaults to the current filetype.
function! ProjectRootDirectory(...)
  let start_path = fnamemodify(get(a:000, 0, "%"), ":p")
  let project_type = get(a:000, 1, &filetype)
  let backup_match = ListToGlob(s:project_common_root_globs)
  if has_key(s:project_root_globs, project_type)
    let res = GlobUpDir(get(s:project_root_globs, project_type), start_path)
    if res !~ '\v^$'
      return res
    endif
  endif
  if s:project_root_smartypants
    return GlobUpDir(backup_match, start_path)
  endif
  return ''
endfunction


let s:project_test_commands = {
      \ 'ruby' : 'rake test',
      \ 'python' : 'python3 setup.py test',
      \ 'haskell' : 'cabal test',
      \ }

" Attempts to run tests for the current project.
"
" Optional arguments are the same as for *ProjectRootDirectory*
function! TestAll(...)
  let project_dir = call("ProjectRootDirectory", a:000)
  let project_type = get(a:000, 1, &filetype)
  if has_key(s:project_test_commands, project_type)
    let test_command = s:project_test_commands[project_type]
    exec '!cd ' . project_dir . ' && ' . test_command
  else
    echo "No tests found"
  endif
endfunction

" }}}

" Generate a glob pattern that will match any of the items in the
" given list.
"
" Basically, for a list ['a', 'b', 'c'], it will generate
" the pattern "{a,b,c}".
"
" Optional arguments:
" a:1 - When nonzero will produce a glob that makes the items optional
" (e.g, would produce "{a,b,c,}" for the above example).
function! ListToGlob(to_glob, ...)
  let allow_other = get(a:000, 0) ? ',' : ''
  return '{' . join(a:to_glob, ',') . allow_other . '}'
endfunction

" Starting with the directory of a:start_path, searches upwards
" for a:pattern, returning the first result or an empty string.
"
" Note that 'first result' refers to the first set of matches in a single
" directory - this may contain several individual matches.
function! GlobUp(pattern, start_path)
  let curr_dir = fnamemodify(a:start_path, ":p:h")
  while 1
    let curr_res = globpath(curr_dir, a:pattern)
    if curr_res !~ '\v^$'
      return curr_res
    endif
    " When the base-most path has been checked.
    if curr_dir =~ '\v^[./]$'
      return ''
    endif
    let curr_dir = fnamemodify(curr_dir, ":h")
  endwhile
endfunction

" The same as *GlobUp*, but will return the first directory
" containing the match, rather than all the matches.
function! GlobUpDir(pattern, start_path)
  let res = GlobUp(a:pattern, a:start_path)
  if res !~ '\v^$'
    let a_match = split(res, "\n")[0]
    return fnamemodify(a_match, ":h")
  endif
  return ''
endfunction
" }}}
" }}}
