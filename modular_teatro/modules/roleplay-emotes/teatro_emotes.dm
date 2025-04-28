/////////// SPIT
/obj/projectile/spit
	name = "spit"
	desc = "Spit on someone or something"
	icon = 'modular_teatro/modules/roleplay-emotes/icons/actions.dmi'
	icon_state = "spit"
	pass_flags = PASSTABLE
	speed = 6
	damage_type = BRUTE
	damage = 0
	armour_penetration = 100

	hitsound = 'modular_teatro/modules/roleplay-emotes/sound/spit_hit.mp3'
	hitsound_wall = 'modular_teatro/modules/roleplay-emotes/sound/spit_hit.mp3'

/obj/item/hand_item/spitter
	name = "spit"
	desc = "Spit on someone or something"
	icon = 'modular_teatro/modules/roleplay-emotes/icons/actions.dmi'
	icon_state = "spit"
	inhand_icon_state = "nothing"
	/// The kind of projectile this version of the kiss blower fires
	var/spit_type = /obj/projectile/spit

/obj/item/hand_item/spitter/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	return ranged_interact_with_atom(interacting_with, user, modifiers)

/obj/item/hand_item/spitter/ranged_interact_with_atom(atom/target, mob/living/user, list/modifiers)
	var/obj/projectile/blown_spit = new spit_type(get_turf(user))
	user.visible_message("<b>[user]</b> spits \a [blown_spit] at [target]!", span_notice("You spit \a [blown_spit] at [target]!"))

	//Shooting Code:
	blown_spit.original = target
	blown_spit.fired_from = user
	blown_spit.firer = user // don't hit ourself that would be really annoying
	blown_spit.impacted = list(WEAKREF(user) = TRUE) // just to make sure we don't hit the wearer
	blown_spit.aim_projectile(target, user)
	blown_spit.fire()
	playsound(src, 'modular_teatro/modules/roleplay-emotes/sound/spit_release.ogg', 50, TRUE)
	qdel(src)
	return ITEM_INTERACT_SUCCESS

/datum/emote/living/spit
	key = "spit"
	key_third_person = "spits"
	emote_type = EMOTE_VISIBLE
	cooldown = 3 SECONDS

/datum/emote/living/spit/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	var/spit_type = /obj/item/hand_item/spitter

	var/obj/item/spit_blower = new spit_type(user)

	if(user.put_in_hands(spit_blower))
		to_chat(user, span_notice("You ready your spit"))
		playsound(user, 'modular_teatro/modules/roleplay-emotes/sound/spit_windup.ogg', 50, TRUE)
		return

	qdel(spit_blower)
	to_chat(user, span_warning("You're incapable of blowing a kiss in your current state."))


//////////
