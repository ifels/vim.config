set nu
set backspace=indent,eol,start
set incsearch

set sw=4
set ts=4

set nocompatible               " be iMproved
filetype off                   " required!

set tags=~/.vim/stdtags,tags,.tags,../tags
set tags+=/usr/local/go/tags
"set tags+=/home/ifels/work/go/tags
set completeopt=longest,menu

" Enable pathogen
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on     " required!
filetype plugin on
syntax on



" encodings detect
set encoding=utf-8
set fenc=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,cp936,gbk,big5


if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
	set ambiwidth=double
endif
set nobomb
let g:fencview_autodetect=0

set t_Co=256 
colorscheme molokai "设置色彩方案

set laststatus=2      " 总是显示状态栏
hi StatusLine cterm=bold ctermfg=black ctermbg=gray
function! CurDir() 
	let curdir = substitute(getcwd(), $HOME, "~","g") 
	return curdir  
endfunction

hi Pmenu gui=bold ctermbg=DarkGreen
hi PmenuSel ctermfg=White ctermbg=DarkBlue guifg=White guibg=DarkBlue

"""""""""""""""""""""""""""""""
"" powerline setting
"""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
"set guifont=Sauce\ Code\ Powerline\ Medium.otf

"""""""""""""""""""""""""""""""
"" taglist setting
"""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = 'ctags'

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1 

"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1

"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window = 1      

"让当前不被编辑的文件的方法列表自动折叠起来 
let Tlist_File_Fold_Auto_Close=1

"显示taglist菜单
let Tlist_Show_Menu=1

"启动vim自动打开taglist 
"let Tlist_Auto_Open=1

"""""""""""""""""""""""""""""""
"NERD Tree setting
"""""""""""""""""""""""""""""""
let NERDChristmasTree=1
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=30


"""""""""""""""""""""""""""""""
"MiniBufExplorer setting
""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMoreThanOne=0
	
"""""""""""""""""""""""""""""""
"" winManager setting
"""""""""""""""""""""""""""""""
"设置界面分割
let g:NERDTree_title='NERD Tree'
let g:winManagerWindowLayout='NERDTree,BufExplorer'

"设置winmanager的宽度，默认为25 
let g:winManagerWidth = 30

nmap <leader>wm :WMToggle<CR> 
" 垂直分割当前窗口
nmap <leader>wv <C-w>v  
" 水平分割当前窗口
nmap <leader>ws <C-w>s
" 关闭当前窗口
nmap <leader>wc <C-w>c
nmap <leader>wj <C-w>j 
nmap <leader>wh <C-w>h
nmap <leader>wl <C-w>l
nmap <leader>wk <C-w>k

nmap <leader>nt :NERDTreeToggle<CR>
nmap <leader>tl :TlistToggle<CR>
nmap <leader>tb :TagbarToggle<CR>
nmap <silent> <F3> :set hlsearch!<CR>:echo ":set hlsearch=". &hlsearch<CR>
"""""""""""syntasitc""""""""""""""""
let g:syntastic_ignore_files=[".*\.py$"]

""""""""""""YCM""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

" markdown language setting
let g:vim_markdown_folding_disabled=1

""----- python ------"""
autocmd FileType python setlocal et sta sw=4 sts=4

"""---- golang -------""""
au BufRead,BufNewFile *.go set filetype=go
autocmd FileType go autocmd BufWritePre <buffer> Fmt
let g:gofmt_command="goimports"
let g:go_fmt_fail_silently = 1
let g:godef_split=2
let g:godef_same_file_in_same_window=1
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

