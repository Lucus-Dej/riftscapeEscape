// find workers
with (oGhostBarrier) {
	if (RoomID1 == other.RoomID) {
		other.workerDoor1 = id;
	}
}
with (oGhostBarrier) {
	if (RoomID2 == other.RoomID) {
		other.workerDoor2 = id;
	}
}
with (oFlagUpdate) {
	if (RoomID == other.RoomID) {
		other.workerFlag = id;
		Manager = other.id;
	}
}
// builds list for teleporters
with (oEnemStart) {
    if (RoomID == other.RoomID) {
        ds_list_add(other.spawnerList, id);
    }
}
with (oTeleSpawner) {
    if (RoomID == other.RoomID) {
        other.teleSpawn = id;
		Manager = other.id;
    }
}
with (oBossStart) {
    if (bossCount > 0 && RoomID == other.RoomID) {
        ds_list_add(other.BossList, id);
		other.totalBoss += bossCount;
    }
}
with (oRoomClaimX) {
	if (RoomID == other.RoomID) {
		other.workerX = id;
	}
}
with (oRoomClaimY) {
	if (RoomID == other.RoomID) {
		other.workerY = id;
	}
}
with (oBossBarrierKey) {
	if (RoomID == other.RoomID) {
		other.BossKey = id;
		Manager = other.id;
	}
}
with (oItemFlag) {
	if (RoomID == other.RoomID) {
		other.itemSpawner = id;
		Manager = other.id;
	}
}

// checks for x and y markers (needed for evil walls)
event_user(1);
