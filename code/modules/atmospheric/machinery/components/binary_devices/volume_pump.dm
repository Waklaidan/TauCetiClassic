/obj/machinery/atmospherics/components/binary/pump/high_power
	icon = 'icons/atmos/volume_pump.dmi'
	icon_state = "map_off"

	name = "high power gas pump"
	desc = "A pump. Has double the power rating of the standard gas pump."

	power_rating = 15000 // 15000 W ~ 20 HP
	required_skills = list(/datum/skill/atmospherics/trained)

/obj/machinery/atmospherics/components/binary/high_power/atmos_init()
	..()

	set_frequency(frequency)

/obj/machinery/atmospherics/components/binary/pump/high_power/on
	use_power = IDLE_POWER_USE
	icon_state = "map_on"

/obj/machinery/atmospherics/components/binary/pump/high_power/update_icon()
	..()
	if(!powered())
		icon_state = "off"
	else
		icon_state = "[use_power ? "on" : "off"]"

// For mapping purposes
/obj/machinery/atmospherics/components/binary/pump/high_power/on/max_pressure
	target_pressure = MAX_PUMP_PRESSURE

// A possible variant for Atmospherics distribution feed.
/obj/machinery/atmospherics/components/binary/pump/high_power/on/distribution/atom_init()
	. = ..()
	target_pressure = round(3 * ONE_ATMOSPHERE)
