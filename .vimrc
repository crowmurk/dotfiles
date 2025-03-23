""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   install plugins via Vundle                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                                    " no more vi"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'                          " plugin manager
" interface
Plugin 'itchyny/lightline.vim'                      " a light and configurable statusline/tabline
Plugin 'ap/vim-buftabline'                          " buffer list that lives in the tabline
" sessions
Plugin 'tpope/vim-obsession'                        " auto :mksession
Plugin 'dhruvasagar/vim-prosession'                 " plugin to handle sessions
" tmux
Plugin 'tmux-plugins/vim-tmux'                      " plugin for .tmux.conf
Plugin 'christoomey/vim-tmux-navigator'             " navigate seamlessly between vim and tmux splits
" navigation
Plugin 'scrooloose/nerdtree'                        " project and file navigation
Plugin 'majutsushi/tagbar'                          " class/module browser
" code
Plugin 'Valloric/YouCompleteMe'                     " code completion engine
Plugin 'SirVer/ultisnips'                           " snippets
Plugin 'honza/vim-snippets'                         " snippets files for various programming languages
Plugin 'vim-syntastic/syntastic'                    " syntax checking
" python
Plugin 'hdima/python-syntax'                        " enchansed python syntax highlighting
Plugin 'tweekmonster/django-plus.vim'               " improvements to the handling of django related files
Plugin 'fs111/pydoc.vim'                            " integrates python documentation system
Plugin 'tmhedberg/SimpylFold'                       " improved python folding
Plugin 'Vimjas/vim-python-pep8-indent'              " indentation behavior to comply with PEP8
Plugin 'farfanoide/vim-kivy'                        " kivy language support
" rust
Plugin 'rust-lang/rust.vim'                         " Oficial plugin
" go
Plugin 'fatih/vim-go'                               " Golang plugin
" JavaScript
Plugin 'pangloss/vim-javascript'                    " provides syntax highlighting and improved indentation
" PowerShell
Plugin 'PProvost/vim-ps1'                           " Powershell syntax and inteding
" pandoc
Plugin 'vim-pandoc/vim-pandoc'                      " integrate with the pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc-after'
" latex
Plugin 'lervag/vimtex'
Plugin 'KeitaNakamura/tex-conceal.vim'
" text
Plugin 'jiangmiao/auto-pairs'                       " insert or delete brackets, parens, quotes in pair.
Plugin 'tpope/vim-surround'                         " parentheses, brackets, quotes, XML tags, and more
Plugin 'dhruvasagar/vim-table-mode'                 " automatic table creator
" misc
Plugin 'dzeban/vim-log-syntax'                      " syntax file to highlight various log files
" Plugin 'gorodinskiy/vim-coloresque'                 " color preview for vim
" Plugin 'ap/vim-css-color'
Plugin 'lilydjwg/colorizer'
Plugin 'phongvcao/vim-stardict'                     " plugin for looking up meaning of words
Plugin 'lyokha/vim-xkbswitch'                       " atoswitch keyboard when leaving insert mode
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   set options                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" backup
set backup
set backupdir=~/.vim/backup/

" swap
set swapfile
set dir=~/.vim/swap/

" undo
set undofile
set undodir=~/.vim/undo/

" view
set viewoptions-=options
set viewdir=~/.vim/view/

" viminfo
set viminfo+=n~/.vim/viminfo

" hisory
set history=10000                                       " Размер истории
set undolevels=10000                                    " Размер отмены

" syntax highlight
syntax on
colorscheme crowmurk                                    " Включить цветовую схему

" GUI config
set guioptions-=m                                       " gVim only
set guioptions-=T
set guioptions-=r
set guioptions-=L

" search
set incsearch                                           " При поиске перескакивать на найденный текст в процессе набора строки
set ignorecase                                          " Игнорировать регистр букв при поиске
set hlsearch                                            " Подсветка найденного

