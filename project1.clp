;;---------- Step 1 ----------

(deftemplate Hole "Definition of the hole structure"
	(slot Name (type SYMBOL) (default none))
	(slot Diameter (type FLOAT) (default 0.0))
	(slot Depth (type FLOAT) (default 0.0))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Orientation (type INTEGER))
)

(deftemplate Plane "Definition of the plan structure"
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
	(slot Relation (type SYMBOL) (allowed-symbols Contact Perpendicular Start_in Lead_to Coaxial Cross NA)(default NA))
)

(deftemplate Tool "Definition of Tool"
	(slot Name (type SYMBOL) (default none)) ;; H1, H2 on associe un outil à un trou / plan
	(slot Type (type SYMBOL) (allowed-symbols DrillBit Mill))
	(slot Diameter (type FLOAT) (default 0.0))
	(slot Length (type FLOAT) (default 0.0))
)

(deftemplate Machine "Definition of Machine"
	(slot Name (type SYMBOL) (default none)) ;; H1, H2 on associe un outil à un trou / plan
	(slot Orientation1 (type INTEGER))
	(slot Orientation2 (type INTEGER))
	(slot Orientation3 (type INTEGER))
)
;;(deftemplate Tool "Definition of Tool"
;;	(slot Feature (type SYMBOL) (default none)) ;; H1, H2 on associe un outil à un trou / plan
;;	(slot MinDiameter (type FLOAT) (default 0.0))
;;	(slot MaxDiameter (type FLOAT) (default 1000.0))
;;	(slot MinLength (type FLOAT) (default 0.0))
;;)

(deftemplate MachiningDirection "Determine direction of machining"
	(slot Name (type SYMBOL) (default none))
	(slot Orientation (type INTEGER))
	(slot FaceSide (type SYMBOL) (allowed-symbols Face Side NA)(default NA))
)
(deftemplate FeatureMachinedBy "Determine direction of machining"
	(slot FeatureName (type SYMBOL) (default none))
	(slot MachineName (type SYMBOL) (default none))
)

(defrule Init "Rule which triggers with the no-fact fact"
(initial-fact)
=>
;;(assert(Plane (Name P1)(Length 100.0)(Width 50.0)(Orientation 3)))
(assert(Plane (Name P2)(Length 50.0)(Width 50.0)(Orientation 3)))
(assert(Plane (Name P3)(Length 50.0)(Width 20.0)(Orientation 2)))
(assert(Plane (Name P4)(Length 50.0)(Width 20.0)(Orientation -2)))
;;(assert(Plane (Name P3)(Length 150.0)(Width 40.0)(Orientation 2)))
;;(assert(Plane (Name P4)(Length 150.0)(Width 40.0)(Orientation -2)))
;;(assert(Plane (Name P5)(Length 50.0)(Width 20.0)(Orientation 2)))
;;(assert(Plane (Name P6)(Length 50.0)(Width 20.0)(Orientation -2)))
;;(assert(Plane (Name P7)(Length 50.0)(Width 6.0)(Orientation 3)))
;;(assert(Plane (Name P8)(Length 50.0)(Width 6.0)(Orientation -3)))
;;(assert(Plane (Name P9)(Length 50.0)(Width 6.0)(Orientation 3)))
;;(assert(Plane (Name P10)(Length 50.0)(Width 6.0)(Orientation -3)))
;;(assert(Plane (Name P11)(Length 20.0)(Width 6.0)(Orientation 1)))
;;(assert(Plane (Name P12)(Length 20.0)(Width 6.0)(Orientation -1)))
;;(assert(Plane (Name P13)(Length 20.0)(Width 6.0)(Orientation 1)))
;;(assert(Plane (Name P14)(Length 20.0)(Width 6.0)(Orientation -1)))
;;(assert(Plane (Name P15)(Length 50.0)(Width 20.0)(Orientation -2)))
;;(assert(Plane (Name P16)(Length 40.0)(Width 10.0)(Orientation -1)))
;;(assert(Plane (Name P17)(Length 40.0)(Width 10.0)(Orientation -1)))
(assert(Slot (Name S1)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation 3)(SideOrientation 1)))
(assert(Slot (Name S2)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation 3)(SideOrientation 1)))
(assert(Slot (Name S3)(Length 40.0)(Height 20.0)(Width 20.0)(Inverse NonInverse)(Ftype NonThrough)(Bottom Square)(BottomOrientation 3)(SideOrientation 1)))
(assert(Slot (Name S4)(Length 40.0)(Height 30.0)(Width 28.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation 3)))
(assert(Slot (Name S5)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S6)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S7)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S8)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)))
(assert(Slot (Name S9)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(BottomOrientation -2)(SideOrientation 1)))
(assert(Slot (Name S10)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(BottomOrientation 2)(SideOrientation 1)))
(assert(Slot (Name S11)(Length 50.0)(Height 10.0)(Width 100.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation 3)(SideOrientation 2)))
(assert(Hole (Name H1)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(Orientation 3)))
(assert(Hole (Name H2)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(Orientation 3)))
(assert(Hole (Name H3)(Diameter 6.0)(Depth 47.0)(Ftype Through)(Orientation 3)))
(assert(Hole (Name H4)(Diameter 6.0)(Depth 47.0)(Ftype Through)(Orientation 3)))
(assert(Hole (Name H5)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(Orientation -1)))
(assert(Hole (Name H6)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(Orientation -1)))
(assert(Tool (Name DB1)(Type DrillBit)(Diameter 6.0)(Length 10.0)))
(assert(Tool (Name DB2)(Type DrillBit)(Diameter 12.0)(Length 80.0)))
(assert(Tool (Name DB3)(Type DrillBit)(Diameter 10.0)(Length 60.0)))
(assert(Tool (Name DB4)(Type DrillBit)(Diameter 20.0)(Length 70.0)))
(assert(Tool (Name DB5)(Type DrillBit)(Diameter 6.0)(Length 60.0)))
(assert(Tool (Name Mill1)(Type Mill)(Diameter 15.0)(Length 40.0)))
(assert(Tool (Name Mill2)(Type Mill)(Diameter 20.0)(Length 80.0)))
(assert(Tool (Name Mill3)(Type Mill)(Diameter 4.0)(Length 2.0)))
(assert(Tool (Name Mill4)(Type Mill)(Diameter 20.0)(Length 3.0)))
;;(assert(Relationship (Feature1 )(Feature2 )(Relation )))
(assert(Machine (Name M1)(Orientation1 -1)(Orientation2 2)(Orientation3 2)))
(assert(Machine (Name M2)(Orientation1 1)(Orientation2 2)(Orientation3 -2)))
(assert(Machine (Name M3)(Orientation1 2)(Orientation2 3)(Orientation3 3)))
(assert(Machine (Name M4)(Orientation1 -1)(Orientation2 1)(Orientation3 2)))
)
;; ---------- Step 2 ----------

