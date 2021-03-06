;;---------- Step 1 ----------

(deftemplate Hole "Definition of the hole structure"
	(slot Name (type SYMBOL) (default none))
	(slot Diameter (type FLOAT) (default 0.0))
	(slot Depth (type FLOAT) (default 0.0))
	(slot Ftype (type SYMBOL) (allowed-symbols NonThrough Through))
	(slot Orientation (type INTEGER))
	(slot Status (type SYMBOL) (allowed-symbols Done NotDone)))

(deftemplate Plane "Definition of the plan structure"
	(slot Name (type SYMBOL) (default none))
	(slot Length (type FLOAT) (default 0.0))
	(slot Width (type FLOAT) (default 0.0))
	(slot Orientation (type INTEGER))
	(slot Status (type SYMBOL) (allowed-symbols Done NotDone)))

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
	(slot Status (type SYMBOL) (allowed-symbols Done NotDone)))

(deftemplate Relationship "Definition of the relationships"
	(slot Feature1 (type SYMBOL) (default none))
	(slot Feature2 (type SYMBOL) (default none))
	(slot Relation (type SYMBOL) (allowed-symbols Contact Perpendicular Start_in Lead_to Coaxial Cross NA)(default NA))
)

(deftemplate Tool "Definition of Tool"
	(slot Name (type SYMBOL) (default none)) ;; H1, H2 on associe un outil à un trou / plan / slot
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

(deftemplate MachiningDirection "Determine direction of machining"
	(slot Name (type SYMBOL) (default none))
	(slot Orientation (type INTEGER))
	(slot FaceSide (type SYMBOL) (allowed-symbols Face Side NA)(default NA))
)
(deftemplate FeatureMachinedBy "Determine direction of machining"
	(slot FeatureName (type SYMBOL) (default none))
	(slot MachineName (type SYMBOL) (default none))
)

(deftemplate FeatureMachinedWith "Determine direction of machining"
	(slot FeatureName (type SYMBOL) (default none))
	(slot ToolName (type SYMBOL) (default none))
)
(deftemplate phaseList "phase list"
	(slot MachineName (type SYMBOL) (default none))
	(multislot FeatureList (type SYMBOL) (default none))
)

(defrule Init "Rule which triggers with the no-fact fact"
(initial-fact)
=>
(assert(Plane (Name P1)(Length 150.0)(Width 50.0)(Orientation -3)(Status NotDone)))
(assert(Plane (Name P2)(Length 50.0)(Width 50.0)(Orientation 3)(Status NotDone)))
(assert(Plane (Name P3)(Length 50.0)(Width 20.0)(Orientation 2)(Status NotDone)))
(assert(Plane (Name P4)(Length 50.0)(Width 20.0)(Orientation -2)(Status NotDone)))
(assert(Plane (Name P5)(Length 40.0)(Width 10.0)(Orientation -1)(Status NotDone)))
(assert(Plane (Name P6)(Length 40.0)(Width 10.0)(Orientation -1)(Status NotDone)))
(assert(Slot (Name S1)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation 3)(SideOrientation 1)(Status NotDone)))
(assert(Slot (Name S2)(Length 50.0)(Height 5.0)(Width 6.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation 3)(SideOrientation 1)(Status NotDone)))
(assert(Slot (Name S3)(Length 40.0)(Height 20.0)(Width 20.0)(Inverse NonInverse)(Ftype NonThrough)(Bottom Square)(BottomOrientation 3)(SideOrientation 1)(Status NotDone)))
(assert(Slot (Name S4)(Length 40.0)(Height 30.0)(Width 28.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation 3)(Status NotDone)))
(assert(Slot (Name S5)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)(Status NotDone)))
(assert(Slot (Name S6)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)(Status NotDone)))
(assert(Slot (Name S7)(Length 50.0)(Height 8.0)(Width 10.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)(Status NotDone)))
(assert(Slot (Name S8)(Length 50.0)(Height 4.0)(Width 24.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation -3)(SideOrientation -2)(Status NotDone)))
(assert(Slot (Name S9)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(BottomOrientation -2)(SideOrientation 1)(Status NotDone)))
(assert(Slot (Name S10)(Length 50.0)(Height 6.0)(Width 20.0)(Inverse Inverse)(Ftype Through)(Bottom Square)(BottomOrientation 2)(SideOrientation 1)(Status NotDone)))
(assert(Slot (Name S11)(Length 50.0)(Height 10.0)(Width 100.0)(Inverse NonInverse)(Ftype Through)(Bottom Square)(BottomOrientation 3)(SideOrientation 2)(Status NotDone)))
(assert(Hole (Name H1)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(Orientation 3)(Status NotDone)))
(assert(Hole (Name H2)(Diameter 12.0)(Depth 3.0)(Ftype NonThrough)(Orientation 3)(Status NotDone)))
(assert(Hole (Name H3)(Diameter 6.0)(Depth 47.0)(Ftype Through)(Orientation 3)(Status NotDone)))
(assert(Hole (Name H4)(Diameter 6.0)(Depth 47.0)(Ftype Through)(Orientation 3)(Status NotDone)))
(assert(Hole (Name H5)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(Orientation -1)(Status NotDone)))
(assert(Hole (Name H6)(Diameter 6.0)(Depth 10.0)(Ftype NonThrough)(Orientation -1)(Status NotDone)))
(assert(Tool (Name DB1)(Type DrillBit)(Diameter 6.0)(Length 10.0)))
(assert(Tool (Name DB2)(Type DrillBit)(Diameter 12.0)(Length 80.0)))
(assert(Tool (Name DB3)(Type DrillBit)(Diameter 10.0)(Length 60.0)))
(assert(Tool (Name DB4)(Type DrillBit)(Diameter 20.0)(Length 70.0)))
(assert(Tool (Name DB5)(Type DrillBit)(Diameter 6.0)(Length 60.0)))
(assert(Tool (Name Mill1)(Type Mill)(Diameter 15.0)(Length 40.0)))
(assert(Tool (Name Mill2)(Type Mill)(Diameter 20.0)(Length 80.0)))
(assert(Tool (Name Mill3)(Type Mill)(Diameter 4.0)(Length 2.0)))
(assert(Tool (Name Mill4)(Type Mill)(Diameter 20.0)(Length 3.0)))
(assert(Tool (Name Mill5)(Type Mill)(Diameter 3.0)(Length 10.0)))
(assert(Relationship (Feature1 P5)(Feature2 P6)(Relation Contact)))
(assert(Relationship (Feature1 H1)(Feature2 P2)(Relation Start_in)))
(assert(Relationship (Feature1 H2)(Feature2 P2)(Relation Start_in)))
(assert(Relationship (Feature1 H3)(Feature2 P1)(Relation Lead_to)))
(assert(Relationship (Feature1 H4)(Feature2 P1)(Relation Lead_to)))
(assert(Relationship (Feature1 H5)(Feature2 P5)(Relation Start_in)))
(assert(Relationship (Feature1 H6)(Feature2 P5)(Relation Start_in)))
(assert(Relationship (Feature1 S11)(Feature2 P2)(Relation Start_in)))
(assert(Relationship (Feature1 S9)(Feature2 P4)(Relation Start_in)))
(assert(Relationship (Feature1 S10)(Feature2 P3)(Relation Start_in)))
(assert(Relationship (Feature1 S5)(Feature2 P1)(Relation Start_in)))
(assert(Relationship (Feature1 S7)(Feature2 P1)(Relation Start_in)))
(assert(Relationship (Feature1 S4)(Feature2 P5)(Relation Start_in)))
(assert(Machine (Name M1)(Orientation1 -1)(Orientation2 2)(Orientation3 -2)))
(assert(Machine (Name M2)(Orientation1 1)(Orientation2 2)(Orientation3 -2)))
(assert(Machine (Name M3)(Orientation1 2)(Orientation2 3)(Orientation3 3)))
(assert(Machine (Name M4)(Orientation1 -1)(Orientation2 1)(Orientation3 2)))
(assert(Machine (Name M5)(Orientation1 -3)(Orientation2 3)(Orientation3 2)))
(assert(phaseList (MachineName M1)(FeatureList (create$ ) )))
(assert(phaseList (MachineName M2)(FeatureList (create$ ) )))
(assert(phaseList (MachineName M3)(FeatureList (create$ ) )))
(assert(phaseList (MachineName M4)(FeatureList (create$ ) )))
(assert(phaseList (MachineName M5)(FeatureList (create$ ) )))
)
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

