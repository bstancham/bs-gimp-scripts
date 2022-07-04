(define (bs-batch-scale-image pattern scale-amt)
  (let* ((filelist (cadr (file-glob pattern 1))))
    (while (not (null? filelist))
           (let* ((filename (car filelist))
                  (image (car (gimp-file-load RUN-NONINTERACTIVE
                                              filename filename)))
                  (drawable (car (gimp-image-get-active-layer image))))

             (gimp-image-scale image
                               (* scale-amt (car (gimp-image-width image)))
                               (* scale-amt (car (gimp-image-height image))))

             (gimp-file-save RUN-NONINTERACTIVE
                             image drawable filename filename)
             (gimp-image-delete image))
    (set! filelist (cdr filelist)))))

(script-fu-register
 "bs-batch-scale-image"                        ;func name
 "bs-batch-scale-image"                        ;menu label
 "Scales first image in the image-list." ;description
 "B. S. Tancham"                         ;author
 "Copyright 2018, B. S. Tancham"         ;copyright notice
 "January 2018"                          ;date created
 ""                                      ;image type that the script works on
 SF-IMAGE "The Image" 0
 SF-VALUE "Scale amount" "1.0"           ; a float variable
 )

(script-fu-menu-register "bs-batch-scale-image" "<Image>/bstancham")
