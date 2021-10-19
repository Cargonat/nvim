(module config.plugin.hop
  {autoload {hop hop
             keys which-key}})

(hop.setup)

(keys.register
  { :<leader><leader> {
                :name :+hop
                :w [":HopWord<CR>" :word]
                :/ [":HopPattern<CR>" :pattern]
                :f [":HopChar1<CR>" "one char"]
                :s [":HopChar2<CR>" "two chars"]
                :l [":HopLine<CR>" :line]
                }})
