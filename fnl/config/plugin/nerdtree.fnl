(module config.plugin.nerdtree
  {autoload {keys which-key}})

(keys.register
  { :<leader>n {
                :name :+NERDTree
                :t [":NERDTree<CR>" :NERDTree]
                }})
