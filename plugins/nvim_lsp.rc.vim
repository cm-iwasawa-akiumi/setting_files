lua require'nvim_lsp'.pyls.setup{}

"omnifuncを設定
autocmd Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc

"lsp.txtのg -> lに
"nnoremap <silent> ld    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> lD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> <c-[>   <cmd>lua vim.lsp.buf.type_definition()<CR>

