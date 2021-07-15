SMA_fnc_sortConfig = { 
	params[ "_config", "_type", [ "_subType", "" ] ]; 

	( "getNumber( _x >> 'scope' ) isEqualTo 2"configClasses( configFile >> _config ) select {
		configName _x call BIS_fnc_itemType params[ "_itemType", "_itemSubType" ];
		_type == _itemType && {
			( _subType isEqualType "" && { _subType == "" || { _subType == _itemSubType }} ) ||
			( _subType isEqualType [] && { { _x == _itemSubType }count _subType > 0 } )
		} 
	}) apply { configName _x }; 
}; 
 

{ 
	_x params[ "_var", "_parameters" ]; 
  
	missionNamespace setVariable [ _var, _parameters call SMA_fnc_sortConfig ]; 
}forEach [
	//[ Global Var, [ Config, Type, SubType/s ] ]
	[ "SMA_vests", [ "CfgWeapons", "Equipment", "Vest" ] ],  
	[ "SMA_uniforms", [ "CfgWeapons", "Equipment", "Uniform" ] ],  
	[ "SMA_helmets", [ "CfgWeapons", "Equipment", "Headgear" ] ],  
	[ "SMA_backPacks", [ "CfgVehicles", "Equipment", "Backpack" ] ],  
	[ "SMA_glasses", [ "CfgGlasses", "Equipment", "Glasses" ] ],
	[ "SMA_primaryWeapons", [ "CfgWeapons", "Weapon", [ "AssaultRifle", "MachineGun", "Rifle", "SubmachineGun", "SniperRifle" ] ] ],
	[ "SMA_secondaryWeapons", [ "CfgWeapons", "Weapon", [ "Launcher", "MissileLauncher", "RocketLauncher" ] ] ], 
	[ "SMA_handguns", [ "CfgWeapons", "Weapon", "Handgun" ] ]
];

copyToClipboard str SMA_primaryWeapons; 