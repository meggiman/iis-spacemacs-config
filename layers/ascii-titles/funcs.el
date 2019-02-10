(defun ascii-title-default-create-on-region ()
  "Applies the default figlet ASCII-Art format to region."
  (interactive)
  (progn
    (let ((temp-mark (copy-marker (region-beginning) nil)))
      (call-interactively 'figlet-figletify-region)
      (set-mark (marker-position temp-mark)))
    (activate-mark)
    (call-interactively 'comment-box)))

(defun ascii-title-create-on-region ()
  "Asks to choose  a figlet ASCII-Art format and applies the chosen format to region."
  (interactive)
  (progn
    (let ((temp-mark (copy-marker (region-beginning) nil)))
      (let ((current-prefix-arg t))
        (call-interactively 'figlet-figletify-region))
      (set-mark (marker-position temp-mark))
      (list (point) (mark)))
    (activate-mark)
    (call-interactively 'comment-box)))
