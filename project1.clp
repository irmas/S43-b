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
	(slot BottomOrientation (type INTEGER))
	(slot SideOrientation (type INTEGER))
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
	(slot FaceSide (type SYMBOL) (allowed-symbols Face Side NA) (default NA))
)

(defrule Init "Rule which triggers with the no-fact fact"
(initial-fact)
;;(assert(Plan (Name P1)(Length 100.0)(Width 50.0)(Orientation 3)))
(assert(Plan (Name P2)(Length 50.0)(Width 50.0)(SideOrientation 3)))
(assert(Plan (Name P3)(Length 50.0)(Width 20.0)(SideOrientation 2)))
(assert(Plan (Name P4)(Length 50.0)(Width 20.0)(SideOrientation -2)))
;;(assert(Plan (Name P3)(Length 150.0)(Width 40.0)(Orientation 2)))
;;(assert(Plan (Name P4)(Length 150.0)(Width 40.0)(Orientation -2)))
;;(assert(Plan (Name P5)(Length 50.0)(Width 20.0)(Orientation 2)))
;;(assert(Plan (Name P6)(Length 50.0)(Width 20.0)(Orientation -2)))
;;(assert(Plan (Name P7)(Length 50.0)(Width 6.0)(Orientation 3)))
;;(assert(Plan (Name P8)(Length 50.0)(Width 6.0)(Orientation -3)))
;;(assert(Plan (Name P9)(Length 50.0)(Width 6.0)(Orientation 3)))
;;(assert(Plan (Name P10)(Length 50.0)(Width 6.0)(Orientation -3)))
;;(assert(Plan (Name P11)(Length 20.0)(Width 6.0)(Orientation 1)))
;;(assert(Plan (Name P12)(Length 20.0)(Width 6.0)(Orientation -1)))
;;(assert(Plan (Name P13)(Length 20.0)(Width 6.0)(Orientation 1)))
;;(assert(Plan (Name P14)(Length 20.0)(Width 6.0)(Orientation -1)))
;;(assert(Plan (Name P15)(Length 50.0)(Width 20.0)(Orientation -2)))
;;(assert(Plan (Name P16)(Length 40.0)(Width 10.0)(Orientation -1)))
;;(assert(Plan (Name P17)(Length 40.0)(Width 10.0)(Orientation -1)))
(assert(Slot (Name S1)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation 3)(SideOrientation 1))
(assert(Slot (Name S2)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation 3)(SideOrientation 1)))
(assert(Slot (Name S3)(Length 40.0)(Height 20.0)(Width 20.0)(Inverse NonInverse)(Ftype NonThrough)(Bottom Square)(NormalOrientation 3)(SideOrientation 1)))
(assert(Slot (Name S4)(Length 40.0)(Height 30.0)(Width 28.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation -3)(SideOrientation 3)))
(assert(Slot (Name S5)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S6)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S7)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S8)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S9)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(NormalOrientation -2)(SideOrientation 1)))
(assert(Slot (Name S10)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(NormalOrientation 2)(SideOrientation 1)))
(assert(Slot (Name S11)(Length 50.0)(Height 10.0)(Width 100.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(NormalOrientation 3)(SideOrientation 2)))
(assert(Hole (Name H1)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(SideOrientation 3)))
(assert(Hole (Name H2)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(SideOrientation 3)))
(assert(Hole (Name H3)(Diameter 6.0)(Depth 47.0)(Ftype Through)(SideOrientation 3)))
(assert(Hole (Name H4)(Diameter 6.0)(Depth 47.0)(Ftype Through)(SideOrientation 3)))
(assert(Hole (Name H5)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(SideOrientation -1)))
(assert(Hole (Name H6)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(SideOrientation -1)))
)
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
	(assert(MachiningDirection (Name ?Nam)(Direction ?Ori)(FaceSide Face))	
	(assert(MachiningDirection (Name ?Nam)(Direction 1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Direction 2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Direction 3)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Direction -1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Direction -2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Direction -3)(FaceSide Side)))	
	(retract(MachiningDirection (Name ?Nam)(Direction *(?Ori -1))(FaceSide Side)))	
)