" encodings
set encoding=utf8                                       " Кодировка
set termencoding=utf-8                                  " Кодировка терминала
set fileencodings=utf8,cp1251,koi8-r,cp866              " Возможные кодировки файлов и последовательность определения
set fileencoding=utf-8                                  " Кодировка при сохранения файлов

" files
set autoread                                            " Отслеживать состояние файлов и загружать изменения
set cryptmethod=blowfish2                               " Шифрование
set fileformats=unix,dos,mac                            " Поддерживаемые форматы файлов
set fileformat=unix                                     " Формат файла при сохранении

" buffers
set hidden                                              " Не требовать сохранения буфера
set tabpagemax=100                                      " Максимальное количество вкладок

" intendations
set tabstop=4                                           " Размер табуляции
set shiftwidth=4                                        " Число пробелов, используемых при автоотступе (<< >>)
set softtabstop=4
set smarttab                                            " Добавление отступа в начале строки (при нажатии TAB)
set expandtab                                           " Заменяем табуляции пробелами
set autoindent                                          " Включаем умные отступы
set smartindent

" lines
set wrap                                                " Включить перенос строк
set linebreak                                           " Перенос строк по словам, а не по буквам
set list                                                " Отображаем табуляции и конечные пробелы
set listchars=tab:→→,trail:⋅
set showmatch                                           " Показываем открывающие и закрывающие скобки
set number relativenumber                               " Показывать номера строк
set cursorline

" languages
set keymap=russian-jcukenwin                            " Поддержка переключения раскладок по ctrl+^
set iminsert=0                                          " По умолчанию латинская раскладка
set imsearch=0                                          " По умолчанию латинская раскладка при поиске
set spelllang=ru,en                                     " Поддержка проверки правописания.

" folding
set foldenable                                          " Включить сворачивание
set foldmethod=syntax
set foldlevelstart=99

" autocompletion
set wildmenu                                            " Автодополнение в коммандной строке
set completeopt=longest,menuone,preview                 " Настройка меню автодополнения
set completeopt+=noinsert,noselect
set omnifunc=syntaxcomplete#Complete

" cmdline
set laststatus=2                                        " Всегда показывать строку состояния
set ruler                                               " Постоянно показывать позицию курсора
set noshowmode                                          " Не показывать режим
set showcmd                                             " Показывать незавершенную комманду
set shortmess+=F                                        " don't give the file info

" bell
set noerrorbells novisualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   key bindings                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader key (Alt-space)
" В vim <Alt-space> не работает
" add in .tmux.conf: bind -n M-Space send-keys C-F9
" add in .Xresources: URxvt.keysym.M-space : \033[20;5~
let g:maplocalleader = ","

if has("gui_running")
    let g:mapleader = "\<M-space>"
else
    let g:mapleader = "\<C-F9>"
    " fix <alt-key> for cli
    set ttimeoutlen=1
    execute "set <M-j>=\ej"
    execute "set <M-k>=\ek"
    execute "set <M-h>=\eh"
    execute "set <M-l>=\el"
    execute "set <M-p>=\ep"
    execute "set <M-e>=\ee"
    execute "set <M-n>=\en"
    execute "set <M-b>=\eb"
endif

" Выключаем подсветку найденого
noremap <silent> <Esc> <Esc>:nohlsearch<Cr>

" Копирование текста в общий буфер обмена
noremap <silent> <leader>y "+y
noremap <silent> <leader>yy "+yy

" Вставка текста из общего буфера обмена
nnoremap <silent> <leader>i :set paste<Cr>:put +<Cr>:set nopaste<Cr>
nnoremap <silent> <leader>I :set paste<Cr>:put! +<Cr>:set nopaste<Cr>
vnoremap <silent> <leader>i s<Esc>:set paste<Cr>"+p:set nopaste<Cr>

