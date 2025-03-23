" =============================================================================
" Filename: crowmurk.vim
" Author: crowmurk
" License: MIT License
" Last Change: 2023/02/26 10:25:00.
" =============================================================================

" Set 'background' back to the default.
hi clear Normal
set background=dark

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "crowmurk"

" Set colors in terminal window
if (has('termguicolors') && &termguicolors) || has('gui_running')
    let g:terminal_ansi_colors = [
                \ '#000000', '#D75F5F', '#5F8700', '#D78700', '#5F5F87', '#875F87', '#008787', '#808080',
                \ '#444444', '#D7875F', '#5FAF00', '#D7AF00', '#5F8787', '#878787', '#00AF87', '#BCBCBC'
                \ ]
endif

hi! link BufTabLineActive TabLineSel
hi! link ColorColumn CursorColumn
hi! link Conceal NonText
hi! link CurSearch Search
hi! link CursorIM lCursor
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link DiffText DiffDelete
hi! link EndOfBuffer NonText
hi! link FoldColumn Folded
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link MessageWindow Pmenu
hi! link MoreMsg Question
hi! link PopupNotification Todo
hi! link QuickFixLine CursorLine
hi! link SpecialKey NonText
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link Terminal Normal
hi! link VertSplit LineNr

hi Normal                       cterm=NONE           ctermbg=NONE         ctermfg=NONE         gui=NONE             guibg=#121212        guifg=#87AF5F

hi TabLine                      cterm=NONE           ctermbg=NONE         ctermfg=238          gui=NONE             guibg=#000000        guifg=#444444
hi TabLineSel                   cterm=bold           ctermbg=NONE         ctermfg=244          gui=bold             guibg=#000000        guifg=#808080
hi TabLineFill                  cterm=NONE           ctermbg=NONE                              gui=NONE             guibg=#000000

hi StatusLine                   cterm=NONE           ctermbg=NONE         ctermfg=244          gui=NONE             guibg=#000000        guifg=#808080
hi StatusLineNC                 cterm=NONE           ctermbg=NONE         ctermfg=238          gui=NONE             guibg=#000000        guifg=#444444

hi WildMenu                     cterm=NONE           ctermbg=NONE         ctermfg=222          gui=NONE             guibg=#000000        guifg=#FFD787

hi Pmenu                        cterm=NONE           ctermbg=233          ctermfg=222          gui=NONE             guibg=#1C1C1C        guifg=#FFD787
hi PmenuSel                     cterm=NONE           ctermbg=235          ctermfg=172          gui=NONE             guibg=#303030        guifg=#D78700
hi PmenuSbar                    cterm=NONE           ctermbg=241                               gui=NONE             guibg=#666666
hi PmenuThumb                   cterm=NONE           ctermbg=244                               gui=NONE             guibg=#8A8A8A

hi LineNr                       cterm=NONE           ctermbg=NONE         ctermfg=238          gui=NONE             guibg=NONE           guifg=#444444
hi CursorLineNr                 cterm=NONE           ctermbg=NONE         ctermfg=172          gui=NONE             guibg=NONE           guifg=#D78700
hi CursorLine                   cterm=bold           ctermbg=NONE                              gui=bold             guibg=NONE
hi CursorColumn                 cterm=NONE           ctermbg=235          ctermfg=NONE         gui=NONE             guibg=#303030        guifg=NONE
hi SignColumn                   cterm=NONE           ctermbg=NONE         ctermfg=66           gui=NONE             guibg=NONE           guifg=#5F8787

hi Folded                       cterm=NONE           ctermbg=NONE         ctermfg=178          gui=NONE             guibg=NONE           guifg=#D7AF00

hi Visual                       cterm=NONE           ctermbg=235          ctermfg=NONE         gui=NONE             guibg=#303030        guifg=NONE
hi VisualNOS                    cterm=NONE           ctermbg=235          ctermfg=172          gui=NONE             guibg=#303030        guifg=#D78700

hi ErrorMsg                     cterm=NONE           ctermbg=NONE         ctermfg=173          gui=NONE             guibg=NONE           guifg=#D7875F
hi WarningMsg                   cterm=NONE           ctermbg=NONE         ctermfg=178          gui=NONE             guibg=NONE           guifg=#D7AF00

