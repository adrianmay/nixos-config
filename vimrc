
set encoding=utf-8
set nocompatible
let g:haddock_browser="/usr/bin/firefox"
let maplocalleader=","
syntax on
filetype plugin on
"set ofu=syntaxcomplete#Complete
filetype plugin indent on
"au BufEnter *.hs compiler ghc

" errorformat=
" %*[^"]"%f"%*\D%l: %m,
" "%f"%*\D%l: %m,
" %-G%f:%l: (Each undeclared identifier is reported only once,
" %-G%f:%l: for each function it appears in.),
" %-GIn file included from %f:%l:%c:,
" %-GIn file included from %f:%l:%c\,,
" %-GIn file included from %f:%l:%c,
" %-GIn file included from %f:%l,
" %-G%*[ ]from %f:%l:%c,
" %-G%*[ ]from %f:%l:,
" %-G%*[ ]from %f:%l\,,
" %-G%*[ ]from %f:%l,
" %f:%l:%c:%m,
" %f(%l):%m,
" %f:%l:%m,
" "%f"\, line %l%*\D%c%*[^ ] %m,
" %D%*\a[%*\d]: Entering directory %*[`']%f',
" %X%*\a[%*\d]: Leaving directory %*[`']%f',
" %D%*\a: Entering directory %*[`']%f',
" %X%*\a: Leaving directory %*[`']%f',
" %DMaking %*\a in %f,
" %f|%l| %m
	
set noequalalways
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set nowrap
set ruler
set nu
set ai
"set title
"set statusline+=%F
set laststatus=2
set modeline
set splitbelow
set isf+=>

set updatetime=300
set shortmess+=c


if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" 
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
syntax on
filetype plugin on
filetype plugin indent on
"
" nmap <silent> <C-N> <Plug>(coc-diagnostic-next)
" nmap <silent> <C-N> <Plug>(coc-diagnostic-prev)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" 
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
" 
" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" 
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
" 
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)
" 
" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" 
" 
" " Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
" 
" " Use CTRL-S for selections ranges.
" " Requires 'textDocument/selectionRange' support of language server.
" nmap <silent> <C-s> <Plug>(coc-range-select)
" xmap <silent> <C-s> <Plug>(coc-range-select)
" 
" " Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocAction('format')
" 
" " Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" 
" " Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" 
" " Add (Neo)Vim's native statusline support.
" " NOTE: Please see `:h coc-status` for integrations with external plugins that
" " provide custom statusline: lightline.vim, vim-airline.
" " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" 
" " Mappings for CoCList
" " Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" set undofile
" set undodir=~/.vim/undo/

set scrolloff=10000

set background=light
" colorscheme adrian
" set background=dark
" colorscheme ad
" let g:solarized_termcolors=16
" colorscheme evening
" colorscheme bw
" colorscheme winter
" colorscheme abra
colorscheme ChocolatePapaya


hi Normal cterm=bold ctermbg=230
hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=239 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=249 guifg=#b2b2b2 ctermbg=237 guibg=#3a3a3a cterm=none gui=none
hi QuickFixLine guifg=#ffffff guibg=#4e4e4e ctermbg=LightGreen cterm=bold cterm=NONE
set hlsearch

" Enable CursorLine
set cursorline
highlight CursorLine gui=bold 
" autocmd InsertEnter * highlight CursorLine guibg=white gui=NONE 
" autocmd InsertLeave * highlight CursorLine guibg=NONE gui=NONE 
autocmd InsertEnter * highlight CursorLine ctermbg=Yellow cterm=bold
autocmd InsertLeave * highlight CursorLine ctermbg=NONE cterm=NONE
" autocmd InsertEnter * set cursorline
" autocmd InsertLeave * set nocursorline
highlight MatchParen cterm=bold guibg=Gray guifg=black
" ctermbg=Blue

augroup CursorLine
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

function! s:DiffWithDisk()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffDisk call s:DiffWithDisk()

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery


autocmd FileType javascript let b:surround_45 = "/* \r */"
autocmd FileType c let b:surround_45 = "/* \r */"
autocmd FileType html let b:surround_45 = "<!-- \r -->"