" Вставка пустых строк
nnoremap <Enter> :set formatoptions-=cro<Cr>O<Esc>:set formatoptions+=cro<Cr>
" Востанавливаем поведение <Enter> в <quickfix> окнах
autocmd BufReadPost quickfix nnoremap <buffer> <Cr> <Cr>

" Новые окна
nnoremap <silent> <leader>s :split<Cr>
inoremap <silent> <leader>s <Esc>:split<Cr>
vnoremap <silent> <leader>s <Esc>:split<Cr>
nnoremap <silent> <leader>v :vsplit<Cr>
inoremap <silent> <leader>v <Esc>:vsplit<Cr>
vnoremap <silent> <leader>v <Esc>:vsplit<Cr>
nnoremap <silent> <leader>q :close<Cr>
inoremap <silent> <leader>q <Esc>:close<Cr>
vnoremap <silent> <leader>q <Esc>:close<Cr>

" Изменение размера окна
nnoremap <silent> <leader>j <c-w>+
inoremap <silent> <leader>j <Esc><c-w>+
vnoremap <silent> <leader>j <Esc><c-w>+
nnoremap <silent> <leader>k <c-w>-
inoremap <silent> <leader>k <Esc><c-w>-
vnoremap <silent> <leader>k <Esc><c-w>-
nnoremap <silent> <leader>h <c-w><
inoremap <silent> <leader>h <Esc><c-w><
vnoremap <silent> <leader>h <Esc><c-w><
nnoremap <silent> <leader>l <c-w>>
inoremap <silent> <leader>l <Esc><c-w>>
vnoremap <silent> <leader>l <Esc><c-w>>
nnoremap <silent> <leader>= <c-w>=
inoremap <silent> <leader>= <Esc><c-w>=
vnoremap <silent> <leader>= <Esc><c-w>=
nnoremap <silent> <leader>+ :resize<bar>vertical resize<Cr>
inoremap <silent> <leader>+ <Esc>:resize<bar>vertical resize<Cr>
vnoremap <silent> <leader>+ <Esc>:resize<bar>vertical resize<Cr>

" Прееключение буферов
nnoremap <silent> <leader>n :bnext<Cr>
inoremap <silent> <leader>n <Esc>:bnext<Cr>
vnoremap <silent> <leader>n <Esc>:bnext<Cr>
nnoremap <silent> <leader>p :bprev<Cr>
inoremap <silent> <leader>p <Esc>:bprev<Cr>
vnoremap <silent> <leader>p <Esc>:bprev<Cr>

" Переключение буфферов <leader+num>
let counter = 1
while counter <= 100
  execute "nnoremap \<silent> \<leader>" . counter . " :" . counter . "b\<Cr>"
  execute "vnoremap \<silent> \<leader>" . counter . " \<Esc>:" . counter . "b\<Cr>"
  let counter += 1
endwhile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   F1-F12 bindings                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Проверка правописания
nnoremap <silent> <F1> :set spell!<Cr>
inoremap <silent> <F1> <Esc>:set spell!<Cr>
vnoremap <silent> <F1> <Esc>:set spell!<Cr>

" Режим вставки
set pastetoggle=<F2>
nnoremap <silent> <F2> :set paste!<Cr>

" Настроки специфичные для типов файлов
augroup filetype_javascript_html
    autocmd!
    " Выполнить код
    autocmd FileType javascript,html nnoremap <buffer> <silent> <F3> :call RunCode()<Cr>
    autocmd FileType javascript,html inoremap <buffer> <silent> <F3> <Esc>:call RunCode()<Cr>
    autocmd FileType javascript,html vnoremap <buffer> <silent> <F3> <Esc>:call RunCode()<Cr>
augroup END

