//Handles Ordering bodycams
/obj/machinery/vending/security
	products = list(
		/obj/item/restraints/handcuffs = 8,
		/obj/item/restraints/handcuffs/cable/zipties = 10,
		/obj/item/grenade/flashbang = 4,
		/obj/item/assembly/flash/handheld = 5,
		/obj/item/food/donut/plain = 12,
		/obj/item/storage/box/evidence = 6,
		/obj/item/flashlight/seclite = 4,
		/obj/item/restraints/legcuffs/bola/energy = 7,
		/obj/item/clothing/gloves/tackler = 5,
		/obj/item/holosign_creator/security = 2,
		/obj/item/gun_maintenance_supplies = 2,
		/obj/item/bodycam_upgrade = 4,
	)

/datum/supply_pack/security/body_cameras
 	name = "Body Camera Crate"
 	desc = "Four standard body cameras."
 	cost = CARGO_CRATE_VALUE * 3 //SKYRAT EDIT 3 -> 5
 	access_view = ACCESS_SECURITY
 	contains = list(/obj/item/bodycam_upgrade = 4)
 	crate_name = "body camera crate"
