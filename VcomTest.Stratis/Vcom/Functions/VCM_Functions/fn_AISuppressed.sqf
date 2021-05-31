/*
    File: fn_AISuppressed.sqf
    Author: Genesis
    Date: 05/23/2021
    Last Update: 05/23/2021
    
    Description:
		Handles suppression for AI
    
    Parameter(s):
		_Unit - Unit being suppressed [OBJECT]

    Returns:
		NOTHING
    
    Example(s):
	_Unit addEventHandler ["Suppressed", {_this call VCM_fnc_AISuppressed;}];
*/

params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];

if (_distance < 2.1) then
{
	[_Unit,"SUPPRESSED",10] call VCM_fnc_DebugText;
	
	private _UnitSupChk = _Unit getvariable ["VCM_Suptime",-100];
	
	if (_UnitSupChk + 5 < time) then
	{
		_Unit setCombatBehaviour "COMBAT"; 
		_Unit setUnitCombatMode "YELLOW";
		_Unit enableAI "AUTOCOMBAT";
		_Unit dotarget _shooter;
		_Unit setvariable ["VCM_Suptime",time];
	};
};