(defrule Hole "Rules to implement is the feature is a hole"
	?hole <- (Hole (Name ?Nam) (Orientation ?Ori))
=>
	(printout t "Direction of machining: of hole" ?Ori crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation ?Ori)(FaceSide NA)))
)

(defrule throughHole "Rules to implement is the feature is a Throughout hole"
	?hole <- (Hole (Name ?Nam) (Orientation ?Ori) (Ftype Through))
=>
	(printout t "Direction of machining of hole: " ?Ori "or: -" ?Ori crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation (* ?Ori -1))))
)

(defrule faceSideMilling "Machining direction if no interactions bt planes"
	?plane <- (Plane (Name ?Nam) (Orientation ?Ori))
	;;(not (Relationship (Feature1 ?Nam) (Feature2 ?Ft2)))
=>
	(assert(MachiningDirection (Name ?Nam)(Orientation ?Ori)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation 1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation 3)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -1)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -2)(FaceSide Side)))	
	(assert(MachiningDirection (Name ?Nam)(Orientation -3)(FaceSide Side)))	
	;;Commente pour qu'il arrive au bout
	;;(retract(MachiningDirection (Name ?Nam)(Orientation (* ?Ori -1))(FaceSide Side)));; marche pas, les autres retracts sont basés sur du retract( ?feature), 
	;;(retract(MachiningDirection (Name ?Nam)(Orientation ?Ori)(FaceSide Side)));; marche pas, les autres retracts sont basés sur du retract( ?feature), 
	;; il faudrait peur être créer un ?OriginialMD<- blabla et retirer lui a la fin
)

(defrule perpendicularPlanes12 "Machining direction for perpendicular planes"
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
	(test(>= (* ?Len1 ?Wid1) (* ?Len2 ?Wid2)))
=>
	(printout t "Direction of machining: " ?Ori1 crlf) 
	(assert(MachiningDirection (Name ?Nam1)(Orientation ?Ori1)))
)

