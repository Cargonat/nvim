(module config.plugin.nerdtree
  {autoload {nvim aniseed.nvim
             keys which-key}})

(keys.register
  { :<leader>n {:name :+NERDTree
                :t [":NERDTree<CR>" :NERDTree]
                }})

; Exit Vim if NERDTree is the only window remaining in the only tab.
(vim.api.nvim_command "autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

; Close the tab if NERDTree is the only window remaining in it.
(vim.api.nvim_command "autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif")

; change arrows
(set nvim.g.NERDTreeDirArrowExpandable "▸")
(set nvim.g.NERDTreeDirArrowCollapsible "▾")