(defrule perpendicularPlanes "Machining direction for perpendicular planes"
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
=>
	(cond (>((* ?Len1 ?Wid1) (* ?Len2 ?Wid2))) ((printout t "Direction of machining: " ?Ori1 crlf) (assert(MachiningDirection (Name ?Nam1)(Direction ?Ori1))))
		(t ((printout t "Direction of machining: " ?Ori2 crlf) (assert(MachiningDirection (Name ?Nam2)(Direction ?Ori2)))))
	)
)

(defrule contactPlane "Machining direction for contact planes" ;;need  to include "machined seperatly" feature
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Contact))
=>
	(printout t "Direction of machining of " ?Nam1 ": " ?Ori1 crlf)
	(printout t "Direction of machining of " ?Nam2 ": " ?Ori2 crlf)
 	(assert(MachiningDirection (Name ?Nam1)(Direction ?Ori1)(FaceSide Face)))
 	(assert(MachiningDirection (Name ?Nam2)(Direction ?Ori2)(FaceSide Face)))

)

(defrule Pocket "Machining direction for slot/pocket" 
	?slot <- (Plane (Name ?Nam) (Ftype ?Ft) (Bottom ?Bot) (BottomOrientation ?BotOri) (SideOrientation ?SidOri))
=>
	(cond (and (= ?Ft Through) (= ?Bot Round)) ((printout t "Direction of machining: " ?BotOri " or: " ?SidOri " or: " (* ?SidOri -1) crlf)
		(assert(MachiningDirection (Name ?Nam)(Direction ?BotOri)(FaceSide Face)))
 		(assert(MachiningDirection (Name ?Nam)(Direction ?SidOri)(FaceSide Side)))
 		(assert(MachiningDirection (Name ?Nam)(Direction (* ?SidOri -1))(FaceSide Side))))
		(t ((printout t "Direction of machining: " ?BotOri crlf) (assert(MachiningDirection (Name ?Nam)(Direction ?BotOri)(FaceSide Face)))))
	)
)

;;-----Step 3------
;;-----Hole------
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

;;-----Face------
(defrule FaceMillingWithPerpendicular "Face Milling"  ;;;;; Attention ! checker b en relation avec a
	?plane1 <- (Plan (Name ?Nam1) (Width ?Width) (Length ?Len)(Orientation ?Ori))
	?relation <- (Relationship (Feature1 ?Nam1)(Feature2 ?Nam2)(Relationship Perpendicular))
	?plane2 <- (Plan (Name ?Nam2) (Width ?Width2) (Length ?Len2))
	?machiningDirection <- ((Name ?Nam)(Orientation ?Ori))(FaceSide Face)
=>
	(printout t "Face Milling" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MinLength ?Len2))) ;;Condition sur MinLength -> on doit verifier que l'outil est assez long pour faire le plan d'a coté
	(retract ?feature)
)
(defrule FaceMilling "Face Milling"  ;;;;; Attention ! checker b en relation avec a
	?plane1 <- (Plan (Name ?Nam1) (Width ?Width) (Length ?Len)(Orientation ?Ori))
	?machiningDirection <- ((Name ?Nam)(Orientation ?Ori))(FaceSide Face)
=>
	(printout t "Face Milling" ?Nam crlf)
	(retract ?feature)
)

(defrule SideMilling "Side Milling"
	?plane1 <- (Plan (Name ?Nam) (Width ?Width) (Length ?Len)(Orientation ?Ori))
	?machiningDirection <- ((Name ?Nam)(Orientation ?mdi)(FaceSide Side))
=>
	(printout t "Side Milling" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MinLength ?Len)))
	(retract ?feature)
)
;;-----Pocket------
(defrule FaceMillingPocket "Face Milling Pocket"  
	?plane1 <- (Plan (Name ?Nam) (Height ?Height)(Width ?Width) (Length ?Len)(Orientation ?Ori))
	?machiningDirection <- ((Name ?Nam)(Orientation ?mdi)(FaceSide Face))
=>
	(printout t "Face Milling Pocket" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MinLength ?Height)))
	(retract ?feature)
)
(defrule SideMillingPocket "Side Milling Side"  
	?plane1 <- (Plan (Name ?Nam) (Height ?Height)(Width ?Width) (Length ?Len)(Orientation ?Ori))
	?machiningDirection <- ((Name ?Nam)(Orientation ?mdi)(FaceSide Side))
=>
	(printout t "Side Milling Pocket" ?Nam crlf)
	(assert(Tool (Feature ?Nam)(MinDiameter ?Height))) ;; la fraise doit pouvoir passer sur le coté
	(retract ?feature)
)
