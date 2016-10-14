;;---------- Step 1 ----------

(deftemplate Hole "Definition of the hole structure"
	(slot Name (type SYMBOL) (default none))
	(slot Diameter (type FLOAT) (default 0.0))
	(slot Depth (type FLOAT) (default 0.0))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Orientation (type INTEGER))
)

(deftemplate Plan "Definition of the plan structure"
	(slot Name (type SYMBOL) (default none))
	(slot Length (type FLOAT) (default 0.0))
	(slot Width (type FLOAT) (default 0.0))
	(slot Orientation (type INTEGER))
)

(deftemplate Slot "Definition of the slot structure"
	(slot Name (type SYMBOL) (default none))
	(slot Length (type FLOAT) (default 0.0))
	(slot Height (type FLOAT) (default 0.0))
	(slot Width (type FLOAT) (default 0.0))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Inverse (type SYMBOL) (allowed-symbols NonInverse Inverse))
	(slot Bottom (type SYMBOL) (allowed-symbols Round Square None)(default Round))
	(slot Orientation (type INTEGER))
)

(deftemplate Relationship "Definition of the relationships"
	(slot Feature1 (type SYMBOL) (default none))
	(slot Feature2 (type SYMBOL) (default none))
	(slot Relation (type SYMBOL) (allowed-symbols Contact Perpendicular Start_in Lead_to Coaxial Cross) (default none))
)
(deftemplate Tool "Definition of Tool"
	(slot Feature (type SYMBOL) (default none)) ;; H1, H2 on associe un outil à un trou / plan
	(slot MinDiameter (type FLOAT) (default 0.0))
	(slot MaxDiameter (type FLOAT) (default 1000.0))
	(slot MinLength (type FLOAT) (default 0.0))
)

(deftemplate MachiningDirection "Determine direction of machining"
	(slot Name (type SYMBOL) (default none))
	(slot Orientation (type INTEGER))
)

(defrule Init "Rule which triggers with the no-fact fact"
(initial-fact)
=>
<<<<<<< HEAD
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

(defrule Hole "Rules to implement is the feature is a hole"
	?hole <- (Hole (Name ?Nam) (Orientation ?Ori))
=>
	(printout t "Direction of machining: " ?Ori crlf)
	(assert(MachiningDirection (Name ?Nam)(Direction ?Ori)))
)

(defrule throughHole "Rules to implement is the feature is a Throughout hole"
	?hole <- (Hole (Name ?Nam) (Orientation ?Ori) (Ftype Through))
=>
	(printout t "Direction of machining: " ?Ori "or: -" ?Ori crlf)
	(assert(MachiningDirection (Name ?Nam)(Direction (* ?Ori -1))))
)

(defrule faceSideMilling "Machining direction if no interactions bt planes"
	?plane <- (Plane (Name ?Nam) (Orientation ?Ori))
	?relation <- (not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Direction 1)))	
	(assert(MachiningDirection (Name ?Nam)(Direction 2)))	
	(assert(MachiningDirection (Name ?Nam)(Direction 3)))	
	(assert(MachiningDirection (Name ?Nam)(Direction -1)))	
	(assert(MachiningDirection (Name ?Nam)(Direction -2)))	
	(assert(MachiningDirection (Name ?Nam)(Direction -3)))	
	(retract(MachiningDirection (Name ?Nam)(Direction *(?Ori -1))))	
)

(defrule perpendicularPlanes "Machining direction for perpendicular planes"
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
=>
	(if (>((* ?Len1 ?Wid1) (* ?Len2 ?Wid2)))
		((printout t "Direction of machining: " ?Ori1 crlf)
		(assert(MachiningDirection (Name ?Nam1)(Direction ?Ori1))))
		((printout t "Direction of machining: " ?Ori2 crlf)
		(assert(MachiningDirection (Name ?Nam2)(Direction ?Ori2))))
	)

)

(defrule perpendicularPlanes "Machining direction for contact planes" ;;need  to include "machined seperatly" feature
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Contact))
=>
	(printout t "Direction of machining: " ?Ori1 crlf)
 	(assert(MachiningDirection (Name ?Nam1)(Direction ?Ori1)))
 	(assert(MachiningDirection (Name ?Nam2)(Direction ?Ori2)))

)

(defrule perpendicularPlanes "Machining direction for bottom rounded slot/pocket" ;;need  to include "machined seperatly" feature
	?slot <- (Plane (Name ?Nam) (Ftype Through) (Bottom Round) (Orientation ?Ori))
=>
	(printout t "Direction of machining: " ?Ori1 " or: " ? crlf)
 	(assert(MachiningDirection (Name ?Nam1)(Direction ?Ori1)))
 	(assert(MachiningDirection (Name ?Nam2)(Direction ?Ori2)))

)

;;-----Step 3------
(defrule deepDrilling "Deep drilling"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype NonThrough) (Diameter ?Dia))
	(test(>=(/ ?Len ?Dia)2.0))
=>
	(printout t "Deep drilling " ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MaxDiameter ?Dia)(MinDiameter ?Dia)(MinLength ?Len)))
	(retract ?feature)
)
(defrule Drilling "drilling normal"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype NonThrough) (Diameter ?Dia))
	(test(<(/ ?Len ?Dia)2.0))
=>
	(printout t "drilling Normal" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MaxDiameter ?Dia)(MinDiameter ?Dia)(MinLength ?Len)))
	(retract ?feature)
)
(defrule Drilling "drilling normal Through"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype Through) (Diameter ?Dia))
=>
	(printout t "drilling Normal" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MaxDiameter ?Dia)(MinDiameter ?Dia)(MinLength ?Len)))
	(retract ?feature)
)
(defrule MillingHole "Milling Hole"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype Through) (Diameter ?Dia))
=>
	(printout t "Milling Hole" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MaxDiameter (- ?Dia 4))(MinLength ?Len)))
	(modify ?feature (Diameter (- ?Dia 2)))
)
(defrule FaceMilling "Face Milling"  ;;;;; Attention ! rajouter une condition pour vérifier que la direction d'usingage est egale à l'orientation
	?plane1 <- (Plan (Name ?Nam) (Width ?Width) (Length ?Len))
	?relation <- (Relationship (Feature1 ?Nam)(Feature2 ?Ft)(Relationship Perpendicular))
	?plane2 <- (Plan (Name ?Ft) (Width ?Width2) (Length ?Len))
=>
	(printout t "Face Milling" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MaxDiameter (- ?Dia 4))(MinLength ?Len)))
	(retract ?feature)
)
(defrule SideMilling "Side Milling"
	?feature <- (Plan (Name ?Nam) (Width ?Len) (Length ?Len))
=>
	(printout t "Side Milling" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MinLength ?Len)))
	(retract ?feature)
)
