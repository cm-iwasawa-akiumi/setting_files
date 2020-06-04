" vimrc
" vim-lspの各種オプション設定
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 0  " 警告やエラーの表示はALEに任せるのでOFFにする
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_information = {'text': 'i'}
let g:lsp_signs_hint = {'text': '?'}
"
" デバッグ用設定
let g:lsp_log_verbose = 1  " デバッグ用ログを出力
let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')  " ログ出力のPATHを設定

let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'

if (executable('pyls'))
    " pylsの起動定義
    augroup LspPython
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': { server_info -> [expand(s:pyls_path)] },
      \ 'whitelist': ['python'],
      \ 'workspace_config': {'pyls': {'plugins': {
      \   'pycodestyle': {'enabled': v:true},
      \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
      \ })
    augroup END
endif

" 定義ジャンプ(デフォルトのctagsによるジャンプを上書きしているのでこのあたりは好みが別れます)
nnoremap <C-]> :<C-u>LspDefinition<CR>
" 定義情報のホバー表示
nnoremap K :<C-u>LspHover<CR>
" 名前変更
nnoremap <LocalLeader>R :<C-u>LspRename<CR>
" 参照検索
nnoremap <LocalLeader>n :<C-u>LspReferences<CR>
" Lint結果をQuickFixで表示
nnoremap <LocalLeader>f :<C-u>LspDocumentDiagnostics<CR>
" テキスト整形
nnoremap <LocalLeader>s :<C-u>LspDocumentFormat<CR>
" オムニ補完を利用する場合、定義の追加
set omnifunc=lsp#complete

" 保存時に自動整形
"augroup LspAutoFormatting
"    autocmd!
"    autocmd BufWritePre *.py LspDocumentFormatSync
"augroup END


"" 言語用Serverの設定
"augroup MyLsp
"  autocmd!
"  " pip install python-language-server
"  if executable('pyls')
"    " Python用の設定を記載
"    " workspace_configで以下の設定を記載
"    " - pycodestyleの設定はALEと重複するので無効にする
"    " - jediの定義ジャンプで一部無効になっている設定を有効化
"    autocmd User lsp_setup call lsp#register_server({
"        \ 'name': 'pyls',
"        \ 'cmd': { server_info -> [expand(s:pyls_path)] },
"        \ 'whitelist': ['python'],
"        \ 'workspace_config': {'pyls': {'plugins': {
"        \   'pycodestyle': {'enabled': v:false},
"        \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
"        \ })
"    autocmd FileType python call s:configure_lsp()
"  endif
"augroup END
"augroup LaunchPyls
"  autocmd!
"  autocmd BufWinEnter *.py :call lsp#enable()
"augroup END
"" 言語ごとにServerが実行されたらする設定を関数化
"function! s:configure_lsp() abort
"  setlocal omnifunc=lsp#complete   " オムニ補完を有効化
"  " LSP用にマッピング
"  " 定義元へ
"  nnoremap <buffer> <leader>[ :<C-u>LspDefinition<CR>
"  " 参照一覧を下に表示
"  nnoremap <buffer> <leader>] :<C-u>LspReferences<CR>
"  "nnoremap <buffer> <C-[> :<C-u>LspReferences<CR>
"  "nnoremap <buffer> gd :<C-u>LspDefinition<CR>
"  "nnoremap <buffer> gD :<C-u>LspReferences<CR>
"  "nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
"  "nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
"  "nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
"  "vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
"  nnoremap <buffer> K :<C-u>LspHover<CR>
"  nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
"  nnoremap <buffer> <F2> :<C-u>LspRename<CR>
"endfunction
