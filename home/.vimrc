" Загрузка плагинов через Vundle
set nocompatible
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
Plugin 'tpope/vim-surround'                         " parentheses, brackets, quotes, XML tags, and more
" python
Plugin 'hdima/python-syntax'                        " enchansed python syntax highlighting
Plugin 'tweekmonster/django-plus.vim'               " improvements to the handling of django related files
Plugin 'fs111/pydoc.vim'                            " integrates python documentation system
Plugin 'tmhedberg/SimpylFold'                       " improved python folding
Plugin 'Vimjas/vim-python-pep8-indent'              " indentation behavior to comply with PEP8
" JavaScript
Plugin 'pangloss/vim-javascript'                    " provides syntax highlighting and improved indentation
" Powershell
Plugin 'PProvost/vim-ps1'                           " Powershell syntax and inteding
" pandoc
Plugin 'vim-pandoc/vim-pandoc'                      " integrate with the pandoc
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-pandoc-after'
" text
Plugin 'lyokha/vim-xkbswitch'                       " atoswitch keyboard when leaving insert mode
Plugin 'jiangmiao/auto-pairs'                       " insert or delete brackets, parens, quotes in pair.
Plugin 'dhruvasagar/vim-table-mode'                 " automatic table creator
" misc
Plugin 'dzeban/vim-log-syntax'                      " syntax file to highlight various log files
Plugin 'gorodinskiy/vim-coloresque'                 " color preview for vim
Plugin 'phongvcao/vim-stardict'                     " plugin for looking up meaning of words
call vundle#end()
filetype indent on
filetype plugin on

" Пути
set backup                                              " Создавать  backup
set backupdir=~/.vim/backup/
set swapfile                                            " Создавать swap
set dir=~/.vim/swap/
set undofile                                            " Включить отмену изменений
set undodir=~/.vim/undo/
set viewoptions-=options                                " Сохраняем настройки состояния
set viminfo+=n~/.vim/viminfo
set viewdir=~/.vim/view/

" Настройки GUI
set guioptions-=m                                       " Опции gVim only
set guioptions-=T
set guioptions-=r

" Подсветка синтаксиса
syntax on
colorscheme crowmurk                                    " Включить цветовую схему

" Поиск
set incsearch                                           " При поиске перескакивать на найденный текст в процессе набора строки
set ignorecase                                          " Игнорировать регистр букв при поиске
set nohlsearch                                          " Подсветка найденного

" Кодировки
set encoding=utf8                                       " Кодировка
set termencoding=utf-8                                  " Кодировка терминала
set fileencodings=utf8,cp1251,koi8-r,cp866              " Возможные кодировки файлов и последовательность определения
set fileencoding=utf-8                                  " Кодировка при сохранения файлов

" История
set history=10000                                       " Размер истории
set undolevels=10000                                    " Размер отмены

" Файлы
set autoread                                            " Отслеживать состояние файлов и загружать изменения
set cryptmethod=blowfish2                               " Шифрование
set fileformats=unix,dos,mac                            " Поддерживаемые форматы файлов
set fileformat=unix                                     " Формат файла при сохранении

" Буфферы и вкладки
set hidden                                              " Не требовать сохранения буфера
set tabpagemax=100                                      " Максимальное количество вкладок

" Отступы
set tabstop=4                                           " Размер табуляции
set shiftwidth=4                                        " Число пробелов, используемых при автоотступе (<< >>)
set softtabstop=4
set smarttab                                            " Добавление отступа в начале строки (при нажатии TAB)
set expandtab                                           " Заменяем табуляции пробелами
set autoindent                                          " Включаем умные отступы
set smartindent

" Строки
set wrap                                                " Включить перенос строк
set linebreak                                           " Перенос строк по словам, а не по буквам
set list                                                " Отображаем табуляции и конечные пробелы
set listchars=tab:→→,trail:⋅
set showmatch                                           " Показываем открывающие и закрывающие скобки
set number  relativenumber                              " Показывать номера строк

" Язык и расклада
set keymap=russian-jcukenwin                            " Поддержка переключения раскладок по ctrl+^
set iminsert=0                                          " По умолчанию латинская раскладка
set imsearch=0                                          " По умолчанию латинская раскладка при поиске
set spelllang=ru,en                                     " Поддержка проверки правописания.
highlight lCursor guifg=NONE guibg=Cyan                 " Цвет курсора при смене раскладки

" Сворачивание
set foldenable                                          " Включить сворачивание
set foldmethod=syntax
set foldlevelstart=99

" Автодополнение
set dictionary+=/usr/share/dict/words                   " Словари для автодополнений
set dictionary+=/usr/share/dict/russian
set wildmenu                                            " Автодополнение в коммандной строке
set completeopt=longest,menuone,preview                 " Настройка меню автодополнения
set completeopt+=noinsert,noselect
set complete+=k                                         " Поиск в словарях
set omnifunc=syntaxcomplete#Complete

