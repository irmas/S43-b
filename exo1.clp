(deftemplate Feature "Definition of the feature structure"
	(slot Name (type SYMBOL) (default none))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Length (type FLOAT) (default 0.0))
	(slot Diameter (type FLOAT) (default 0.0))
	(slot Tapping (type INTEGER) (default 0))
	(slot Bottom (type SYMBOL) (allowed-symbols Conical Square None)(default Conical))
	(slot Chamfer (type INTEGER) (default 0))
)

(defrule Init "Rule which triggers with the no-fact fact"
(initial-fact)
=>
(assert(Feature (Name F1)(Ftype NonThrough)(Length 20.0)(Diameter 40.0)(Tapping 1)(Bottom Square)(Chamfer 1)))
(assert(Feature (Name F2)(Ftype NonThrough)(Length 10.0)(Diameter 35.0)(Bottom Square)))
(assert(Feature (Name F3)(Ftype NonThrough)(Length 33.0)(Diameter 25.0)(Bottom Square)(Chamfer 1)))
(assert(Feature (Name F4)(Ftype NonThrough)(Length 20.0)(Diameter 10.0)(Chamfer 1)))
(assert(Feature (Name F5)(Ftype Through)(Length 15.0)(Diameter 18.0)(Tapping 1)(Bottom None)(Chamfer 1)))
)

(defrule deepDrilling "Deep drilling"
	?feature <- (Feature (Name ?Nam) (Ftype NonThrough) (Length ?Len) (Diameter ?Dia) (Tapping 0) (Bottom Conical))
	(test(>=(/ ?Len ?Dia)2.0))
=>
	(printout t "Deep drilling " ?Nam crlf)
	(retract ?feature)
)

(defrule Countersinking "Countersinking"
	?feature <- (Feature (Name ?Nam) (Ftype NonThrough) (Length ?Len) (Diameter ?Dia) (Tapping 0) (Bottom Square))
	(test(> ?Dia 20.0))
=>
	(printout t "Countersinking " ?Nam crlf)
	(modify ?feature (Bottom Conical) (Diameter 15.0))
)

(defrule Drilling "Drilling"
	?feature <- (Feature (Name ?Nam) (Ftype NonThrough) (Tapping 0) (Bottom Conical))
=>
	(printout t "Drilling " ?Nam crlf)
	(retract ?feature)
)

(defrule Drilling1 "Drilling 1"
	?feature <- (Feature (Name ?Nam) (Ftype Through) (Diameter ?Dia) (Tapping 0))
	(test(> ?Dia 10.0))
=>
	(printout t "Drilling " ?Nam crlf)
	(modify ?feature (Diameter (/ ?Dia 2.0)))
)

(defrule Drilling2 "Drilling 2"
	?feature <- (Feature (Name ?Nam) (Ftype Through) (Diameter ?Dia) (Tapping 0) (Bottom Conical))
	(test(< ?Dia 15.0))
=>
	(printout t "Drilling " ?Nam crlf)
	(retract ?feature)
)

(defrule Taraudage "Taraudage"
	?feature <- (Feature (Name ?Nam) (Tapping 1))
=>
	(printout t "Taraudage " ?Nam crlf)
	(modify ?feature (Tapping 0))
)

(defrule Chanfrein "Opération sur chanfrein"
	(declare (salience 200))
	?feature <- (Feature (Name ?Nam) (Chamfer 1))
=>
	(modify ?feature (Chamfer 0))
	(printout t "Chanfrein " ?Nam crlf)
)
