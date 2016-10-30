" emmet
let g:user_emmet_mode = 'i'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\   'variables': {
\     'lang': "ja"
\   },
\   'indentation': '    '
\ }

" unite-rails
nnoremap <silent> [unite]Rm :<C-u>Unite<Space>>rails/model<CR>
nnoremap <silent> [unite]Rv :<C-u>Unite<Space>rails/view<CR>
nnoremap <silent> [unite]Rc :<C-u>Unite<Space>rails/controller<CR>
nnoremap <silent> [unite]RC :<C-u>Unite<Space>rails/config<CR>
nnoremap <silent> ,vr :UniteResume<CR>

