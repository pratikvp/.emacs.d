;; set mark when we go backward-up-list:
(defadvice backward-up-list (around my-backward-up-list-advice activate)
  "stuffs"
  (push-mark (point) t)
  ad-do-it)

(defadvice article-fill-long-lines (around my-article-fill-long-lines-advice activate)
  "override `fill-column' due to the way article-fill-long-lines
  uses it"
  (let ((fill-column (- (window-width (get-buffer-window (current-buffer)))
                        5)))
    ad-do-it))

(defadvice shell-command (around my-shell-command-advice activate)
  "Put `*Shell Command Output*' buffers into `view-mode'."
  ad-do-it
  (with-current-buffer "*Shell Command Output*"
    (view-mode)))

;; Shrink *Occur* buffer if smallish:
(defadvice occur (around my-occur-advice activate)
  "Make *Occur* buffer small if possible"
  ad-do-it
  (my-switch-to-buffer-and-shrink "*Occur*"))
