# GstarCAD Chamfer Tools

Chamfer with two distances, with a distance and an angle, or apply the same chamfer to every corner of a polyline.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

Chamfer asks for distances, angles and options before it will do anything. These commands ask for exactly the numbers you have, set the system variables, and then run the chamfer, including a one-step chamfer for every corner of a polyline.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/chamfer-distance.lsp` | ;; chamfer-distance.lsp - Chamfer with two distances
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
 |
| `scripts/chamfer-angle.lsp` | ;; chamfer-angle.lsp - Chamfer with a distance and an angle
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
 |
| `scripts/chamfer-polyline.lsp` | ;; chamfer-polyline.lsp - Chamfer every corner of a polyline
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
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
