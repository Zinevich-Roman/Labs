(defrule ask-fluffy
  (initial-fact)
  =>
  (printout t "Хотите пушистого питомца? (yes/no): ")
  (bind ?ans (read))
  (assert (is-fluffy ?ans)))
(defrule ask-walks
  (is-fluffy yes)
  =>
  (printout t "У вас есть время с ним гулять на улице? (yes/no): ")
  (bind ?ans (read))
  (assert (needs-walk ?ans)))
(defrule ask-aqua
  (is-fluffy no)
  =>
  (printout t "У вас есть аквариум? (yes/no): ")
  (bind ?ans (read))
  (assert (has-aqua ?ans)))
(defrule result-dog
  (needs-walk yes) => (printout t ">> Предлагаю собаку" crlf))

(defrule result-cat
  (needs-walk no) => (printout t ">> Предлагаю кошку" crlf))

(defrule result-fish
  (has-aqua yes) => (printout t ">> Предлагаю рыбку" crlf))

(defrule result-parrot
  (has-aqua no) => (printout t ">> Предлагаю попугая" crlf))

(defrule error-handler
  (or (is-fluffy ?x&~yes&~no)
      (needs-walk ?x&~yes&~no)
      (has-aqua ?x&~yes&~no))
  =>
  (printout t ">> Я понимаю только команды yes или no." crlf)
  (printout t ">> Введите (reset) и затем (run) для перезапуска" crlf))