" Строка состояния
set laststatus=2                                        " Всегда показывать строку состояния
set ruler                                               " Постоянно показывать позицию курсора
set noshowmode                                          " Не показывать режим
set showcmd                                             " Показывать незавершенную комманду

" Разное
set timeoutlen=1000                                     " Задержка после нажатия Esc
set ttimeoutlen=0

" Менять текущую рабочую директорию
" autocmd BufEnter *.* silent! lcd %:p:h

" Сохранять состояние буфферов
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Настройка errorFormat
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

" Запись как sudo
command! W execute 'silent! write !sudo dd of=% > /dev/null' <bar> edit!

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем текст
augroup line_char_limit_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp,sh highlight Excess guifg=salmon ctermfg=175 ctermbg=none
    autocmd FileType ruby,python,javascript,c,cpp,sh match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp,sh set nowrap
augroup END

" Сочетания клавиш
" leader key
if !exists("vimpager")
    let g:mapleader = " "
    let g:maplocalleader = ","
endif

" Вставка пустых строк
map <Enter> O<Esc>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" Копирование текста в общий буфер обмена
noremap <leader>y "+y
noremap <leader>yy "+yy

" Вставка текста из общего буфера обмена
noremap <leader>i :set paste<CR>:put +<CR>:set nopaste<CR>
noremap <leader>I :set paste<CR>:put! +<CR>:set nopaste<CR>

" Новые окна
nmap <C-c>s :split<Cr>
imap <C-c>s <Esc>:split<Cr>
vmap <C-c>s <Esc>:split<Cr>
nmap <C-c>v :vsplit<Cr>
imap <C-c>v <Esc>:vsplit<Cr>
vmap <C-c>v <Esc>:vsplit<Cr>
nmap <C-c>q :close<Cr>
imap <C-c>q <Esc>:close<Cr>
vmap <C-c>q <Esc>:close<Cr>

" Изменение размера окна
map <C-c>j <c-w>+
map <C-c>k <c-w>-
map <C-c>h <c-w><
map <C-c>l <c-w>>

" Прееключение буферов
nmap <C-c>n :bnext<Cr>
imap <C-c>n <Esc>:bnext<Cr>
vmap <C-c>n <Esc>:bnext<Cr>
nmap <C-c>p :bprev<Cr>
imap <C-c>p <Esc>:bprev<Cr>
vmap <C-c>p <Esc>:bprev<Cr>

" vim-stardict
map <C-c>m :silent! StarDictCursor<Cr>

" Просмотр man станиц в gui режиме
if has("gui_running")
   runtime ftplugin/man.vim
   cabbrev man Man
   nmap K  :Man <cword><Cr>
endif

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

augroup filetype_python_sh_c_cpp_autocmds
    autocmd!
    " Выполнить код
    autocmd FileType python,sh,c,cpp nnoremap <buffer> <silent> <F3> :call RunCode()<Cr>
    autocmd FileType python,sh,c,cpp inoremap <buffer> <silent> <F3> <Esc>:call RunCode()<Cr>
    autocmd FileType python,sh,c,cpp vnoremap <buffer> <silent> <F3> <Esc>:call RunCode()<Cr>
    " Провека синтаксиса
    autocmd FileType python,sh,c,cpp nnoremap <buffer> <silent> <F4> :call CheckCode()<Cr>
    autocmd FileType python,sh,c,cpp inoremap <buffer> <silent> <F4> <Esc>:call CheckCode()<Cr>
    autocmd FileType python,sh,c,cpp vnoremap <buffer> <silent> <F4> <Esc>:call CheckCode()<Cr>
    autocmd FileType qf nnoremap <buffer> <silent> <F4>  :lclose<Cr>
    " Создание тегов
    autocmd FileType python,c,cpp nnoremap <buffer> <silent> <F5> :call TagCode()<Cr>
    autocmd FileType python,c,cpp inoremap <buffer> <silent> <F5> <Esc>:call TagCode()<Cr>
    autocmd FileType python,c,cpp vnoremap <buffer> <silent> <F5> <Esc>:call TagCode()<Cr>
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
augroup END

" Показать\спрятать номера строк
nnoremap <silent> <F10> :set<Space>nu!<Cr>
inoremap <silent> <F10> <Esc>:set<Space>nu!<Cr>
vnoremap <silent> <F10> <Esc>:set<Space>nu!<Cr>

" Обозреватель файлов
nnoremap <silent> <F11> :NERDTreeToggle<Cr>
inoremap <silent> <F11> <Esc>:NERDTreeToggle<Cr>
vnoremap <silent> <F11> <Esc>:NERDTreeToggle<Cr>

" Обозреватель тегов
nnoremap <silent> <F12> :TagbarToggle<Cr>
inoremap <silent> <F12> <Esc>:TagbarToggle<Cr>
vnoremap <silent> <F12> <Esc>:TagbarToggle<Cr>

