(local ts_utils (require "nvim-treesitter.ts_utils"))
(local configs (require "nvim-treesitter.configs"))
(local query (require "nvim-treesitter.query"))
(local locals (require "nvim-treesitter.locals"))
(local vim _G.vim)
(local map vim.api.nvim_set_keymap)
(local {: view} (require "aniseed.deps.fennel"))

(fn p [x] (print (view x)))

(fn dbg [x]
  (p x)
  x)

(fn location< [aline acol bline bcol]
  (and (<= aline bline) (< acol bcol)))

;; (fn get-named-child [node name]
;;   (accumulate [curr nil
;;                _ item (node:iter_children)
;;                :until curr]
;;     (if (all (item:named) (= item:))))
;;   )
;;
;; (fn up []
;;   ;; (local block (query.get_capture_matches_recursively 0 "@block.outer" "textobjects"))
;;   ;; (local block (locals.get_scopes 0))
;;   ;; (local (_ range block) (shared.textobject_at_point "@block.outer" nil 0))
;;   (p block)
;;   )
(fn first-below [node types]
  (var types (if (= (type types) :string)
              [types]
              types))
  (var node-table (collect [_ ty (ipairs types)]
                    ty true))

  (var prev nil)
  (var current node)
  (while (and current (not (. node-table (current:type))))
    (set prev current)
    (set current (current:parent)))
  prev)

(fn first-of [node types]
  (var node node)
  (var types (if (= (type types) :string)
              [types]
              types))
  (var node-table (collect [_ ty (ipairs types)]
                    ty true))
  (while (and node (not (. node-table (node:type))))
    (set node (node:parent)))
  node)

(fn up [bufnr]
  (local bufnr (or bufnr 0))
  (local current (ts_utils.get_node_at_cursor bufnr))
  ;; scopes is already sorted on pos
  (local scopes (icollect [_ scope (ipairs (locals.get_scopes bufnr))]
                  (if (and (ts_utils.is_parent scope current) (not= scope current))
                    scope)))
  ;; (dbg (icollect [_ scope (ipairs scopes)]
  ;;        (let [child (scope:named_child 0)
  ;;              (a b x y) (child:range)]
  ;;        [(vim.api.nvim_buf_get_text bufnr a b x y {}) (scope:id)]))
  ;;          )
  (when (not= 0 (length scopes))
    (ts_utils.goto_node (. scopes (length scopes)))))

(fn down [bufnr]
  (local bufnr (or bufnr 0))
  (local current (ts_utils.get_node_at_cursor bufnr))
  (local scopes (icollect [_ scope (ipairs (locals.get_scopes bufnr))]
                  (if (and (ts_utils.is_parent current scope) (not= scope current))
                    scope)))
  (table.sort scopes #(location< ($1:start) ($2:start)))
  (when (not= 0 (length scopes))
    (ts_utils.goto_node (. scopes 1)))
  )

(fn sibling [bufnr direction]
  (local bufnr (or bufnr 0))
  (local next-node (match direction
                     :prev ts_utils.get_previous_node
                     :next ts_utils.get_next_node
                     _ (error "unknown direction")))
  (-?>
    (ts_utils.get_node_at_cursor bufnr)
    (dbg)
    (first-below [:block :module])
    (next-node false false)
    (ts_utils.goto_node)))

;; (set _G.ts_up up)
;; (set _G.ts_down down)
;; (set _G.ts_next goto-sibling)
;;
;; (map :n "<a-i>" ":lua _G.ts_up()<cr>" {:silent true})
;; (map :n "<a-e>" ":lua _G.ts_down()<cr>" {:silent true})
;; (map :n "<a-n>" ":lua _G.ts_next(0, 'prev')<cr>" {:silent true})
;; (map :n "<a-o>" ":lua _G.ts_next(0, 'next')<cr>" {:silent true})
;;
{: up
 : down
 : sibling}
