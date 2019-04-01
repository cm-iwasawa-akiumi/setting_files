let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('auto_complete', v:false)

inoremap <silent><expr> <C-n>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}

"call deoplete#custom#source('LanguageClient',
"            \ 'min_pattern_length',
"            \ 2)
"call deoplete#custom#source('LanguageClient', 'sorters', [])
"call deoplete#custom#option('ignore_sources', {
"	\ 'python': ['LanguageClient'],
"	\ 'javascript':['LanguageClient'],
"	\ 'javascript.jsx':['LanguageClient']
"	\ })    " disable LC
"
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
""function! s:check_back_space() abort "{{{
""  let col = col('.') - 1
""  return !col || getline('.')[col - 1]  =~ '\s'
""endfunction"}}}
""
""" <S-TAB>: completion back.
""inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"
""
""" <BS>: close popup and delete backword char.
""inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
""
""" <CR>: close popup and save indent.
""inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
""function! s:my_cr_function() abort
""  return deoplete#cancel_popup() . "\<CR>"
""endfunction
"
""let g:deoplete#enable_refresh_always = 0
""let g:deoplete#enable_camel_case = 1
""let g:deoplete#skip_chars = ['(', ')']
"
