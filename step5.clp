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
