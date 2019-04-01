set hidden
if exists("$VIRTUAL_ENV")
let g:LanguageClient_serverCommands = {
      \ 'python': ['pyls'],
      \ }
else
let g:LanguageClient_serverCommands = {
      \ 'python': ['/Users/iwasawa.akiumi/.pyenv/versions/neovim3/bin/pyls'],
      \ }
endif
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0
set completefunc=LanguageClient#complete

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
