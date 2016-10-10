(deftemplate Threaded_Bore "Definition of Threaded Bore geometrical feature"
(slot Name (type SYMBOL) (default none) )
(slot Length (type INTEGER) (default 0) )
(slot Diameter (type INTEGER) (default 0) )
(slot Thread (type INTEGER) (default 0) ))

(deftemplate Drill_Tool "Definition of a cutting tool"
(slot Name (type SYMBOL) (default none))
(slot Diameter (type NUMBER) (default 0))
(slot Length (type NUMBER)(default 0)))

(defrule Toolok "Find if a tool is ok"
(Threaded_Bore (Diameter ?Dia) (Length ?Len) (Thread ?th) (Name ?Nam))
(Drill_Tool (Name ?TNam) (Diameter ?TDiam) (Length ?TLen))
(and (test (> ?Dia ?TDiam)) (test (> ?TLen ?Len)))
=>
(assert (can_machine ?TNam ?Nam))
(printout t ?TNam " can machine the feature " ?Nam crlf)
)

(defrule VolumeOk "Calculate de Volume to Machine"
(Threaded_Bore (Diameter ?Dia) (Length ?Len) (Thread 0) (Name ?Nam))
(test (< (* ?Dia ?Len) 2500))
=>
(printout t "Ok volume machinable for the feature " ?Nam crlf)
)

(defrule Init
(initial-fact)
=>
(assert (Threaded_Bore (Name F1) (Diameter 25) (Length 25) (Thread 1)))
(assert (Threaded_Bore (Name F2) (Diameter 25) (Length 250) (Thread 0)))
(assert (Threaded_Bore (Name F3) (Diameter 10) (Length 50) (Thread 0)))
(assert (Drill_Tool (Name T1) (Diameter 24) (Length 150) ))
(assert (Drill_Tool (Name T2) (Diameter 24) (Length 250) ))
(assert (Drill_Tool (Name T3) (Diameter 50) (Length 200) ))
)
