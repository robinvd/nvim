(local utils (require "utils"))

(fn search-replace [pattern repl]
  (local l (vim.fn.getline "."))
  (local (new count) (string.gsub l pattern repl))
  (local found-match (< 0 (or count 0)))
  (if found-match
      (vim.fn.setline "." new))
  found-match)

(fn toggle-markdown-check []
  (or
    (search-replace "^%- %[ %]" "- [x]")
    (search-replace "^%- %[x%]" "- [ ]")
    (search-replace "^%- (%w)" "- [ ] %1")))

{:toggle_markdown_check toggle-markdown-check}