" Переключение буфферов
let counter = 1
while counter <= 100
  execute "nmap \<leader>" . counter . " :" . counter . "b\<Cr>"
  execute "vmap \<leader>" . counter . " \<Esc>:" . counter . "b\<Cr>"
  let counter += 1
endwhile

" Настройка компилятора C/C++
compiler gcc
set makeprg=gcc\ -g\ -Wall\ -o\ %<\ %\ -lstdc++

" Настройка плагинов
" SimplyFold
let g:SimpylFold_docstring_preview = 1

" Lightline
let g:lightline = {
    \ 'colorscheme': 'crowmurkGray',
    \ 'component': {
    \     'readonly': '%{&readonly?"✗":""}',
    \ },
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
    \ }
    \ }

" buffTabline
hi link BufTabLineActive  TabLineSel
let g:buftabline_numbers=1

" auto-pairs
execute "set <M-p>=\ep"
execute "set <M-e>=\ee"
execute "set <M-n>=\en"
execute "set <M-b>=\eb"

" pyton-syntax
let g:python_highlight_all = 1

" XkbSwitch
let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchLib = '/usr/lib/libxkbswitch.so'

" UltiSnips
set rtp+=~/.vim/custom
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/custom/UltiSnips'

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = $HOME.'/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_filetype_blacklist = {'log' : 1, 'infolog' : 1}
let g:ycm_collect_identifiers_from_tags_files = 1
" Django recomended
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = "⚡"
let g:syntastic_style_warning_symbol = "⚡"
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_python_checkers = ['flake8', 'pylint', 'pyflakes']
let g:syntastic_python_flake8_post_args='--ignore=E501,E302'
let g:syntastic_python_pylint_post_args='--disable=C0111,C0103,C0301,R0903'
let g:syntastic_sh_checkers = ['sh', 'shellcheck']
let g:syntastic_sh_shellcheck_args = "-x"
hi SyntasticErrorSign guifg=salmon ctermfg=124 ctermbg=none
hi SyntasticWarningSign guifg=yellow ctermfg=154 ctermbg=none

" vim-pandoc
let g:pandoc#spell#enabled = 0
let g:pandoc#folding#fdc = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#syntax#codeblocks#embeds#langs = ["vim", "sh", "bash=sh", "python", "c", "cpp", "sql", "javascript"]
let g:pandoc#command#use_message_buffers = 0
let g:pandoc#after#modules#enabled = ["tablemode", "ultisnips"]
let g:pandoc#hypertext#create_if_no_alternates_exists = 1
let g:pandoc#command#templates_file=$HOME.'/.vim/custom/pandoc/templates'

" vim-table-mode
let g:table_mode_always_active = 0
let g:table_mode_corner = '+'
let g:table_mode_corner_corner = '+'
let g:table_mode_header_fillchar = '='
let g:table_mode_fillchar = '-'
let g:table_mode_separator = '|'
let g:table_mode_align_char = ':'

" pydoc
let g:pydoc_highlight=0
let g:pydoc_window_lines=0.5
let g:pydoc_cmd = 'python -m pydoc'

" tagbar
let g:tagbar_width = 30

" NERDTree
let g:NERDTreeBookmarksFile=$HOME.'/.vim/custom/.NERDTreeBookmarks'
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=30

" Сохранить и запустить
function! RunCode()
    if &modified == 1
        silent execute 'set fileencoding=utf-8'
        silent execute 'set fileformat=unix'
        silent write
    endif

   let s:current_buffer_file_path = expand("%:p")

   if &filetype ==# 'javascript'
       execute '!node ' . shellescape(s:current_buffer_file_path, 1)
   endif

   if &filetype ==# 'html'
       execute '!chromium -f ' . shellescape(s:current_buffer_file_path, 1)
   endif

   if index(['bash', 'sh', 'python', 'perl'], &filetype) >= 0
       silent execute '!chmod u+x ' . shellescape(s:current_buffer_file_path, 1)
       execute '!' . shellescape(s:current_buffer_file_path, 1)
   endif

   if index(['c', 'cpp'], &filetype) >= 0
       execute 'wall | !make -f ' . shellescape(s:current_buffer_file_path, 1)
   endif
endfunction

" Показать ошибки синтаксиса
function! CheckCode()
    if index(['bash', 'sh', 'python', 'perl', 'c', 'cpp'], &filetype) >= 0
        if &modified == 1
            silent execute 'set fileencoding=utf-8'
            silent execute 'set fileformat=unix'
            silent write
        endif

        execute 'SyntasticCheck'

        let old_last_winnr = winnr('$')
        lclose
        if old_last_winnr == winnr('$')
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
function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  if curr > 1    | silent! execute "1,".(curr-1)."bd" | endif
  let curr = bufnr("%")
  let last = bufnr("$")
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction

" Форматирование XML файлов
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml().replace('\t', ' ' * 4))"
