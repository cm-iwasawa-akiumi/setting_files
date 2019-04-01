let g:ale_sign_error = 'E➤'
let g:ale_sign_warning = 'W➤'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'normal'

" flake8をLinterとして登録
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ }

" 各ツールをFixerとして登録
let g:ale_fixers = {
    \ 'python': ['autopep8', 'black', 'isort'],
    \ }

" 各ツールの実行オプションを変更してPythonパスを固定
" flake8: コードレビュー用
let g:ale_python_flake8_executable = g:python3_host_prog
let g:ale_python_flake8_options = '-m flake8'
" autopep8 PEP8スタイルガイドに準拠するように
let g:ale_python_autopep8_executable = g:python3_host_prog
let g:ale_python_autopep8_options = '-m autopep8'
" importのsortをアルファベット順に
let g:ale_python_isort_executable = g:python3_host_prog
let g:ale_python_isort_options = '-m isort'
" 自動整形
let g:ale_python_black_executable = g:python3_host_prog
let g:ale_python_black_options = '-m black'

" ついでにFixを実行するマッピングしとく
nmap <silent> <Leader>x <Plug>(ale_fix)
" ファイル保存時に自動的にFixするオプションもあるのでお好みで
" let g:ale_fix_on_save = 1