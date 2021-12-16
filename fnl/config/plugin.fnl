(module config.plugin
        {autoload {nvim aniseed.nvim
                   a aniseed.core
                   util config.util
                   packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

; plugins managed by packer
(use
  ; plugin Manager
  :wbthomason/packer.nvim {}

  ; nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ; clojure
  :Olical/conjure {:branch :master 
                   :mod :conjure}

  ; Start a REPL from within Vim
  :tpope/vim-dispatch {}
  :clojure-vim/vim-jack-in {}
  :radenling/vim-dispatch-neovim {}

  ; file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}

  ; parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ; lsp
  :neovim/nvim-lspconfig {:mod :lspconfig 
                          :requires :williamboman/nvim-lsp-installer} ; requirement for this setup, not in general

  ; autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/vim-vsnip
                                :hrsh7th/vim-vsnip-integ
                                :PaterJason/cmp-conjure]
                     :mod :cmp}

  ; theme
  :projekt0n/github-nvim-theme {:mod :theme}

  ; which-key
  :folke/which-key.nvim {:mod :which-key}

  ; rainbow brackets
  :p00f/nvim-ts-rainbow {:mod :rainbow}

  ; airline
  :vim-airline/vim-airline {}

  ; Git & Git graph
  :tpope/vim-fugitive {:mod :git}
  :junegunn/gv.vim {}
  :airblade/vim-gitgutter {}

  ; Debugger Adapter Protocol
  :mfussenegger/nvim-dap {:mod :debugger}
  :theHamsta/nvim-dap-virtual-text {:requires [:mfussenegger/nvim-dap :nvim-treesitter/nvim-treesitter]
                                    :run ":TSUpdate"}

  ; scala ls
  :scalameta/nvim-metals {:requires :nvim-lua/plenary.nvim
                          :mod :scala}

  ; colorizer
  :norcalli/nvim-colorizer.lua {:mod :colorizer}

  ; NERDTree
  :scrooloose/nerdtree {:mod :nerdtree}
  :Xuyuanp/nerdtree-git-plugin {:requires :scrooloose/nerdtree}

  ; surround
  :tpope/vim-surround {}

  ; lightspeed (better vim-sneak)
  :ggandor/lightspeed.nvim {:requires :tpope/vim-repeat}

  ; hop
  :phaazon/hop.nvim {:mod :hop}

  ; clipboard / registers
  :AckslD/nvim-neoclip.lua {:mod :neoclip}

  ; argument text objects
  :vim-scripts/argtextobj.vim {}

  ; prettier
  :prettier/vim-prettier {}
)
