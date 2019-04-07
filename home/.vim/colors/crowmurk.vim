" =============================================================================
" Filename: crowmurk.vim
" Author: crowmurk
" License: MIT License
" Last Change: 2018/02/19 07:57:00.
" =============================================================================

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif

let g:colors_name="crowmurk"

hi Normal           guibg=grey20        guifg=white                             ctermbg=none        ctermfg=107
hi Cursor           guibg=khaki         guifg=slategrey                         ctermbg=172         ctermfg=0
hi VertSplit        guibg=cornsilk      guifg=grey50            gui=none        ctermbg=none        ctermfg=2     cterm=none
hi Folded           guibg=grey30        guifg=gold                              ctermbg=none        ctermfg=185
hi FoldColumn       guibg=grey30        guifg=tan                               ctermbg=59          ctermfg=180
hi IncSearch        guibg=khaki         guifg=slategrey                         ctermbg=222         ctermfg=66
hi ModeMsg                              guifg=goldenrod                                             ctermfg=178
hi MoreMsg                              guifg=seagreen                                              ctermfg=29
hi NonText          guibg=grey30        guifg=lightblue                         ctermbg=none        ctermfg=152
hi Question                             guifg=springgreen                                           ctermfg=48
hi Search           guibg=peru          guifg=wheat                             ctermbg=173         ctermfg=223
hi SpecialKey                           guifg=yellowgreen                                           ctermfg=113
hi StatusLine       guibg=cornsilk      guifg=black             gui=none        ctermbg=0           ctermfg=94      cterm=none
hi StatusLineNC     guibg=cornsilk      guifg=grey50            gui=none        ctermbg=0           ctermfg=102     cterm=none
hi Title                                guifg=indianred                                             ctermfg=167
hi Visual           guibg=olivedrab     guifg=khaki             gui=none        ctermbg=64          ctermfg=222     cterm=none
hi WarningMsg                           guifg=salmon                                                ctermfg=209
hi SpellBad         guibg=grey20        guifg=salmon            gui=none        ctermbg=none        ctermfg=209     cterm=none
hi WildMenu                                                                     ctermbg=0           ctermfg=100
hi SignColumn                                                                   ctermbg=none
hi MatchParen                                                                   ctermbg=none        ctermfg=98     cterm=bold
hi Conceal          guibg=grey20        guifg=tan                               ctermbg=none        ctermfg=none
hi LineNr                               guifg=#3a3a3a           gui=none        ctermbg=none        ctermfg=237     cterm=none

" tabline highlightning
hi TabLine          guibg=#000000       guifg=#3a3a3a           gui=none        ctermbg=0           ctermfg=237     cterm=none
hi TabLineFill      guibg=#000000                               gui=none        ctermbg=0                           cterm=none
hi TabLineSel                           guifg=#626262                           ctermfg=241

" syntax highlighting
hi Comment                              guifg=skyblue                           ctermfg=117
hi Constant                             guifg=lightpink                         ctermfg=217
hi Identifier                           guifg=palegreen                         ctermfg=150
hi Statement                            guifg=khaki                             ctermfg=222
hi PreProc                              guifg=indianred                         ctermfg=167
hi Type                                 guifg=darkkhaki                         ctermfg=143
hi Special                              guifg=navajowhite                       ctermfg=223
hi Ignore                               guifg=grey40                            ctermfg=59
hi Todo             guibg=yellow2       guifg=orangered                         ctermbg=11          ctermfg=202

" menu hughlighting
hi Pmenu            guibg=grey30        guifg=khaki                             ctermbg=none        ctermfg=222
hi PmenuSbar        guibg=grey50                                                ctermbg=102
hi PmenuThumb       guibg=grey60                                                ctermbg=102
hi PmenuSel         guibg=grey40        guifg=goldenrod                         ctermbg=59          ctermfg=178
