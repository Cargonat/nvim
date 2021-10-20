(module config.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             cmplsp cmp_nvim_lsp
             keys which-key}})

; TODO automatic installation of lsp servers using nvim-lsp-installer

;symbols to show for lsp diagnostics
(vim.fn.sign_define "LspDiagnosticsSignError" {:text ""})
(vim.fn.sign_define "LspDiagnosticsSignWarning" {:text ""})
(vim.fn.sign_define "LspDiagnosticsSignInformation" {:text ""})
(vim.fn.sign_define "LspDiagnosticsSignHint" {:text ""})

(keys.register {:<leader>l {:name :+lsp :? [":LspInstallInfo<CR>" "LSP Install Info"]}})

;server features
(let [handlers {"textDocument/publishDiagnostics"
                (vim.lsp.with
                  vim.lsp.diagnostic.on_publish_diagnostics
                  {:severity_sort true
                   :update_in_insert false
                   :underline true
                   :virtual_text false})
                "textDocument/hover"
                (vim.lsp.with
                  vim.lsp.handlers.hover
                  {:border "single"})
                "textDocument/signatureHelp"
                (vim.lsp.with
                  vim.lsp.handlers.signature_help
                  {:border "single"})}
      capabilities (cmplsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
      on_attach (fn [client bufnr]
                  (do
                    (keys.register 
                      { :<leader>l {
                                    :name :+lsp
                                    :d ["<Cmd>lua vim.lsp.buf.declaration()<CR>" "declaration"]
                                    :t ["<cmd>lua vim.lsp.buf.type_definition()<CR>" "definition"]
                                    :h ["<cmd>lua vim.lsp.buf.signature_help()<CR>" "signature help"]
                                    :n ["<cmd>lua vim.lsp.buf.rename()<CR>" "rename"]
                                    :e ["<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" "show line diagnostics"]
                                    :q ["<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" "set loclist"]
                                    :f ["<cmd>lua vim.lsp.buf.formatting()<CR>" "formatting"]
                                    :j ["<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" "goto next"]
                                    :k ["<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" "goto previous"]
                                    ;telescope
                                    :a [":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_cursor())<cr>" "code actions"]
                                    :w [":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>" "workspace diagnostics"]
                                    :r [":lua require('telescope.builtin').lsp_references()<cr>" "references"]
                                    :i [":lua require('telescope.builtin').lsp_implementations()<cr>" "implementations"]
                                    }} 
                      {:buffer bufnr})
                    (nvim.buf_set_keymap bufnr :v :<leader>la ":lua require('telescope.builtin').lsp_range_code_actions(require('telescope.themes').get_cursor())<cr>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
                    (nvim.buf_set_keymap bufnr :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})))
      default_options {:on_attach on_attach :handlers handlers :capabilities capabilities}]

  ; Clojure
  (lsp.clojure_lsp.setup default_options)

  ; CSS
  (lsp.cssls.setup default_options)

  ; HTML
  (lsp.html.setup default_options)

  ; Java
  (lsp.jdtls.setup default_options) ; probably have to do more config, see lsp-config CONFIG.md

  ; JSON
  (lsp.jsonls.setup default_options)

  ; LaTeX
  (lsp.texlab.setup default_options)

  ; Python
  (lsp.pyright.setup default_options)

  ; TailwindCSS
  (lsp.tailwindcss.setup default_options)

  ; TypeScript
  (lsp.tsserver.setup default_options)

  ; YAML
  (lsp.yamlls.setup default_options)
)