augroup filetype_python_sh_c_cpp_rust_go_autocmds
    autocmd!
    " Выполнить код
    autocmd FileType python,sh,c,cpp,rust,go nnoremap <buffer> <silent> <F3> :call RunCode()<Cr>
    autocmd FileType python,sh,c,cpp,rust,go inoremap <buffer> <silent> <F3> <Esc>:call RunCode()<Cr>
    autocmd FileType python,sh,c,cpp,rust,go vnoremap <buffer> <silent> <F3> <Esc>:call RunCode()<Cr>
    " Провека синтаксиса
    autocmd FileType python,sh,c,cpp,rust,go nnoremap <buffer> <silent> <F4> :call CheckCode()<Cr>
    autocmd FileType python,sh,c,cpp,rust,go inoremap <buffer> <silent> <F4> <Esc>:call CheckCode()<Cr>
    autocmd FileType python,sh,c,cpp,rust,go vnoremap <buffer> <silent> <F4> <Esc>:call CheckCode()<Cr>
    autocmd FileType qf nnoremap <buffer> <silent> <F4>  :lclose<Cr>
    " Создание тегов
    autocmd FileType python,c,cpp,rust,go nnoremap <buffer> <silent> <F5> :call TagCode()<Cr>
    autocmd FileType python,c,cpp,rust,go inoremap <buffer> <silent> <F5> <Esc>:call TagCode()<Cr>
    autocmd FileType python,c,cpp,rust,go vnoremap <buffer> <silent> <F5> <Esc>:call TagCode()<Cr>
augroup END

augroup filetype_pandoc_autocmds
    autocmd!
    " Сохранить в html
    autocmd FileType pandoc nnoremap <buffer> <silent> <F3> :Pandoc #view<Cr>
    autocmd FileType pandoc inoremap <buffer> <silent> <F3> <Esc>:Pandoc #view<Cr>
    autocmd FileType pandoc vnoremap <buffer> <silent> <F3> <Esc>:Pandoc #view<Cr>
    " Сохранить и открыть в html
    autocmd FileType pandoc nnoremap <buffer> <silent> <F4> :Pandoc! #view<Cr>
    autocmd FileType pandoc inoremap <buffer> <silent> <F4> <Esc>:Pandoc! #view<Cr>
    autocmd FileType pandoc vnoremap <buffer> <silent> <F4> <Esc>:Pandoc! #view<Cr>
    " Содержание
    autocmd FileType pandoc nnoremap <buffer> <silent> <F5> :TOC<Cr>
    autocmd FileType pandoc inoremap <buffer> <silent> <F5> <Esc>:TOC<Cr>
    autocmd FileType pandoc vnoremap <buffer> <silent> <F5> <Esc>:TOC<Cr>

    " Fast folding evaluation
    autocmd FileType pandoc let b:pandoc_folding_basic = 1

    " auto-pairs
    autocmd FileType pandoc let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '"""':'"""', "'''":"'''"}
augroup END

" Показать\спрятать номера строк
nnoremap <silent> <F10> :set<Space>number!<Space>relativenumber!<Cr>
inoremap <silent> <F10> <Esc>:set<Space>number!<Space>relativenumber!<Cr>
vnoremap <silent> <F10> <Esc>:set<Space>number!<Space>relativenumber!<Cr>

" Обозреватель файлов
nnoremap <silent> <S-F1> :NERDTreeToggle<Cr>
inoremap <silent> <S-F1> <Esc>:NERDTreeToggle<Cr>
vnoremap <silent> <S-F1> <Esc>:NERDTreeToggle<Cr>

" Обозреватель тегов
nnoremap <silent> <S-F2> :TagbarToggle<Cr>
inoremap <silent> <S-F2> <Esc>:TagbarToggle<Cr>
vnoremap <silent> <S-F2> <Esc>:TagbarToggle<Cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   develop config                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Настройка errorFormat
let &errorformat = "%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

