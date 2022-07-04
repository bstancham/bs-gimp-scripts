(define (bs-scale-image img scale-amt)
  (gimp-image-scale img
                    (* scale-amt (car (gimp-image-width img)))
                    (* scale-amt (car (gimp-image-height img)))))

(script-fu-register
 "bs-scale-image"                        ;func name
 "bs-scale-image"                        ;menu label
 "Scales first image in the image-list." ;description
 "B. S. Tancham"                         ;author
 "Copyright 2018, B. S. Tancham"         ;copyright notice
 "January 2018"                          ;date created
 ""                                      ;image type that the script works on
 SF-IMAGE "The Image" 0
 SF-VALUE "Scale amount" "1.0"           ; a float variable
 )

(script-fu-menu-register "bs-scale-image" "<Image>/bstancham")