;;-----Step 3------
;;-----Hole------
(defrule deepDrilling "Deep drilling"
(declare (salience 900))
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype NonThrough) (Diameter ?Dia) (Status NotDone))
	?tool <- (Tool (Name ?ToolName) (Type DrillBit) (Diameter ?Dia) (Length ?ToolLen))
	(and (test (>= (/ ?Len ?Dia) 2.0)) (test (<= ?Len ?ToolLen)))
=>
	(printout t "Deep drilling " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

(defrule normalDrilling "drilling normal"
(declare (salience 899))
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype NonThrough) (Diameter ?Dia) (Status NotDone))
	?tool <- (Tool (Name ?ToolName) (Type DrillBit) (Diameter ?Dia) (Length ?ToolLen))
	(and (test (<= ?Len ?ToolLen)) (test (<(/ ?Len ?Dia)2.0)))
=>
	(printout t "Drilling Normal " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

(defrule normalThroughDrilling "drilling normal Through"
(declare (salience 898))
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype Through) (Diameter ?Dia) (Status NotDone))
	?tool <- (Tool (Name ?ToolName) (Type DrillBit) (Diameter ?Dia) (Length ?ToolLen))
	(test(<= ?Len ?ToolLen))
=>
	(printout t "drilling Normal " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)
