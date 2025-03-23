" =============================================================================
" Filename: crowmurkGray.vim
" Author: crowmurk
" License: MIT License
" Last Change: 2016/03/02 08:37:43.
" =============================================================================

let s:base =        [ '#000000', 0   ]
let s:inactive =    [ '#444444', 238 ]
let s:active =      [ '#808080', 244 ]

let s:normal =      [ '#808080', 244 ]
let s:insert =      [ '#87FF5F', 119 ]
let s:visual =      [ '#FFAF87', 216 ]

let s:warning =     [ '#DFAF00', 178   ]
let s:error =       [ '#DF5F5F', 167   ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ s:normal , s:base], [ s:active, s:base ] ]
let s:p.normal.right = [ [ s:active, s:base ], [ s:active, s:base ] ]
let s:p.normal.middle = [ [ s:active, s:base ] ]

let s:p.inactive.left =  [ [ s:inactive , s:base], [ s:inactive, s:base ] ]
let s:p.inactive.right = [ [ s:inactive, s:base ], [ s:inactive, s:base ] ]
let s:p.inactive.middle = [ [ s:inactive, s:base ] ]

let s:p.insert.left = [ [ s:insert , s:base], [ s:active, s:base ] ]
let s:p.replace.left = [ [ s:error , s:base], [ s:active, s:base ] ]
let s:p.visual.left = [ [ s:visual , s:base], [ s:active, s:base ] ]

let s:p.tabline.left = [ [ s:inactive, s:base ] ]
let s:p.tabline.tabsel = [ [ s:active, s:base ] ]
let s:p.tabline.middle = [ [ s:inactive, s:base ] ]
let s:p.tabline.right = [ [ s:inactive, s:base ] ]

let s:p.normal.error = [ [ s:error , s:base] ]
let s:p.normal.warning = [ [ s:warning , s:base] ]

let g:lightline#colorscheme#crowmurkGray#palette = lightline#colorscheme#flatten(s:p)
