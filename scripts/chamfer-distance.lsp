;; chamfer-distance.lsp - Chamfer with two distances
;; Command: CHDIST
(defun c:CHDIST ( / d1 d2 en1 en2 )
  (setq d1 (getreal "\nFirst chamfer distance <10>: "))
  (if (null d1) (setq d1 10.0))
  (setq d2 (getreal "\nSecond chamfer distance <10>: "))
  (if (null d2) (setq d2 10.0))
  (setvar "CHAMFERA" d1)
  (setvar "CHAMFERB" d2)
  (setq en1 (car (entsel "\nSelect first line: ")))
  (if en1
    (progn
      (setq en2 (car (entsel "\nSelect second line: ")))
      (if en2
        (command "_.CHAMFER" en1 en2)
      )
    )
  )
  (princ)
)