(defrule MillingHole "Milling Hole"
(declare (salience 897))
	?feature <- (Hole (Name ?Nam) (Depth ?Len) (Ftype Through) (Diameter ?Dia) (Status NotDone))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(and (test(<= ?Len ?ToolLen)) (test(<= ?ToolDia (- ?Dia 4))))
=>
	(printout t "Milling Hole " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Diameter (- ?Dia 2)))
)

;;-----Face------
(defrule FaceMillingWithPerpendicular "Face Milling"  ;;;;; Attention ! checker b en relation avec a
(declare (salience 896))
	?plane1 <- (Plane (Name ?Nam1) (Width ?Width) (Length ?Len) (Orientation ?Ori) (Status NotDone))
	?relation <- (Relationship (Feature1 ?Nam1) (Feature2 ?Nam2) (Relation Perpendicular))
	?plane2 <- (Plane (Name ?Nam2) (Width ?Width2) (Length ?Len2))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (FaceSide Face)) ;;(Orientation ?Ori)
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Len2 ?ToolLen))
=>
	(printout t "Face Milling " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam1)(ToolName ?ToolName)))
	(modify ?plane1 (Status Done))
	(modify ?plane2 (Status Done))
)
(defrule FaceMilling "Face Milling"  ;;;;; Attention ! checker b en relation avec a
(declare (salience 895))
	?feature <- (Plane (Name ?Nam) (Width ?Width) (Length ?Len) (Orientation ?Ori) (Status NotDone))
	?machiningDirection <- (MachiningDirection (Name ?mdName) (Orientation ?mdOri)) (FaceSide Face)
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
=>
	(printout t "Face Milling " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

(defrule SideMilling "Side Milling"
(declare (salience 894))
	?feature <- (Plane (Name ?Nam) (Length ?Len) (Orientation ?Ori) (Status NotDone)) ;; achtung, Len est bien necessair (Status NotDone)e
	?machiningDirection <- (MachiningDirection (FaceSide Side))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Len ?ToolLen))
=>
	(printout t "Side Milling " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)
;;-----Pocket------
(defrule FaceMillingPocket "Face Milling Pocket"  
(declare (salience 893))
	?feature <- (Slot (Name ?Nam) (Height ?Height) (Width ?Width) (Inverse NonInverse) (Length ?Len) (Status NotDone))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (Orientation ?mdi) (FaceSide Face))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(and (test(<= ?Height ?ToolLen)) (test(>= ?Width ?ToolDia)))
=>
	(printout t "Face Milling Pocket " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

(defrule InverseFaceMillingPocket "Inverse Face Milling Pocket"  
(declare (salience 892))
	?feature <- (Slot (Name ?Nam) (Height ?Height) (Width ?Width) (Inverse Inverse) (Length ?Len) (Status NotDone))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (Orientation ?mdi) (FaceSide Face))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(<= ?Height ?ToolLen))
=>
	(printout t "Inverse Face Milling Pocket " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

(defrule SideMillingPocket "Side Milling Side"  
(declare (salience 891))
	?feature <- (Slot (Name ?Nam) (Height ?Height) (Width ?Width) (Inverse NonInverse) (Length ?Len) (Status NotDone))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (Orientation ?mdi) (FaceSide Side))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(and (test(>= ?Height ?ToolLen)) (test(>= ?Width ?ToolDia)))
=>
	(printout t "Side Milling Pocket " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

(defrule InverseSideMillingPocket "Inverse Side Milling Side"  
(declare (salience 890))
	?feature <- (Slot (Name ?Nam) (Height ?Height) (Width ?Width) (Inverse Inverse) (Length ?Len) (Status NotDone))
	?machiningDirection <- (MachiningDirection (Name ?Nam) (Orientation ?mdi) (FaceSide Side))
	?tool <- (Tool (Name ?ToolName) (Type Mill) (Diameter ?ToolDia) (Length ?ToolLen))
	(test(>= ?Height ?ToolLen))
=>
	(printout t "Inverse Side Milling Pocket " ?Nam crlf)
	(assert(FeatureMachinedWith (FeatureName ?Nam)(ToolName ?ToolName)))
	(modify ?feature (Status Done))
)

;;-----Step 4------
(defrule MachiningMachineDir1 "Machined by machine1"  
(declare (salience 800))
	?Machine <- (Machine (Name ?MachineNam) (Orientation1 ?Ori1))
	?machiningDirection <- (MachiningDirection (Name ?FeatureNam) (Orientation ?Ori1))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(printout t ?FeatureNam " machined by first direction of machine " ?MachineNam crlf)

	(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?FeatureNam)))
	(assert(FeatureMachinedBy (FeatureName ?FeatureNam)(MachineName ?MachineNam)))
	(retract ?machiningDirection)
)

(defrule MachiningMachineDir2 "Machined by machine2"  
(declare (salience 799))
	?Machine <- (Machine (Name ?MachineNam) (Orientation2 ?Ori2))
	?machiningDirection <- (MachiningDirection (Name ?FeatureNam) (Orientation ?Ori2))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(printout t ?FeatureNam " machined by second direction of machine " ?MachineNam crlf)

	(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?FeatureNam)))
	(assert(FeatureMachinedBy (FeatureName ?FeatureNam)(MachineName ?MachineNam)))
	(retract ?machiningDirection)
)

