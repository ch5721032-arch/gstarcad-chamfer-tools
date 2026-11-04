;; chamfer-angle.lsp - Chamfer with a distance and an angle
;; Command: CHANG
(defun c:CHANG ( / d a r en1 en2 )
  (setq d (getreal "\nChamfer distance <10>: "))
  (if (null d) (setq d 10.0))
  (setq a (getreal "\nChamfer angle <45>: "))
  (if (null a) (setq a 45.0))
  (setq r (* a (/ pi 180.0)))
  (setvar "CHAMFERA" d)
  (setvar "CHAMFERB" (/ d (/ (sin r) (cos r))))
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