hi SyntasticErrorSign           cterm=NONE           ctermbg=NONE         ctermfg=173          gui=NONE             guibg=NONE           guifg=#D7875F
hi SyntasticWarningSign         cterm=NONE           ctermbg=NONE         ctermfg=178          gui=NONE             guibg=NONE           guifg=#D7AF00
hi SyntasticStyleErrorSign      cterm=NONE           ctermbg=NONE         ctermfg=178          gui=NONE             guibg=NONE           guifg=#D7AF00
hi SyntasticStyleWarningSign    cterm=NONE           ctermbg=NONE         ctermfg=178          gui=NONE             guibg=NONE           guifg=#D7AF00

hi LineOverLength               cterm=NONE           ctermbg=NONE         ctermfg=241          gui=NONE             guibg=#121212        guifg=#626262

hi Comment                      cterm=NONE           ctermbg=NONE         ctermfg=117          gui=NONE             guibg=NONE           guifg=#87D7FF
hi PreProc                      cterm=NONE           ctermbg=NONE         ctermfg=167          gui=NONE             guibg=NONE           guifg=#D75F5F
hi Constant                     cterm=NONE           ctermbg=NONE         ctermfg=217          gui=NONE             guibg=NONE           guifg=#FFAFAF
hi Identifier                   cterm=bold           ctermbg=NONE         ctermfg=150          gui=bold             guibg=NONE           guifg=#AFDF87
hi Statement                    cterm=NONE           ctermbg=NONE         ctermfg=222          gui=NONE             guibg=NONE           guifg=#FFD787
hi Special                      cterm=NONE           ctermbg=NONE         ctermfg=223          gui=NONE             guibg=NONE           guifg=#FFD7AF
hi Type                         cterm=NONE           ctermbg=NONE         ctermfg=143          gui=NONE             guibg=NONE           guifg=#AFAF5F
hi Underlined                   cterm=underline      ctermbg=NONE         ctermfg=66           gui=underline        guibg=NONE           guifg=#5F8787
hi Ignore                       cterm=NONE           ctermbg=NONE         ctermfg=238          gui=NONE             guibg=NONE           guifg=#444444
hi Error                        cterm=NONE           ctermbg=NONE         ctermfg=173          gui=NONE             guibg=NONE           guifg=#D7875F
hi Todo                         cterm=NONE           ctermbg=178          ctermfg=0            gui=NONE             guibg=#D7AF00        guifg=#000000

hi Search                       cterm=NONE           ctermbg=235          ctermfg=NONE         gui=NONE             guibg=#303030        guifg=NONE
hi IncSearch                    cterm=reverse        ctermbg=NONE                              gui=reverse          guibg=NONE
hi MatchParen                   cterm=NONE           ctermbg=NONE         ctermfg=36           gui=NONE             guibg=NONE           guifg=#00AF87

hi DiffAdd                      cterm=NONE           ctermbg=233          ctermfg=107          gui=NONE             guibg=#1C1C1C        guifg=#87AF5F
hi DiffChange                   cterm=NONE           ctermbg=233          ctermfg=222          gui=NONE             guibg=#1C1C1C        guifg=#FFD787
hi DiffDelete                   cterm=NONE           ctermbg=233          ctermfg=173          gui=NONE             guibg=#1C1C1C        guifg=#D7875F

hi ModeMsg                      cterm=NONE           ctermbg=NONE         ctermfg=178          gui=NONE             guibg=NONE           guifg=#D7AF00

hi Question                     cterm=NONE           ctermbg=NONE         ctermfg=66           gui=NONE             guibg=NONE           guifg=#5F8787

hi SpellBad                     cterm=underline      ctermbg=NONE         ctermfg=167          gui=underline        guibg=NONE           guifg=#D75F5F
hi SpellCap                     cterm=underline      ctermbg=NONE         ctermfg=173          gui=underline        guibg=NONE           guifg=#D7875F
hi SpellLocal                   cterm=underline      ctermbg=NONE         ctermfg=178          gui=underline        guibg=NONE           guifg=#D7AF00
hi SpellRare                    cterm=underline      ctermbg=NONE         ctermfg=222          gui=underline        guibg=NONE           guifg=#FFD787

hi Title                        cterm=NONE           ctermbg=NONE         ctermfg=167          gui=NONE             guibg=NONE           guifg=#D75F5F
hi Directory                    cterm=NONE           ctermbg=NONE         ctermfg=66           gui=NONE             guibg=NONE           guifg=#5F8787
hi NonText                      cterm=NONE           ctermbg=NONE         ctermfg=66           gui=NONE             guibg=NONE           guifg=#5F8787

hi Cursor                                                                                                           guibg=fg             guifg=bg
hi lCursor                                                                                                          guibg=#00AF87        guifg=NONE
