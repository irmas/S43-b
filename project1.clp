;;---------- Step 1 ----------

(deftemplate Hole "Definition of the hole structure"
	(slot Name (type SYMBOL) (default none))
	(slot Diameter (type FLOAT) (default 0.0))
	(slot Depth (type FLOAT) (default 0.0))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Orientation (type SYMBOL) (allowed-symbols X Y Z _X _Y _Z))
)

(deftemplate Plan "Definition of the plan structure"
	(slot Name (type SYMBOL) (default none))
	(slot Length (type FLOAT) (default 0.0))
	(slot Width (type FLOAT) (default 0.0))
	(slot Orientation (type SYMBOL) (allowed-symbols X Y Z _X _Y _Z))
)

(deftemplate Slot "Definition of the slot structure"
	(slot Name (type SYMBOL) (default none))
	(slot Length (type FLOAT) (default 0.0))
	(slot Height (type FLOAT) (default 0.0))
	(slot Width (type FLOAT) (default 0.0))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Inverse (type SYMBOL) (allowed-symbols NonInverse Inverse))
	(slot Bottom (type SYMBOL) (allowed-symbols Round Square None)(default Round))
	(slot Orientation (type SYMBOL) (allowed-symbols X Y Z _X _Y _Z))
)

(deftemplate Relationships "Definition of the relationships"
	(slot Feature1 (type SYMBOL) (allowed-symbols Plane Hole Slot) (default none))
	(slot Feature2 (type SYMBOL) (allowed-symbols Plane Hole Slot) (default none))
	(slot Relationship (type SYMBOL) (allowed-symbols Contact Perpendicular Start_in Lead_to Coaxial Cross) (default none))
)


(defrule Init "Rule which triggers with the no-fact fact"
(initial-fact)
=>
;;(assert(Plan (Name P1)(Length 100.0)(Width 50.0)(Orientation Z)))
(assert(Plan (Name P2)(Length 50.0)(Width 50.0)(Orientation Z)))
(assert(Plan (Name P3)(Length 50.0)(Width 20.0)(Orientation Y)))
(assert(Plan (Name P4)(Length 50.0)(Width 20.0)(Orientation _Y)))
;;(assert(Plan (Name P3)(Length 150.0)(Width 40.0)(Orientation Y)))
;;(assert(Plan (Name P4)(Length 150.0)(Width 40.0)(Orientation _Y)))
;;(assert(Plan (Name P5)(Length 50.0)(Width 20.0)(Orientation Y)))
;;(assert(Plan (Name P6)(Length 50.0)(Width 20.0)(Orientation _Y)))
;;(assert(Plan (Name P7)(Length 50.0)(Width 6.0)(Orientation Z)))
;;(assert(Plan (Name P8)(Length 50.0)(Width 6.0)(Orientation _Z)))
;;(assert(Plan (Name P9)(Length 50.0)(Width 6.0)(Orientation Z)))
;;(assert(Plan (Name P10)(Length 50.0)(Width 6.0)(Orientation _Z)))
;;(assert(Plan (Name P11)(Length 20.0)(Width 6.0)(Orientation X)))
;;(assert(Plan (Name P12)(Length 20.0)(Width 6.0)(Orientation _X)))
;;(assert(Plan (Name P13)(Length 20.0)(Width 6.0)(Orientation X)))
;;(assert(Plan (Name P14)(Length 20.0)(Width 6.0)(Orientation _X)))
;;(assert(Plan (Name P15)(Length 50.0)(Width 20.0)(Orientation _Y)))
;;(assert(Plan (Name P16)(Length 40.0)(Width 10.0)(Orientation _X)))
;;(assert(Plan (Name P17)(Length 40.0)(Width 10.0)(Orientation _X)))
(assert(Slot (Name S1)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation X))
(assert(Slot (Name S2)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation X)))
(assert(Slot (Name S3)(Length 40.0)(Height 20.0)(Width 20.0)(Inverse NonInverse)(Ftype NonThrough)(Bottom Square)(Orientation X)))
(assert(Slot (Name S4)(Length 40.0)(Height 30.0)(Width 28.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation _Z)))
(assert(Slot (Name S5)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation _Y)))
(assert(Slot (Name S6)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation _Y)))
(assert(Slot (Name S7)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation _Y)))
(assert(Slot (Name S8)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation _Y)))
(assert(Slot (Name S9)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(Orientation X)))
(assert(Slot (Name S10)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(Orientation X)))
(assert(Slot (Name S11)(Length 50.0)(Height 10.0)(Width 100.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(Orientation _Z)))
(assert(Hole (Name H1)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(Orientation Z)))
(assert(Hole (Name H2)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(Orientation Z)))
(assert(Hole (Name H3)(Diameter 6.0)(Depth 47.0)(Ftype Through)(Orientation Z)))
(assert(Hole (Name H4)(Diameter 6.0)(Depth 47.0)(Ftype Through)(Orientation Z)))
(assert(Hole (Name H5)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(Orientation _X)))
(assert(Hole (Name H6)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(Orientation _X)))

;; ---------- Step 2 ----------

(defrule deepDrilling "Deep drilling"
	?feature <- (Hole (Name ?Nam) (Orientation ?Ori))
=>
	(printout t "Deep drilling " ?Nam crlf)
	(retract ?feature)
)
;; ---------- Step 3 ----------