"  при переходе за границу в 100 символов в Ruby/Python/js/C/C++ подсвечиваем текст
augroup line_char_limit_autocmds
    autocmd!
    autocmd FileType python,javascript,c,cpp,sh,ruby,rust,go autocmd BufEnter <buffer> match LineOverLength /\%100v.*/
    autocmd FileType python,javascript,c,cpp,sh,ruby,rust,go autocmd BufLeave <buffer> match none
    autocmd FileType python,javascript,c,cpp,sh,ruby,rust,go setlocal nowrap
augroup END

" Настройка компилятора C/C++
compiler gcc
set makeprg=gcc\ -g\ -Wall\ -Wextra\ -Wpedantic\ -lstdc++\ -o\ %<\ %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   plugins config                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-stardict
nnoremap <silent> <leader>m :silent! StarDictCursor<Cr>

" SimplyFold
let g:SimpylFold_docstring_preview = 1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'crowmurkGray',
    \ 'component': {
    \     'readonly': '%{&readonly?"✗":""}',
    \ },
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'spell', 'filename', 'modified' ] ],
    \ }
    \ }

" buffTabline
let g:buftabline_numbers = 1

" pyton-syntax
let g:python_highlight_all = 1

" XkbSwitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'

" UltiSnips
set runtimepath+=~/.vim/custom
let g:UltiSnipsExpandTrigger = "<M-h>"
let g:UltiSnipsListSnippets = "<M-l>"
let g:UltiSnipsJumpForwardTrigger = "<M-j>"
let g:UltiSnipsJumpBackwardTrigger = "<M-k>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/custom/UltiSnips'

" YouCompleteMe
let g:ycm_key_list_select_completion = ["<M-j>", ]
let g:ycm_key_list_previous_completion = ["<M-k>", ]
let g:ycm_key_list_stop_completion = ['<M-h>']
let g:ycm_key_invoke_completion = '<M-h>'
let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {'log' : 1, 'infolog' : 1}
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_always_populate_location_list = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "󱐋"
let g:syntastic_style_warning_symbol = "󱐋"
let g:syntastic_python_checkers = ['flake8', 'pylint']
" E501 line too long
let g:syntastic_python_flake8_post_args = '--ignore=E501'
" C0111, C0112 missing or empty docstring
" R0902 too many instance atributes
let g:syntastic_python_pylint_post_args = '--disable=C0111,C0112,R0902'
let g:syntastic_sh_checkers = ['sh', 'shellcheck']
let g:syntastic_sh_shellcheck_args = "-x"
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_go_checkers = ['go']
let g:syntastic_always_populate_loc_list = 1

" vim-pandoc
let g:pandoc#spell#enabled = 0
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["vim", "sh", "bash=sh", "python", "c", "cpp", "sql", "javascript", "rust"]
let g:pandoc#command#use_message_buffers = 0
let g:pandoc#after#modules#enabled = ["tablemode", "ultisnips"]
let g:pandoc#hypertext#create_if_no_alternates_exists = 1
let g:pandoc#command#templates_file = $HOME.'/.vim/custom/pandoc/templates'

" vim-table-mode
let g:table_mode_always_active = 0
let g:table_mode_corner = '+'
let g:table_mode_corner_corner = '+'
let g:table_mode_header_fillchar = '='
let g:table_mode_fillchar = '-'
let g:table_mode_separator = '|'
let g:table_mode_align_char = ':'

"vim-go
let g:go_fmt_autosave = 0 
let g:go_fmt_command = 'gofmt'

" pydoc
let g:pydoc_highlight = 0
let g:pydoc_window_lines = 0.5
let g:pydoc_cmd = 'python -m pydoc'

" tagbar
let g:tagbar_width = 30

" NERDTree
let g:NERDTreeBookmarksFile = $HOME.'/.vim/custom/.NERDTreeBookmarks'
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30