(defrule MachiningMachineDir3 "Machined by machine3"  
(declare (salience 798))
	?Machine <- (Machine (Name ?MachineNam) (Orientation1 ?Ori3))
	?machiningDirection <- (MachiningDirection (Name ?FeatureNam) (Orientation ?Ori3))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(printout t ?FeatureNam " machined by third direction of machine " ?MachineNam crlf)
	(assert(FeatureMachinedBy (FeatureName ?FeatureNam)(MachineName ?MachineNam)))
	(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?FeatureNam)))
	(retract ?machiningDirection)
)

;;---------- Step 5 ----------
(defrule CheckingCompatHole "Checking Cross hole compatability"  
(declare (salience 500))
	?Rel <- (Relationship (Feature1 ?Feature1) (Feature2 ?Feature2) (Relation Cross))
	?Hole1 <- (Hole (Name ?Feature1) (Diameter ?Dia1))
	?Hole2 <- (Hole (Name ?Feature2) (Diameter ?Dia2))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(if (and (member$ ?Feature1 $?FeatureList) (member$ ?Feature2 $?FeatureList))  then 
		(printout t ?Feature1 " est dans la meme liste que " ?Feature2 crlf)
		(if (< ?Dia1 ?Dia2) then
			(printout t "on doit faire le plus petit diametre en premier, c'est a dire " ?Feature1 crlf)
			(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature1)))
		)
		(if (> ?Dia1 ?Dia2) then
			(printout t "on doit faire le plus petit diametre en premier, c'est a dire " ?Feature2 crlf)
			(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature2)))
		)
		(retract ?Rel)
	)
)		

