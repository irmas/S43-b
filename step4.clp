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
