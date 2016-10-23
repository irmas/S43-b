;; ---------- Step 2 ----------

(defrule Hole "Rules to implement is the feature is a hole"
(declare (salience 1000))
	?hole <- (Hole (Name ?Nam) (Orientation ?Ori))
=>
	(printout t "Direction of machining: of hole" ?Ori crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation ?Ori)(FaceSide NA)))
)

(defrule throughHole "Rules to implement is the feature is a Throughout hole"
(declare (salience 999))
	?hole <- (Hole (Name ?Nam) (Orientation ?Ori) (Ftype Through))
=>
	(printout t "Direction of machining of hole: " ?Ori "or: -" ?Ori crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation (* ?Ori -1))))
)

(defrule faceSideMilling1 "Machining direction if no interactions bt planes"
(declare (salience 998))
	?plane <- (Plane (Name ?Nam) (Orientation 1))
	(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation 1)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 3)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -3)(FaceSide Side)))	
)

(defrule faceSideMilling2 "Machining direction if no interactions bt planes"
(declare (salience 997))
	?plane <- (Plane (Name ?Nam) (Orientation 2))
	(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation 2)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 3)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -3)(FaceSide Side)))	
)

(defrule faceSideMilling3 "Machining direction if no interactions bt planes"
(declare (salience 996))
	?plane <- (Plane (Name ?Nam) (Orientation 3))
	(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation 3)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -1)(FaceSide Side)))	
)

(defrule faceSideMilling_1 "Machining direction if no interactions bt planes"
(declare (salience 995))
	?plane <- (Plane (Name ?Nam) (Orientation -1))
	(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation -1)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 3)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -3)(FaceSide Side)))	
)

(defrule faceSideMilling_2 "Machining direction if no interactions bt planes"
(declare (salience 994))
	?plane <- (Plane (Name ?Nam) (Orientation -2))
	(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation -2)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 3)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -3)(FaceSide Side)))	
)

(defrule faceSideMilling_3 "Machining direction if no interactions bt planes"
(declare (salience 993))
	?plane <- (Plane (Name ?Nam) (Orientation -3))
	(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation -3)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -1)(FaceSide Side)))	
)

(defrule perpendicularPlanes12 "Machining direction for perpendicular planes"
(declare (salience 992))
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
	(test(>= (* ?Len1 ?Wid1) (* ?Len2 ?Wid2)))
=>
	(printout t "Direction of machining " ?Ori1 crlf) 
	(assert(MachiningDirection (Name ?Nam1)(Orientation ?Ori1)))
)

(defrule perpendicularPlanes21 "Machining direction for perpendicular planes"
(declare (salience 991))
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
	(test(< (* ?Len1 ?Wid1) (* ?Len2 ?Wid2)))
=>
	(printout t "Direction of machining " ?Ori2 crlf) 
	(assert(MachiningDirection (Name ?Nam2)(Orientation ?Ori2)))
)

(defrule contactPlane "Machining direction for contact planes" ;;need  to include "machined seperatly" feature
(declare (salience 990))
	?plane1 <- (Plane (Name ?Nam1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Contact))
=>
	(printout t "Direction of machining of " ?Nam1 " : " ?Ori1 crlf)
	(printout t "Direction of machining of " ?Nam2 " : " ?Ori2 crlf)
 	(assert(MachiningDirection (Name ?Nam1)(Orientation ?Ori1)(FaceSide Face)))
 	(assert(MachiningDirection (Name ?Nam2)(Orientation ?Ori2)(FaceSide Face)))
)

(defrule Pocket "Machining direction for slot/pocket" 
(declare (salience 989))
	?slot <- (Slot (Name ?Nam) (BottomOrientation ?BotOri))
=>
	(printout t "Direction of machining: " ?BotOri crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation ?BotOri)(FaceSide Face)))
)

(defrule roundThroughPocket "Machining direction for bottom rounded through slot/pocket" 
(declare (salience 987))
	?slot <- (Slot (Name ?Nam) (Ftype Through) (Bottom Round) (BottomOrientation ?BotOri) (SideOrientation ?SidOri))
=>
	(printout t "Direction of machining: " ?BotOri " or: " ?SidOri " or: " (* ?SidOri -1) crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation ?BotOri)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation ?SidOri)(FaceSide Side)))
	(assert(MachiningDirection (Name ?Nam)(Orientation (* ?SidOri -1))(FaceSide Side)))
)