" vimtex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = "zathura"
let g:vimtex_compiler_progname = 'latex-mk'
set conceallevel=2
let g:tex_conceal = 'abdmg'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Пользовательские функции                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Сохранить и запустить
function! RunCode()
    if &modified == 1
        silent execute 'set fileencoding=utf-8'
        silent execute 'set fileformat=unix'
        silent write
    endif

   let l:work_dir = shellescape(getcwd(), 1)
   let l:buffer_dir = shellescape(expand("%:p:h"), 1)
   let l:buffer_path = shellescape(expand("%:p"), 1)
   let l:binary_path = tempname()

   if &filetype ==# 'javascript'
       execute '!node ' . l:buffer_path
   endif

   if &filetype ==# 'html'
       execute '!xdg-open' . l:buffer_path
   endif

   if index(['bash', 'sh', 'python', 'perl'], &filetype) >= 0
       execute '!chmod u+x ' . l:buffer_path . ';' . l:buffer_path
   endif

   if index(['c', 'cpp'], &filetype) >= 0
       silent execute "!cd " . l:buffer_dir

       " make
       let l:oldmakeprg = &makeprg
       try
           let &makeprg = "gcc -g -Wall -Wextra -Wpedantic -lstdc++ -o " . l:binary_path . " %"
           silent make!
       finally
           let &makeprg = l:oldmakeprg
       endtry

       silent execute "!cd " . l:work_dir

       " execute
       if getqflist() == []
           execute "!" . l:binary_path
       else
           redraw!
           echohl ErrorMsg
           echomsg "Make failed..."
           echohl NONE
           copen
       endif
   endif

   if &filetype ==# 'rust'
       execute "!cd " . l:buffer_dir . ";" . "cargo run" . ";" . "cd " . l:work_dir
   endif

   if &filetype ==# 'go'
       execute "!cd " . l:buffer_dir . ";" . "go run " . l:buffer_path . ";" . "cd " . l:work_dir
   endif
endfunction

" Показать ошибки синтаксиса
function! CheckCode()
    if index(['bash', 'sh', 'python', 'perl', 'c', 'cpp', 'rust', 'go'], &filetype) >= 0
        let old_last_winnr = winnr('$')
        lclose

        if old_last_winnr == winnr('$')
            if &modified == 1
                silent execute 'set fileencoding=utf-8'
                silent execute 'set fileformat=unix'
                silent write
            endif

            if index(['c', 'cpp'], &filetype) == 0
                execute 'SyntasticCheck'
            endif

            execute 'YcmForceCompileAndDiagnostics'

            lopen
        endif
    endif
endfunction

" Создать теги
function! TagCode(...)
    let includeSystem = a:0 > 0 ? a:1 : ""

    let pythonCtags = "!ctags -R --fields=+liaS --languages=python --python-kinds=-iv --extra=+f ."
    let cppCtags = "!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q ."
    let pythonLibs = "$(python -c \"import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))\")"

    if &modified == 1
        silent execute 'set fileencoding=utf-8'
        silent execute 'set fileformat=unix'
        silent write
    endif

    if &filetype ==# "python"
        if includeSystem == "system"
            let ctagCmd = pythonCtags . " " . pythonLibs
        else
            let ctagCmd = pythonCtags
        endif
    endif

    if index(['c', 'cpp'], &filetype) >= 0
        let ctagCmd =  cppCtags
    endif

    if index(['c', 'cpp', 'python'], &filetype) >= 0
        silent execute ctagCmd . " &> /dev/null"
        silent redraw!
        echo "Tags created"
    endif
endfunction

" Закрыть все буфферы кроме ткущего
cab <silent> bdo call CloseAllBuffersButCurrent()<Cr>
cab <silent> bda call CloseAllBuffersButCurrent() \| bd <Cr>

function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  if curr > 1 | silent! execute "1,".(curr-1)."bd" | endif
  let curr = bufnr("%")
  let last = bufnr("$")
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   commands                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Запись как sudo
command! W execute 'silent! write !sudo dd of=% > /dev/null' <bar> edit!

" Форматирование XML файлов
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml().replace('\t', ' ' * 4))"
