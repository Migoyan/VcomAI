/**
 * @brief Function returns nearest enemies for a group.
 * Sorted by distance (ascending order).
 *
 * @param {Group} _group
 * @param {Number} [_range = 1000], max distance of collected ennemies
 *
 * @return {array}, array of array of format [2dDistance, unit]
 *
 * @author: Genesis
 */

params[
	'_group',
	['_range', 1000, [0]]
];
private ['_leader', '_nearTargets'];
_leader = leader _group;

_nearTargets = _leader nearEntities ["Man", _range]
	select {[side _leader, side _x] call BIS_fnc_sideIsEnemy}
	apply {[_x distance2D _leader, _x]};
_nearTargets sort true;

_nearTargets