(defrule CheckingContactPlane "Checking plane contact compatability"  
(declare (salience 500))
	?Rel <- (Relationship (Feature1 ?Feature1) (Feature2 ?Feature2) (Relation Contact))
	?Hole1 <- (Plane (Name ?Feature1) (Length ?Len1) (Width ?Width1))
	?Hole2 <- (Plane (Name ?Feature2) (Length ?Len2) (Width ?Width2))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(if (and (member$ ?Feature1 $?FeatureList) (member$ ?Feature2 $?FeatureList))  then 
		(printout t ?Feature1 " est dans la meme liste que " ?Feature2 crlf)
		(if (< (* ?Len1 ?Width1) (* ?Len2 ?Width2)) then
			(printout t "on doit faire la plus petite surface en premier, c'est a dire " ?Feature1 crlf)
			(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature1)))
		)
		(if (> (* ?Len1 ?Width1) (* ?Len2 ?Width2)) then
			(printout t "on doit faire la plus petite surface en premier, c'est a dire " ?Feature2 crlf)
			(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature2)))
		)
	(retract ?Rel)
			;;(printout t ?cnt1 " " ?cnt2 crlf)
	)
)

(defrule StartsInHolePlane "Hole Starts in Plane"  
(declare (salience 500))
	?Rel <- (Relationship (Feature1 ?Feature1) (Feature2 ?Feature2) (Relation Start_in))
	?Hole1 <- (Plane (Name ?Feature1))
	?Hole2 <- (Hole (Name ?Feature2))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(if (and (member$ ?Feature1 $?FeatureList) (member$ ?Feature2 $?FeatureList))  then 
		(printout t ?Feature1 " est dans la meme liste que " ?Feature2 crlf)
		(printout t "on doit faire le plan en premier cad " ?Feature1 crlf)
		(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature1)))
	)
	(retract ?Rel)
)

(defrule StartsInHoleSlot "Hole Starts in Slot"  
(declare (salience 500))
	?Rel <- (Relationship (Feature1 ?Feature1) (Feature2 ?Feature2) (Relation Start_in))
	?Hole1 <- (Slot (Name ?Feature2))
	?Hole2 <- (Hole (Name ?Feature1))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(if (and (member$ ?Feature1 $?FeatureList) (member$ ?Feature2 $?FeatureList))  then 
		(printout t ?Feature1 " est dans la meme liste que " ?Feature2 crlf)
		(printout t "on doit faire le slot en premier cad " ?Feature1 crlf)
		(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature1)))
	)
	(retract ?Rel)
)

(defrule StartsInSlotPlane "Slot Starts in Plane"  
(declare (salience 500))
	?Rel <- (Relationship (Feature1 ?Feature1) (Feature2 ?Feature2) (Relation Start_in))
	?Hole1 <- (Plane (Name ?Feature2))
	?Hole2 <- (Slot (Name ?Feature1))
	?phaseList <- (phaseList (MachineName ?MachineNam) (FeatureList $?FeatureList))
=>
	(if (and (member$ ?Feature1 $?FeatureList) (member$ ?Feature2 $?FeatureList))  then 
		(printout t ?Feature1 " est dans la meme liste que " ?Feature2 crlf)
		(printout t "on doit faire le plan en premier cad " ?Feature1 crlf)
		(modify ?phaseList (MachineName ?MachineNam)(FeatureList (insert$ $?FeatureList 1 ?Feature1)))
	)
	(retract ?Rel)
)
