let g:deoplete#enable_at_startup = 1
let g:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'
" For python language server
if (executable('pyls'))
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': {server_info->['pyls']},
      \ 'whitelist': ['python']
      \ })
    augroup END
endif