(defrule perpendicularPlanes21 "Machining direction for perpendicular planes"
	?plane1 <- (Plane (Name ?Nam1) (Length ?Len1) (Width ?Wid1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Length ?Len2) (Width ?Wid2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
	(test(< (* ?Len1 ?Wid1) (* ?Len2 ?Wid2)))
=>
	(printout t "Direction of machining: " ?Ori2 crlf) 
	(assert(MachiningDirection (Name ?Nam2)(Orientation ?Ori2)))
)

(defrule contactPlane "Machining direction for contact planes" ;;need  to include "machined seperatly" feature
	?plane1 <- (Plane (Name ?Nam1) (Orientation ?Ori1))
	?plane2 <- (Plane (Name ?Nam2) (Orientation ?Ori2))	
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Contact))
=>
	(printout t "Direction of machining of " ?Nam1 ": " ?Ori1 crlf)
	(printout t "Direction of machining of " ?Nam2 ": " ?Ori2 crlf)
 	(assert(MachiningDirection (Name ?Nam1)(Orientation ?Ori1)(FaceSide Face)))
 	(assert(MachiningDirection (Name ?Nam2)(Orientation ?Ori2)(FaceSide Face)))

)

(defrule Pocket "Machining direction for slot/pocket" 
	?slot <- (Slot (Name ?Nam) (BottomOrientation ?BotOri))
=>
	(printout t "Direction of machining: " ?BotOri crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation ?BotOri)(FaceSide Face)))
)

(defrule roundThroughPocket "Machining direction for bottom rounded through slot/pocket" 
	?slot <- (Slot (Name ?Nam) (Ftype Through) (Bottom Round) (BottomOrientation ?BotOri) (SideOrientation ?SidOri))
=>
	(printout t "Direction of machining: " ?BotOri " or: " ?SidOri " or: " (* ?SidOri -1) crlf)
	(assert(MachiningDirection (Name ?Nam)(Orientation ?BotOri)(FaceSide Face)))
	(assert(MachiningDirection (Name ?Nam)(Orientation ?SidOri)(FaceSide Side)))
	(assert(MachiningDirection (Name ?Nam)(Orientation (* ?SidOri -1))(FaceSide Side)))
)

;;-----Step 3------
;;-----Hole------
(defrule deepDrilling "Deep drilling"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype NonThrough) (Diameter ?Dia))
	?tool <- (Tool (Name ?ToolName) (Type DrillBit) (Diameter ?Dia) (Length ?ToolLen))
	(test (>= (/ ?Len ?Dia) 2.0))
	(test (<= ?Len ?ToolLen))
=>
	(printout t "Deep drilling " ?Nam crlf)
	(retract ?feature)
)

(defrule normalDrilling "drilling normal"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype NonThrough) (Diameter ?Dia))
	?tool <- (Tool (Name ?ToolName) (Type DrillBit) (Diameter ?Dia) (Length ?ToolLen))
	(test (<= ?Len ?ToolLen))
	(test (<(/ ?Len ?Dia)2.0))
=>
	(printout t "drilling Normal" ?Nam crlf)
;;	(assert(MachiningDirection (Name ?Nam)(Orientation ?Ori)(FaceSide NA)))
	;;(assert(Tool (Feature ?Nam)(MaxDiameter ?Dia)(MinDiameter ?Dia)(MinLength ?Len)))
	(retract ?feature)
)

(defrule normalThroughDrilling "drilling normal Through"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype Through) (Diameter ?Dia))
	?tool <- (Tool (Name ?ToolName) (Type DrillBit) (Diameter ?Dia) (Length ?ToolLen))
	(test(<= ?Len ?ToolLen))
=>
	(printout t "drilling Normal" ?Nam crlf)
	;;(assert(Tool (Feature ?Nam)(MaxDiameter ?Dia)(MinDiameter ?Dia)(MinLength ?Len)))
	(retract ?feature)
)
(defrule MillingHole "Milling Hole"
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype Through) (Diameter ?Dia))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Len ?ToolLen))
	(test(<= ?ToolDia (- ?Dia 4)))
=>
	(printout t "Milling Hole" ?Nam crlf)
	;;(assert(Tool (Feature ?Nam)(MaxDiameter (- ?Dia 4))(MinLength ?Len)))
	(modify ?feature (Diameter (- ?Dia 2)))
)

