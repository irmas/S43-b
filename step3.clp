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
