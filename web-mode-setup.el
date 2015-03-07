(require 'web-mode)

(defun my-current-buffer-django-p ()
  (save-excursion
    (search-forward-regexp "{% base\\|{% if\\|{% for\\|{% include\\|{% block\\|{% csrf_token %}\\|{% url\\|{{ "
                           nil
                           t)))

(setq web-mode-engines-alist
      '(("django". "\\.djhtml")
        ("django" . my-current-buffer-django-p)
        ("php" . "\\.php")))

(define-key web-mode-map (kbd "C-;") nil)
(setq-default web-mode-markup-indent-offset 2)
