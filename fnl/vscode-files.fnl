(local sorters (require "telescope.sorters"))
(local frecency-db (require "telescope._extensions.frecency.db_client"))
(local path (require "plenary.path"))

(fn get-default [tbl key default]
  (or (. tbl key) default))

(fn ends-with [str ending]
  (= (str:sub (- (length ending))) ending))

(fn get-frecency-sorter [opts]
  (local opts (or opts {}))
  (let [super (or opts.inner_sorter (sorters.get_generic_fuzzy_sorter opts))
        sorter-opts {}]

    (fn sorter-opts.init [self]
      (let [base-dir (_G.vim.fn.getcwd)
            file-scores (frecency-db.get_file_scores false base-dir)]
        (set self.file_scores {})
        (each [_i item (ipairs file-scores)]
          (tset self.file_scores item.filename
                (math.max item.score (get-default self.file_scores item.filename 0))))
        ))

    (fn sorter-opts.scoring_function [self prompt line entry]
      (local abs (-> line (path.new) (: :absolute)))
      (local score (. self :file_scores abs))
      (when (ends-with line "wrapper.lua")
        (print "li" abs score))
      (if (not= (length prompt) 0)
        (super:scoring_function prompt line entry)
        (match (. self.file_scores (: (path.new line) "absolute"))
        ;; (match (. self.file_scores (.. (_G.vim.fn.getcwd) "/" line))
          nil 1
          0 1
          file-score (/ 1 file-score)

          )))

    (sorters.new (setmetatable sorter-opts {:__index (fn [_table key] (. super key))}))))

{:get_frecency_sorter get-frecency-sorter}
