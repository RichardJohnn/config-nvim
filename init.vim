call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-conflicted'
Plug 'jremmen/vim-ripgrep'
Plug 'dyng/ctrlsf.vim'
Plug 'dense-analysis/ale'
Plug 'flazz/vim-colorschemes'
Plug 'gko/vim-coloresque'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'evanleck/vim-svelte'
Plug 'Shougo/context_filetype.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'godlygeek/tabular'

Plug 'terryma/vim-expand-region'

" Plug 'robitx/gp.nvim', { 'do': 'require("gp").setup()' }
" Plug 'jackMort/ChatGPT.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nosduco/remote-sshfs.nvim'

Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim'
" let g:copilot_node_command = "/Users/richardkubina/.asdf/shims/node"

call plug#end()

let g:copilot_npx = v:true

set mouse=r

set ignorecase
set infercase
set smartcase

set number

set showcmd
set nobackup
set noswapfile

set autoindent
set smartindent
set tabstop=2
set smarttab
set shiftwidth=2
set shiftround
set expandtab

set foldmethod=syntax
set nofoldenable
"set foldlevelstart=10
set foldnestmax=10

verbose set foldmarker?

"ctrl-p
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=999
let g:ctrlp_switch_buffer = 'et'

let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cmd = 'CtrlPLastMode'
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

if executable('rg')
  set grepprg=rg\ --vimgrep
  let g:ctrlp_user_command = 'rg --files  %s'
endif

let g:rg_derive_root = 'true'

let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\'

:command! Pp %!python3 -m json.tool

" insert new lines from normal mode
nmap <CR> o<Esc>

" insert space from normal mode
nmap <space> a<space><Esc>h

" console.log the Word under your cursor above
nnoremap <Leader>k  "zyiwOconsole.log("<C-r>z", <C-r>z);<Esc>
" below
nnoremap K "zyiwoconsole.log("<C-r>z", <C-r>z);<Esc>
map K "zyoconsole.log("<C-r>z", <C-r>z);<Esc>

" close file but keep buffer open
nnoremap <Leader>q :bp\|bd #<CR>

" search replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap <F1> <nop>
nnoremap Q <nop>

nnoremap <silent> <C-l> :vertical resize +5<cr>
nnoremap <silent> <C-h> :vertical resize -5<cr>
nnoremap <silent> <C-k> :resize +5<cr>
nnoremap <silent> <C-j> :resize -5<cr>

"remove highlight
nnoremap <leader><space> :nohlsearch<CR>

" Open files located in the same dir in with the current file is edited
map <leader>e :e <C-R>=escape(expand("%:p:h"), '[]') . "/" <CR>

"CtrlSF -----------------------------------------
nmap     <leader>f <Plug>CtrlSFPrompt

" nnoremap <leader>c :ChatGPT<CR>
" nnoremap <leader>C :ChatGPTEditWithInstructions<CR>

" Show autocomplete
inoremap <silent><expr> <C-Space> coc#refresh()

" Go to definition
nmap gd <Plug>(coc-definition)

" Show hover info
nmap K :call CocActionAsync('doHover')<CR>

" Rename variable
nmap <leader>rn <Plug>(coc-rename)

" Auto-import suggestions
nmap <leader>i <Plug>(coc-codeaction)

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

" let g:ctrlsf_regex_pattern = 1

"--------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'wombat',
        \ 'component_function': {
        \   'filename': 'LightlineFilename',
        \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction




" NERDCommenter settings
autocmd VimEnter * NERDTreeToggle | NERDTreeToggle | wincmd p

"colors
colorscheme lodestone

"{
  "yank_register = "+",
  "keymaps = {
    "close = { "<C-c>", "<Esc>" },
    "yank_last = "<C-y>",
    "scroll_up = "<C-u>",
    "scroll_down = "<C-d>",
    "toggle_settings = "<C-o>",
    "new_session = "<C-n>",
    "cycle_windows = "<Tab>",
  "}
"})

" svelte 
" -------------------------------------
" Context filetypes for NERDCommenter and more
" -------------------------------------
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif
let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '</script>',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]

let g:ft = ''

" -------------------------------------
" NERDCommenter settings
" -------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCustomDelimiters = { 'html': { 'left': '' } }

" Align comment delimiters to the left instead of following code indentation
let g:NERDDefaultAlign = 'left'

fu! NERDCommenter_before()
  if (&ft == 'html') || (&ft == 'svelte')
    let g:ft = &ft
    let cfts = context_filetype#get_filetypes()
    if len(cfts) > 0
      if cfts[0] == 'svelte'
        let cft = 'html'
      elseif cfts[0] == 'scss'
        let cft = 'css'
      else
        let cft = cfts[0]
      endif
      exe 'setf ' . cft
    endif
  endif
endfu

fu! NERDCommenter_after()
  if (g:ft == 'html') || (g:ft == 'svelte')
    exec 'setf ' . g:ft
    let g:ft = ''
  endif
endfu

" Prettier Settings
" let g:prettier#autoformat = 1
" let g:prettier#autoformat_require_pragma = 0

" let g:ale_linters = {
" \   'typescript': []
" \}

let g:ale_echo_msg_format = '%linter% says %s'

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" lua require('chatgpt').setup()
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}  

runtime macros/matchit.vim

lua << EOF
require('remote-sshfs').setup({
  -- Configuration options here
  -- or leave empty for defaults
})

vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = false })

require("CopilotChat").setup()

-- Quick chat keybinding
vim.keymap.set('n', '<leader>ccq', function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer
    })
  end
end, { desc = "CopilotChat - Quick chat" })
EOF
