;; chamfer-polyline.lsp - Chamfer every corner of a polyline
;; Command: CHPOLY
(defun c:CHPOLY ( / d en )
  (setq d (getreal "\nChamfer distance <5>: "))
  (if (null d) (setq d 5.0))
  (setvar "CHAMFERA" d)
  (setvar "CHAMFERB" d)
  (setq en (car (entsel "\nSelect polyline: ")))
  (if en
    (progn
      (command "_.CHAMFER" "_P" en)
      (princ "\nPolyline chamfered.")
    )
  )
  (princ)
)