;;-----Face------
(defrule FaceMillingWithPerpendicular "Face Milling"  ;;;;; Attention ! checker b en relation avec a
	?plane1 <- (Plane (Name ?Nam1) (Width ?Width) (Length ?Len) (Orientation ?Ori))
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
	?plane2 <- (Plane (Name ?Nam2) (Width ?Width2) (Length ?Len2))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (FaceSide Face)) ;;(Orientation ?Ori)
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Len2 ?ToolLen))
=>
	(printout t "Face Milling" ?Nam crlf)
	;;(assert(Tool (Feature ?Nam)(MinLength ?Len2))) ;;Condition sur MinLength -> on doit verifier que l'outil est assez long pour faire le plan d'a coté
	(retract ?plane1)
)
(defrule FaceMilling "Face Milling"  ;;;;; Attention ! checker b en relation avec a
	?feature <- (Plane (Name ?Nam) (Width ?Width) (Length ?Len) (Orientation ?Ori))
	?machiningDirection <- (MachiningDirection (Name ?mdName) (Orientation ?mdOri)) (FaceSide Face)
=>
	(printout t "Face Milling" ?Nam crlf)
	(retract ?feature)
)

(defrule SideMilling "Side Milling"
	?feature <- (Plane (Name ?Nam) (Length ?Len) (Orientation ?Ori)) ;; achtung, Len est bien necessaire
	?machiningDirection <- (MachiningDirection (FaceSide Side))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Len ?ToolLen))
=>
	(printout t "Side Milling" ?Nam crlf)
	;;(assert(Tool (Feature ?Nam)(MinLength ?Len)))
	(retract ?feature)
)
;;-----Pocket------
(defrule FaceMillingPocket "Face Milling Pocket"  
	?feature <- (Slot (Name ?Nam) (Height ?Height) (Width ?Width) (Length ?Len))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (Orientation ?mdi) (FaceSide Face))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Height ?ToolLen))
=>
	(printout t "Face Milling Pocket" ?Nam crlf)
	;;(assert(Tool (Feature ?Nam)(MinLength ?Height)))
	(retract ?feature)
)

(defrule SideMillingPocket "Side Milling Side"  
	?feature <- (Slot (Name ?Nam) (Height ?Height) (Width ?Width) (Length ?Len))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (Orientation ?mdi) (FaceSide Side))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(>= ?Height ?ToolLen))
=>
	(printout t "Side Milling Pocket" ?Nam crlf)
	;;(assert(Tool (Feature ?Nam)(MinDiameter ?Height))) ;; la fraise doit pouvoir passer sur le coté c'est plutot le diametre / 2 plus un marge mais on securise ....
	(retract ?feature)
)
;;-----Step 4------
(defrule MachiningMachineDir1 "Machined by machine1"  
	?Machine <- (Machine (Name ?MachineNam) (Orientation1 ?Ori1))
	?machiningDirection <- (MachiningDirection (Name ?FeatureNam) (Orientation ?Ori1))
=>
	(printout t "Machined my first direction of machine" ?MachineNam crlf)

	(assert(FeatureMachinedBy (FeatureName ?FeatureNam)(MachineName ?MachineNam)))
	;;(assert(Tool (Feature ?Nam)(MinDiameter ?Height))) ;; la fraise doit pouvoir passer sur le coté c'est plutot le diametre / 2 plus un marge mais on securise ....
)
(defrule MachiningMachineDir2 "Machined by machine2"  
	?Machine <- (Machine (Name ?MachineNam) (Orientation2 ?Ori2))
	?machiningDirection <- (MachiningDirection (Name ?FeatureNam) (Orientation ?Ori2))
=>
	(printout t "Machined my second direction of machine" ?MachineNam crlf)

	(assert(FeatureMachinedBy (FeatureName ?FeatureNam)(MachineName ?MachineNam)))
	;;(assert(Tool (Feature ?Nam)(MinDiameter ?Height))) ;; la fraise doit pouvoir passer sur le coté c'est plutot le diametre / 2 plus un marge mais on securise ....
)
(defrule MachiningMachineDir3 "Machined by machine3"  
	?Machine <- (Machine (Name ?MachineNam) (Orientation1 ?Ori3))
	?machiningDirection <- (MachiningDirection (Name ?FeatureNam) (Orientation ?Ori3))
=>
	(printout t "Machined by third direction of machine" ?MachineNam crlf)

	(assert(FeatureMachinedBy (FeatureName ?FeatureNam)(MachineName ?MachineNam)))
	;;(assert(Tool (Feature ?Nam)(MinDiameter ?Height))) ;; la fraise doit pouvoir passer sur le coté c'est plutot le diametre / 2 plus un marge mais on securise ....
)