" Commenting blocks of code.
autocmd FileType c,cpp,java,javascript let b:comment_leader = '// '
autocmd FileType sh,ruby,python         let b:comment_leader = '# '
autocmd FileType conf,fstab             let b:comment_leader = '# '
autocmd FileType tex                    let b:comment_leader = '% '
autocmd FileType mail                   let b:comment_leader = '> '
autocmd FileType vim                    let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


imap [] []<Esc>i
imap () ()<Esc>i
imap "" ""<Esc>i
imap '' ''<Esc>i
imap {] {<CR>}<Esc>ko
nmap <INS> :set nopaste!<CR>

map <S-Tab> :wa<CR>:bnext<CR>

let g:asyncrun_open = 80
nmap <CR> :wa<CR>
nmap <Space><Space> :wa<CR>:AsyncRun make test<CR>
nmap <Space> :wa<CR>:AsyncRun make<CR>
nmap gh<Space> :wa<CR>:AsyncRun hint<CR>
nmap <Delete> :AsyncStop<CR>
nmap g<Space> :AsyncStop<CR>
nmap <F7> :cclose<CR>
nmap gg<Space> :cclose<CR>
nmap > :cn<CR>
nmap < :cp<CR>

vmap <F3> y:AsyncRun ./srcs \| xargs -d '\n' grep -wn "<C-R>""<CR>
vmap g<F3> y:AsyncRun ./srcs \| xargs -d '\n' grep -n "<C-R>""<CR>
vmap gg<F3> y:AsyncRun ./files \| xargs -d '\n' grep -n "<C-R>""<CR>

map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


map <MouseUp> <nop>
map <MouseDown> <nop>
nmap <MouseUp> <nop>
nmap <MouseDown> <nop>
imap <MouseUp> <nop>
imap <MouseDown> <nop>
vmap <MouseUp> <nop>
vmap <MouseDown> <nop>

map <ScrollWheelUp> <nop>
map <ScrollWheelDown> <nop>
nmap <ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
imap <ScrollWheelUp> <nop>
imap <ScrollWheelDown> <nop>
vmap <ScrollWheelUp> <nop>
vmap <ScrollWheelDown> <nop>

noremap <ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
nnoremap <ScrollWheelUp> <nop>
nnoremap <ScrollWheelDown> <nop>
inoremap <ScrollWheelUp> <nop>
inoremap <ScrollWheelDown> <nop>
vnoremap <ScrollWheelUp> <nop>
vnoremap <ScrollWheelDown> <nop>

tnoremap <C-l> <C-W>l
tnoremap <C-h> <C-W>h
tnoremap <C-j> <C-W>j
tnoremap <C-k> <C-W>k

map <M-Esc>[62~ <nop>
map! <M-Esc>[62~ <nop>
map <M-Esc>[63~ <nop>
map! <M-Esc>[63~ <nop>
map <M-Esc>[64~ <nop>
map! <M-Esc>[64~ <nop>
map <M-Esc>[65~ <nop>
map! <M-Esc>[65~ <nop>

nmap _ :set number!

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

let g:ConqueGdb_GdbExe = '/home/adrian.may/bin/mips-linux-gdb'

:set list lcs=tab:˲\ 
autocmd FileChangedRO * :!p4 edit %
autocmd FileType haskell setlocal ts=2 sw=2 expandtab

imap jj <Esc>
nnoremap ff :wqa<CR>
nnoremap vv :buffers<CR>:buffer<Space>

nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j
nnoremap <c-e> <c-u>

nnoremap <C-Left> 20<C-W><
nnoremap <C-Right> 20<C-W>>
nnoremap <C-Up> 10<C-W>-
nnoremap <C-Down> 10<C-W>+

set mouse=

"highlight ForbiddenWhitespace ctermbg=red guibg=red
"match ForbiddenWhitespace /\s\+$\|\t/
"autocmd InsertEnter * match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/
"highlight CocErrorFloat ctermfg=yellow cterm=bold

" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif

set termguicolors

au FocusGained,BufEnter * :checktime
au FocusGained,BufEnter * :checktime

