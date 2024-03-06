#lang racket

;; Exercise 3: A CE (Control and Environment) interpreter for Scheme

;; NOTE: You *MAY* collaborate with other students on this exercise,
;; but *not* the later project. Feel free to work with up to two other
;; students (groups of three) and submit the same code as them. Use
;; that code to begin your solution for p3.

;; Name: ________________________________
;; Collaborator 1: ________________________________
;; Collaborator 2: ________________________________
(provide interp-ce)

; Interp-ce must correctly interpret any valid scheme-ir program and yield the same value
; as DrRacket, except for closures which must be represented as `(closure ,lambda ,environment).
; (+ 1 2) can return 3 and (cons 1 (cons 2 '())) can yield '(1 2). For programs that result in a 
; runtime error, you should return `(error ,message)---giving some reasonable string error message.
; Handling errors and some trickier cases will give bonus points. 
(define (interp-ce exp)
  (define (interp env exp)
    (match exp
      [(or (? number?) (? boolean?)) exp]
      [`(let ([,xs ,rhss] ...) ,body)
       'todo]
      [`(lambda ,args ,body)
       'todo]
      [(? symbol? x)
       'todo]
      [`(if ,ge ,te ,fe)
       'todo]
      ;; not required, but you may want to add this
      [`(apply-prim ,op ,x)
       'todo]
      [`(,ef ,eargs ...)
       'todo]))
  ;; TODO: update?
  (define starting-env (hash))
  (interp starting-env exp))
