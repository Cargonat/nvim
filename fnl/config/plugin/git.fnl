(module config.plugin.git
  {autoload {keys which-key}})

(keys.register
  { :<leader>g {
                :name :+git
                :v {:name :+visual 
                    :g [":GV<CR>" "full graph"]
                    :c [":GV!<CR>" "graph for current file"]
                    :l [":GV?<CR>" "locations for current file"]}
                :b [":Git blame<CR>" :blame]
                :c [":Git commit<CR>" :commit]
                :d [":Git diff<CR>" :diff]
                :f [":Git fetch<CR>" :fetch]
                :g [":Git<CR>" :summary]
                :l [":Git log<CR>" :log]
                :m [":Git mergetool<CR>" :mergetool]
                :r [":Git rebase -i<CR>" :rebase]
                :p {:name :+push/pull
                    :s [":Git push<CR>" :push]
                    :l [":Git pull<CR>" :pull]
                    }
                }})
