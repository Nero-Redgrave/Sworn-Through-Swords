local mod = get_mod("cz")

function mod.on_all_mods_loaded()
    for backend_id, modified_item_template in pairs(Managers.backend:get_interface("items")._modified_templates) do
        table.merge(modified_item_template, Weapons[modified_item_template.name])
    end
end

mod:echo("Caustic Cloud 1.0")

--Zealot infinite phasewalking?
----------------------------------------------------------KRUBER--------------------------------------------------------------------------------------------
--////////////Mercenary\\\\\\\\\\\\\\
CareerSettings.es_mercenary.attributes.max_hp = 125 --125
BuffTemplates.markus_mercenary_ability_cooldown_on_hit.buffs[1].bonus = 0.5 --0.5
BuffTemplates.markus_mercenary_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.5
--Baseline Ult

ActivatedAbilitySettings.es_3[1].cooldown = 90 --90
--Passive List

--Passive Buffs
BuffTemplates.markus_mercenary_passive_proc.buffs[1].duration = 7.5
--Row 10
BuffTemplates.markus_mercenary_damage_on_enemy_proximity.buffs[1].multiplier = 0.03
BuffTemplates.markus_mercenary_increased_damage_on_enemy_proximity.buffs[1].range = 5

--Row 20
BuffTemplates.markus_mercenary_passive_power_level.buffs[1].duration  = 7.5
BuffTemplates.markus_mercenary_passive_power_level.buffs[1].multiplier = 0.20

BuffTemplates.markus_mercenary_passive_improved.buffs[1].duration  = 15
BuffTemplates.markus_mercenary_passive_improved.buffs[1].multiplier  = 0.3
BuffTemplates.markus_mercenary_passive_improved.buffs[1].targets = 3
--Row 25
BuffTemplates.markus_mercenary_passive_defence.buffs[1].duration  = 7.5

--Row 30


--Talent List
TalentTrees.empire_soldier[3] = {
		{
			"markus_mercenary_reaper",
			"markus_mercenary_bloodlust_2",
			"markus_mercenary_heal_share"
		},
		{
			"markus_mercenary_increased_damage_on_enemy_proximity",
			"markus_mercenary_power_level_cleave",
			"markus_mercenary_crit_count"
		},
		{
			"markus_mercenary_linesman_unbalance",
			"markus_mercenary_smiter_unbalance",
			"markus_mercenary_power_level_unbalance"
		},
		{
			"markus_mercenary_passive_power_level_on_proc",
			"markus_mercenary_passive_improved",
			"markus_mercenary_passive_group_proc"
		},
		{
			"markus_mercenary_dodge_range",
			"markus_mercenary_passive_defence_on_proc",
			"markus_mercenary_max_ammo"
		},
		{
			"markus_mercenary_activated_ability_damage_reduction",
			"markus_mercenary_activated_ability_cooldown_no_heal",
			"markus_mercenary_activated_ability_revive"
		}
}
--////////////Huntsman\\\\\\\\\\\\\\
CareerSettings.es_huntsman.attributes.max_hp = 125 --100
BuffTemplates.markus_huntsman_ability_cooldown_on_hit.buffs[1].bonus = 0.3 --0.3
BuffTemplates.markus_huntsman_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.4 --0.4
--Baseline Ult
CareerAbilityESHuntsman._run_ability = function (self, skip_cooldown)
	local owner_unit = self.owner_unit
	local is_server = self.is_server
	local local_player = self.local_player
	local bot_player = self.bot_player
	local network_manager = self.network_manager
	local network_transmit = network_manager.network_transmit
	local inventory_extension = self._inventory_extension
	local buff_extension = self._buff_extension
	local career_extension = self._career_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local server_buff_names = {
		"markus_huntsman_activated_ability",
		"markus_huntsman_activated_ability_headshot_multiplier"
	}
	local local_buff_names = {}

	if talent_extension:has_talent("markus_huntsman_activated_ability_improved_stealth") then
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom",
			"markus_huntsman_activated_ability_increased_reload_speed",
		}
	elseif talent_extension:has_talent("markus_huntsman_activated_ability_duration") then
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom_duration",
			"markus_huntsman_activated_ability_increased_reload_speed_duration",
			"markus_huntsman_end_activated_on_ranged_hit_duration",
			"markus_huntsman_end_activated_on_melee_hit_duration"
		}
		server_buff_names = {
			"markus_huntsman_activated_ability_duration",
			"markus_huntsman_activated_ability_headshot_multiplier_duration"
		}
	else
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom",
			"markus_huntsman_activated_ability_increased_reload_speed",
			"markus_huntsman_end_activated_on_ranged_hit",
			"markus_huntsman_end_activated_on_melee_hit"
		}
		server_buff_names = {
			"markus_huntsman_activated_ability",
			"markus_huntsman_activated_ability_headshot_multiplier"
		}
	end
end

ActivatedAbilitySettings.es_1[1].cooldown = 60 --90
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.empire_soldier[1] = {
		{
			"markus_huntsman_vanguard",
			"markus_huntsman_bloodlust_2",
			"markus_huntsman_heal_share"
		},
		{
			"markus_huntsman_third_shot_free",
			"markus_huntsman_debuff_defence_on_crit",
			"markus_huntsman_headshot_damage"
		},
		{
			"markus_huntsman_tank_unbalance",
			"markus_huntsman_smiter_unbalance",
			"markus_huntsman_power_level_unbalance"
		},
		{
			"markus_huntsman_headshots_increase_reload_speed",
			"markus_huntsman_passive_crit_buff_on_headshot",
			"markus_huntsman_passive_temp_health_on_headshot"
		},
		{
			"markus_huntsman_ammo_on_special_kill",
			"markus_huntsman_movement_speed_2",
			"markus_huntsman_movement_speed"
		},
		{
			"markus_huntsman_activated_ability_cooldown",
			"markus_huntsman_activated_ability_improved_stealth",
			"markus_huntsman_activated_ability_duration"
		}
}
--////////////Foot Knight\\\\\\\\\\\\\\
CareerSettings.es_knight.attributes.max_hp = 150 --150
BuffTemplates.markus_knight_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.markus_knight_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.5 --0.5
--Baseline Ult

ActivatedAbilitySettings.es_2[1].cooldown = 45 --30
--Passive List


--Passive Buffs


--Row 10
BuffTemplates.markus_knight_power_level_on_stagger_elite_buff.buffs[1].duration = 15
BuffTemplates.markus_knight_attack_speed_on_push_buff.buffs[1].duration = 5
--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.empire_soldier[2] = {
		{
			"markus_knight_vanguard",
			"markus_knight_reaper",
			"markus_knight_heal_share"
		},
		{
			"markus_knight_power_level_impact",
			"markus_knight_power_level_on_stagger_elite",
			"markus_knight_attack_speed_on_push"
		},
		{
			"markus_knight_tank_unbalance",
			"markus_knight_linesman_unbalance",
			"markus_knight_power_level_unbalance"
		},
		{
			"markus_knight_passive_block_cost_aura",
			"markus_knight_damage_taken_ally_proximity",
			"markus_knight_guard"
		},
		{
			"markus_knight_charge_reset_on_incapacitated_allies",
			"markus_knight_free_pushes_on_block",
			"markus_knight_cooldown_on_stagger_elite"
		},
		{
			"markus_knight_ability_invulnerability",
			"markus_knight_wide_charge",
			"markus_knight_ability_attack_speed_enemy_hit"
		}
}
--////////////Grail Knight\\\\\\\\\\\\\\
CareerSettings.es_questingknight.attributes.max_hp = 150 --150
BuffTemplates.markus_questing_knight_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.markus_questing_knight_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.25
--Baseline Ult

ActivatedAbilitySettings.es_4[1].cooldown = 60 --40
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.empire_soldier[4] = {
		{
			"markus_questing_knight_vanguard",
			"markus_questing_knight_bloodlust_2",
			"markus_questing_knight_heal_share"
		},
		{
			"markus_questing_knight_kills_buff_power_stacking",
			"markus_questing_knight_crit_can_insta_kill",
			"markus_questing_knight_charged_attacks_increased_power"
		},
		{
			"markus_questing_knight_tank_unbalance",
			"markus_questing_knight_smiter_unbalance",
			"markus_questing_knight_power_level_unbalance"
		},
		{
			"markus_questing_knight_passive_additional_quest",
			"markus_questing_knight_passive_improved_reward",
			"markus_questing_knight_passive_side_quest"
		},
		{
			"markus_questing_knight_health_refund_over_time",
			"markus_questing_knight_parry_increased_power",
			"markus_questing_knight_push_arc_stamina_reg"
		},
		{
			"markus_questing_knight_ability_double_activation",
			"markus_questing_knight_ability_buff_on_kill",
			"markus_questing_knight_ability_tank_attack"
		}
	}
mod:echo("MK C")
----------------------------------------------------------BARDIN--------------------------------------------------------------------------------------------
--////////////Ranger\\\\\\\\\\\\\\
CareerSettings.dr_ranger.attributes.max_hp = 125 --100
BuffTemplates.bardin_ranger_ability_cooldown_on_hit.buffs[1].bonus = 0.3 --0.3
BuffTemplates.bardin_ranger_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.3 --0.3
--Baseline Ult

ActivatedAbilitySettings.dr_3[1].cooldown = 90 --120
--Passive List
PassiveAbilitySettings.dr_3.buffs = {
			"bardin_ranger_passive",
			"bardin_ranger_passive_increased_ammunition",
			"bardin_ranger_passive_reload_speed",
			"bardin_ranger_passive_consumeable_dupe_healing",
			"bardin_ranger_passive_consumeable_dupe_potion",
			"bardin_ranger_passive_consumeable_dupe_grenade",
			"sienna_scholar_overcharge_no_slow", --new
			"bardin_ranger_ability_cooldown_on_hit",
			"bardin_ranger_ability_cooldown_on_damage_taken"
}
--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.dwarf_ranger[3] = {
		{
			"bardin_ranger_vanguard",
			"bardin_ranger_reaper",
			"bardin_ranger_heal_share"
		},
		{
			"bardin_ranger_increased_melee_damage_on_no_ammo",
			"bardin_ranger_cooldown_on_reload",
			"bardin_ranger_attack_speed"
		},
		{
			"bardin_ranger_tank_unbalance",
			"bardin_ranger_linesman_unbalance",
			"bardin_ranger_power_level_unbalance"
		},
		{
			"bardin_ranger_passive_ale",
			"bardin_ranger_passive_improved_ammo",
			"bardin_ranger_passive_spawn_potions_or_bombs"
		},
		{
			"bardin_ranger_movement_speed",
			"bardin_ranger_reduced_damage_taken_headshot",
			"bardin_ranger_reload_speed_on_multi_hit"
		},
		{
			"bardin_ranger_smoke_attack",
			"bardin_ranger_activated_ability_stealth_outside_of_smoke",
			"bardin_ranger_ability_free_grenade"
		}
}
--////////////Ironbreaker\\\\\\\\\\\\\\
CareerSettings.dr_ironbreaker.attributes.max_hp = 150 --150
BuffTemplates.bardin_ironbreaker_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.bardin_ironbreaker_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.5 --0.5
--Baseline Ult

ActivatedAbilitySettings.dr_1[1].cooldown = 90 --120
--Passive List
PassiveAbilitySettings.dr_1.buffs = {
			"bardin_ironbreaker_gromril_armour",
			"bardin_ironbreaker_gromril_antistun",
			"bardin_ironbreaker_passive_increased_defence",
			"bardin_ironbreaker_passive_increased_stamina",
			"bardin_ironbreaker_passive_reduced_stun_duration",
			"bardin_ironbreaker_refresh_gromril_armour",
			"sienna_scholar_overcharge_no_slow", --new
			"bardin_ironbreaker_ability_cooldown_on_hit",
			"bardin_ironbreaker_ability_cooldown_on_damage_taken"
}
--Passive Buffs


--Row 10
BuffTemplates.bardin_ironbreaker_power_on_nearby_allies_buff.buffs[1].multiplier = 0.1

--Row 20
BuffTemplates.bardin_ironbreaker_gromril_attack_speed.buffs[1].icon = "bardin_ironbreaker_stamina_regen_during_gromril"
BuffTemplates.bardin_ironbreaker_gromril_attack_speed.buffs[1].presentation_delay = 2
BuffTemplates.bardin_ironbreaker_gromril_attack_speed.buffs[1].multiplier = 0.04
BuffTemplates.bardin_ironbreaker_stacking_buff_gromril.buffs[1].update_frequency = 2
BuffTemplates.bardin_ironbreaker_gromril_rising_anger.buffs[1].stat_buff = "attack_speed"
BuffTemplates.bardin_ironbreaker_gromril_rising_anger.buffs[1].multiplier = 0.02



--Row 25
BuffTemplates.bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina.buffs[1].cooldown_reduction = 0.01


--Row 30


--Talent List
TalentTrees.dwarf_ranger[1] = {
		{
			"bardin_ironbreaker_vanguard",
			"bardin_ironbreaker_bloodlust_2",
			"bardin_ironbreaker_heal_share"
		},
		{
			"bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed",
			"bardin_ironbreaker_power_on_nearby_allies",
			"bardin_ironbreaker_party_power_on_blocked_attacks"
		},
		{
			"bardin_ironbreaker_tank_unbalance",
			"bardin_ironbreaker_smiter_unbalance",
			"bardin_ironbreaker_power_level_unbalance"
		},
		{
			"bardin_ironbreaker_rising_attack_speed",
			"bardin_ironbreaker_gromril_stagger",
			"bardin_ironbreaker_max_gromril_delay"
		},
		{
			"bardin_ironbreaker_regen_stamina_on_block_broken",
			"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
			"bardin_ironbreaker_regen_stamina_on_charged_attacks"
		},
		{
			"bardin_ironbreaker_activated_ability_power_buff_allies",
			"bardin_ironbreaker_activated_ability_taunt_bosses",
			"bardin_ironbreaker_activated_ability_taunt_range_and_duration"
		}
}
--////////////Slayer\\\\\\\\\\\\\\
CareerSettings.dr_slayer.attributes.max_hp = 125 --125
BuffTemplates.bardin_slayer_ability_cooldown_on_hit.buffs[1].bonus = 0.5 --0.5
BuffTemplates.bardin_slayer_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.1
--Baseline Ult

ActivatedAbilitySettings.dr_2[1].cooldown = 60 --40
--Passive List
PassiveAbilitySettings.dr_2.buffs = {
			"bardin_slayer_passive_attack_speed",
			"bardin_slayer_passive_stacking_damage_buff_on_hit",
			"bardin_slayer_ability_cooldown_on_damage_taken",
			"bardin_slayer_ability_cooldown_on_hit",
			"bardin_slayer_passive_uninterruptible_heavy"
}
--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.dwarf_ranger[2] = {
		{
			"bardin_slayer_reaper",
			"bardin_slayer_bloodlust_2",
			"bardin_slayer_heal_share"
		},
		{
			"bardin_slayer_attack_speed_on_double_one_handed_weapons",
			"bardin_slayer_power_on_double_two_handed_weapons",
			"bardin_slayer_crit_chance"
		},
		{
			"bardin_slayer_smiter_unbalance",
			"bardin_slayer_linesman_unbalance",
			"bardin_slayer_power_level_unbalance"
		},
		{
			"bardin_slayer_passive_movement_speed",
			"bardin_slayer_passive_increased_max_stacks",
			"bardin_slayer_passive_cooldown_reduction_on_max_stacks"
		},
		{
			"bardin_slayer_damage_taken_capped",
			"bardin_slayer_damage_reduction_on_melee_charge_action",
			"bardin_slayer_push_on_dodge"
		},
		{
			"bardin_slayer_activated_ability_impact_damage",
			"bardin_slayer_activated_ability_leap_damage",
			"bardin_slayer_activated_ability_movement"
		}
}
--////////////Engineer\\\\\\\\\\\\\\
CareerSettings.dr_engineer.attributes.max_hp = 125 --100
BuffTemplates.bardin_engineer_ability_cooldown_on_hit = {
	buffs = {
		{
			name = "bardin_engineer_ability_cooldown_on_hit",
			event = "on_hit",
			event_buff = true,
			buff_func = "reduce_activated_ability_cooldown",
			bonus = 0.25 --0
		}
	}
}
BuffTemplates.bardin_engineer_ability_cooldown_on_damage_taken = {
	buffs = {
		{
			name = "bardin_engineer_ability_cooldown_on_damage_taken",
			event = "on_damage_taken",
			event_buff = true,
			buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
			bonus = 0.25 --0
		}
	}
}
--Baseline Ult
DamageProfileTemplates.engineer_ability_shot = {
		charge_value = "instant_projectile",
		shield_break = false,
		no_stagger_damage_reduction_ranged = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.25,
				1.75,
				0.01,
				1,
				0.25
			},
			impact_armor_power_modifer = {
				1,
				0.25,
				1,
				1,
				1,
				0.25
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				0.1,
				1.75,
				0.001,
				1,
				0
			},
			impact = {
				1,
				0.1,
				1,
				1,
				1,
				0
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				0.1,
				1.75,
				0.001,
				1,
				0
			},
			impact = {
				1,
				0.1,
				1,
				1,
				1,
				0
			}
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		default_target = {
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "linesman_curve",
			boost_curve_coefficient = 0.6,
			attack_template = "shot_machinegun",
			power_distribution_near = {
				attack = 0.25,
				impact = 0.075
			},
			power_distribution_far = {
				attack = 0.125,
				impact = 0.05
			},
			range_dropoff_settings = engineer_ability_shot_dropoff_ranges
		}
	}
Weapons.bardin_engineer_career_skill_weapon.default_spread_template = "chaingun"
SpreadTemplates.chaingun = {
		continuous = {
			still = {
				max_yaw = 0.5,
				max_pitch = 0.5
			},
			moving = {
				max_yaw = 1.5,
				max_pitch = 1.5
			},
			crouch_still = {
				max_yaw = 0.5,
				max_pitch = 0.5
			},
			crouch_moving = {
				max_yaw = 0.75,
				max_pitch = 0.75
			},
			zoomed_still = {
				max_yaw = 0.5,
				max_pitch = 0.5
			},
			zoomed_moving = {
				max_yaw = 1.5,
				max_pitch = 1.5
			},
			zoomed_crouch_still = {
				max_yaw = 0.5,
				max_pitch = 0.5
			},
			zoomed_crouch_moving = {
				max_yaw = 1.5,
				max_pitch = 1.5
			}
		},
		immediate = {
			being_hit = {
				immediate_pitch = 0.25,
				immediate_yaw = 0.25
			},
			shooting = {
				immediate_pitch = 0,
				immediate_yaw = 0
			}
		}
	}
ActivatedAbilitySettings.dr_4[1].cooldown = 60 --60
--Passive List
PassiveAbilitySettings.dr_4.buffs = {
		--"bardin_engineer_passive_no_ability_regen",
		"bardin_engineer_passive_ranged_power_aura",
		"bardin_engineer_passive_max_ammo",
		"bardin_engineer_remove_pump_stacks",
		"bardin_engineer_remove_pump_stacks_fire",
		"sienna_scholar_overcharge_no_slow", --new
		"bardin_engineer_ability_cooldown_on_hit",
		"bardin_engineer_ability_cooldown_on_damage_taken"
}
--Passive Buffs

--Row 10


--Row 20


--Row 25


--Row 30
DamageProfileTemplates.engineer_ability_shot_armor_pierce = {
		charge_value = "instant_projectile",
		no_stagger_damage_reduction_ranged = true,
		shield_break = true,
		critical_strike = {
			attack_armor_power_modifer = {
				1,
				0.5,
				1,
				0.001,
				0.65,
				0.5
			},
			impact_armor_power_modifer = {
				1,
				1,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier_near = {
			attack = {
				1,
				0.5,
				1,
				0.001,
				0.65,
				0.5
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				1
			}
		},
		armor_modifier_far = {
			attack = {
				1,
				0.5,
				1,
				0.001,
				0.65,
				0.5
			},
			impact = {
				1,
				1,
				1,
				1,
				1,
				0.75
			}
		},
		cleave_distribution = {
			attack = 0.25,
			impact = 0.25
		},
		default_target = {
			headshot_boost_boss = 0.5,
			boost_curve_coefficient_headshot = 1,
			boost_curve_type = "smiter_curve",
			boost_curve_coefficient = 1,
			attack_template = "shot_sniper",
			power_distribution_near = {
				attack = 1,
				impact = 0.5
			},
			power_distribution_far = {
				attack = 0.8,
				impact = 0.5
			},
			range_dropoff_settings = sniper_dropoff_ranges
		}
	}
Weapons.bardin_engineer_career_skill_weapon_special.default_spread_template = "chaingun"

--Talent List
TalentTrees.dwarf_ranger[4] = {
		{
			"bardin_engineer_vanguard",
			"bardin_engineer_reaper",
			"bardin_engineer_heal_share"
		},
		{
			"bardin_engineer_ranged_crit_count",
			"bardin_engineer_ranged_pierce",
			"bardin_engineer_melee_power_ranged_power"
		},
		{
			"bardin_engineer_tank_unbalance",
			"bardin_engineer_linesman_unbalance",
			"bardin_engineer_power_level_unbalance"
		},
		{
			"bardin_engineer_power_on_max_pump",
			"bardin_engineer_stacks_stay",
			"bardin_engineer_pump_buff_long"
		},
		{
			"bardin_engineer_stacking_damage_reduction",
			"bardin_engineer_upgraded_grenades",
			"bardin_engineer_piston_powered"
		},
		{
			"bardin_engineer_armor_piercing_ability",
			"bardin_engineer_reduced_ability_fire_slowdown",
			"bardin_engineer_increased_ability_bar"
		}
	}
mod:echo("BG C")
----------------------------------------------------------KERILLIAN------------------------------------------------------------------------------------------
--////////////Waystalker\\\\\\\\\\\\\\
CareerSettings.we_waywatcher.attributes.max_hp = 125 --100
BuffTemplates.kerillian_waywatcher_ability_cooldown_on_hit.buffs[1].bonus = 0.35 --0.35
BuffTemplates.kerillian_waywatcher_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.3 --0.3
--Baseline Ult
DamageProfileTemplates.arrow_sniper_trueflight = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
			0.001,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			1,
			0,
			1,
			1,
			1
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1,
			1,
			0.001,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			1
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			1,
			2,
			0.001,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.25,
		impact = 0.25
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_sniper",
		power_distribution_near = {
			attack = 0.5,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.5,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
ActivatedAbilitySettings.we_3[1].cooldown = 60 --80
--Passive List

--Passive Buffs

--Row 10


--Row 20


--Row 25


--Row 30
DamageProfileTemplates.arrow_sniper_ability_piercing = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			1,
			0.001,
			1,
			0.25
		},
		impact_armor_power_modifer = {
			1,
			1,
			0,
			1,
			1,
			1
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			1,
			1,
			0.001,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			1
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			1,
			2,
			0.001,
			1,
			0.25
		},
		impact = {
			1,
			1,
			0,
			0,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 1,
		impact = 1
	},
	default_target = {
		boost_curve_coefficient_headshot = 7,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "arrow_sniper",
		power_distribution_near = {
			attack = 1,
			impact = 0.3
		},
		power_distribution_far = {
			attack = 0.75,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
--Talent List
TalentTrees.wood_elf[3]= {
		{
			"kerillian_waywatcher_regrowth_2",
			"kerillian_waywatcher_reaper",
			"kerillian_waywatcher_heal_share"
		},
		{
			"kerillian_waywatcher_extra_arrow_melee_kill",
			"kerillian_waywatcher_critical_bleed",
			"kerillian_waywatcher_attack_speed_on_ranged_headshot"
		},
		{
			"kerillian_waystalker_linesman_unbalance",
			"kerillian_waystalker_finesse_unbalance",
			"kerillian_waystalker_power_level_unbalance"
		},
		{
			"kerillian_waywatcher_improved_regen",
			"kerillian_waywatcher_passive_cooldown_restore",
			"kerillian_waywatcher_group_regen"
		},
		{
			"kerillian_waywatcher_movement_speed_on_special_kill",
			"kerillian_waywatcher_projectile_ricochet",
			"kerillian_waywatcher_activated_ability_cooldown"
		},
		{
			"kerillian_waywatcher_activated_ability_piercing_shot",
			"kerillian_waywatcher_activated_ability_additional_projectile",
			"kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill"
		}
	}
--////////////Handmaiden\\\\\\\\\\\\\\                   --Ult baseline dash-taunt that only taunts elites (idea from combine)
CareerSettings.we_maidenguard.attributes.max_hp = 150 --125
BuffTemplates.kerillian_maidenguard_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.kerillian_maidenguard_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.5 --0.5
--Baseline Ult

ActivatedAbilitySettings.we_2[1].cooldown = 20 --20
--Passive List/Slots
PassiveAbilitySettings.we_2.buffs = {
			"kerillian_maidenguard_passive_stamina_regen_aura",
			"kerillian_maidenguard_passive_healing_recieved",
			"kerillian_maidenguard_passive_increased_stamina",
			"kerillian_maidenguard_ress_time",
			"kerillian_maidenguard_ability_cooldown_on_hit",
			"kerillian_maidenguard_ability_cooldown_on_damage_taken"
}
PassiveAbilitySettings.we_2.perks = {
			{
				display_name = "career_passive_name_we_2b",
				description = "career_passive_desc_we_2b_2"
			},
			{
				display_name = "career_passive_name_we_2c",
				description = "career_passive_desc_we_2c_2"
			},
			{
				display_name = "career_passive_name_we_2d",
				description = "career_passive_desc_we_2d_2"
			}
}
--Passive Buffs
BuffTemplates.kerillian_maidenguard_passive_stamina_regen_aura.buffs[1].range = 1000
BuffTemplates.kerillian_maidenguard_passive_stamina_regen_buff.buffs[1].multiplier = 0.6
BuffTemplates.kerillian_maidenguard_passive_increased_stamina.buffs[1].bonus = 2
BuffTemplates.kerillian_maidenguard_passive_healing_recieved = {
buffs = {
		{
			multiplier = 0.50,
			stat_buff = "healing_received"
		}
	}
}
--Row 10
BuffTemplates.kerillian_maidenguard_power_level_on_unharmed.buffs[1].multiplier = 0.2
BuffTemplates.kerillian_maidenguard_power_level_on_unharmed_cooldown.buffs[1].duration = 5


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.wood_elf[2]= {
		{
			"kerillian_maidenguard_reaper",
			"kerillian_maidenguard_bloodlust_2",
			"kerillian_maidenguard_heal_share"
		},
		{
			"kerillian_maidenguard_power_level_on_unharmed",
			"kerillian_maidenguard_crit_chance",
			"kerillian_maidenguard_speed_on_block"
		},
		{
			"kerillian_maidenguard_smiter_unbalance",
			"kerillian_maidenguard_linesman_unbalance",
			"kerillian_maidenguard_power_level_unbalance"
		},
		{
			"kerillian_maidenguard_passive_attack_speed_on_dodge",
			"kerillian_maidenguard_versatile_dodge",
			"kerillian_maidenguard_passive_noclip_dodge"
		},
		{
			"kerillian_maidenguard_max_health",
			"kerillian_maidenguard_block_cost",
			"kerillian_maidenguard_max_ammo"
		},
		{
			"kerillian_maidenguard_activated_ability_invis_duration",
			"kerillian_maidenguard_activated_ability_damage",
			"kerillian_maidenguard_activated_ability_buff_on_enemy_hit"
		}
}
--////////////Shade\\\\\\\\\\\\\\
CareerSettings.we_shade.attributes.max_hp = 125 --100
BuffTemplates.kerillian_shade_ability_cooldown_on_hit.buffs[1].bonus = 0.5 --0.5
BuffTemplates.kerillian_shade_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.2
--Baseline Ult

ActivatedAbilitySettings.we_1[1].cooldown = 60 --60
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.wood_elf[1] = {
		{
			"kerillian_shade_regrowth_2",
			"kerillian_shade_bloodlust",
			"kerillian_shade_heal_share"
		},
		{
			"kerillian_shade_increased_critical_strike_damage",
			"kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy",
			"kerillian_shade_stacking_headshot_damage_on_headshot"
		},
		{
			"kerillian_shade_smiter_unbalance",
			"kerillian_shade_finesse_unbalance",
			"kerillian_shade_power_level_unbalance"
		},
		{
			"kerillian_shade_charged_backstabs",
			"kerillian_shade_backstabs_cooldown_regeneration",
			"kerillian_shade_backstabs_replenishes_ammunition"
		},
		{
			"kerillian_shade_damage_reduction_on_critical_hit",
			"kerillian_shade_movement_speed_on_critical_hit",
			"kerillian_shade_movement_speed"
		},
		{
			"kerillian_shade_activated_stealth_combo",
			"kerillian_shade_activated_ability_phasing",
			"kerillian_shade_activated_ability_restealth"
		}
}
--////////////Sister of the Thorn\\\\\\\\\\\\\\
CareerSettings.we_thornsister.attributes.max_hp = 125 --125
BuffTemplates.thorn_sister_ability_cooldown_on_hit.buffs[1].bonus = 0.3 --0.3
BuffTemplates.thorn_sister_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.4 --0.4
--Baseline Ult

ActivatedAbilitySettings.we_thornsister[1].cooldown = 45 --40
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.wood_elf[4] = {
		{
			"kerillian_thorn_sister_regrowth",
			"kerillian_thorn_sister_bloodlust",
			"kerillian_thorn_sister_heal_share"
		},
		{
			"kerillian_thorn_sister_attack_speed_on_full",
			"kerillian_thorn_sister_crit_big_bleed",
			"kerillian_thorn_sister_crit_on_cast"
		},
		{
			"kerillian_thorn_sister_smiter_unbalance",
			"kerillian_thorn_sister_linesman_unbalance",
			"kerillian_thorn_sister_power_level_unbalance"
		},
		{
			"kerillian_double_passive",
			"kerillian_thorn_sister_faster_passive",
			"kerillian_thorn_sister_passive_team_buff"
		},
		{
			"kerillian_thorn_sister_double_poison",
			"kerillian_thorn_sister_crit_aoe_poison",
			"kerillian_thorn_sister_big_push"
		},
		{
			"kerillian_thorn_sister_tanky_wall",
			"kerillian_thorn_sister_wall_push",
			"kerillian_thorn_sister_debuff_wall"
		}
	}
mod:echo("KL C")
----------------------------------------------------------SALTZPYRE----------------------------------------------------------------------------------------
--////////////Witch Hunter\\\\\\\\\\\\\\
CareerSettings.wh_captain.attributes.max_hp = 125 --125
BuffTemplates.victor_witchhunter_ability_cooldown_on_hit.buffs[1].bonus = 0.5 --0.5
BuffTemplates.victor_witchhunter_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.2
--Baseline Ult

ActivatedAbilitySettings.wh_3[1].cooldown = 90 --90
--Passive List
PassiveAbilitySettings.wh_3.buffs = {
			"victor_witchhunter_passive",
			"victor_witchhunter_passive_increased_stamina",
			"victor_witchhunter_passive_healing_recieved",
			"victor_witchhunter_ability_cooldown_on_hit",
			"victor_witchhunter_ability_cooldown_on_damage_taken"
		}
PassiveAbilitySettings.wh_3.perks = {
			{
				display_name = "career_passive_name_wh_3b",
				description = "career_passive_desc_wh_3b"
			},
			{
				display_name = "career_passive_name_wh_3c",
				description = "career_passive_desc_wh_3c"
			},
			{
				display_name = "career_passive_name_wh_3d",
				description = "career_passive_desc_wh_3d"
			}
}
--Passive Buffs
BuffTemplates.victor_witchhunter_passive_increased_stamina= {
		buffs = {
			{
				stat_buff = "max_fatigue",
				bonus = 2
			}
		}
	}
BuffTemplates.victor_witchhunter_passive_healing_recieved = {
buffs = {
		{
			multiplier = 0.3,
			stat_buff = "healing_received"
		}
	}
}
--Row 10
BuffTemplates.victor_witchhunter_headshot_damage_increase.buffs[1].multiplier = 0.75

--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.witch_hunter[3] = {
		{
			"victor_witchhunter_regrowth_2",
			"victor_witchhunter_reaper",
			"victor_witchhunter_heal_share"
		},
		{
			"victor_witchhunter_guaranteed_crit_on_timed_block",
			"victor_witchhunter_headshot_damage_increase",
			"victor_witchhunter_bleed_on_critical_hit"
		},
		{
			"victor_witchhunter_linesman_unbalance",
			"victor_witchhunter_finesse_unbalance",
			"victor_witchhunter_power_level_unbalance"
		},
		{
			"victor_witchhunter_improved_damage_taken_ping",
			"victor_witchhunter_attack_speed_on_enemy_pinged",
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed"
		},
		{
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_stamina_regen_on_push",
			"victor_witchhunter_max_ammo"
		},
		{
			"victor_captain_activated_ability_stagger_ping_debuff",
			"victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
			"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit"
		}
}
--////////////Bounty Hunter\\\\\\\\\\\\\\
CareerSettings.wh_bountyhunter.attributes.max_hp = 125 --100
BuffTemplates.victor_bountyhunter_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.victor_bountyhunter_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.3 --0.3
--Baseline Ult
DamageProfileTemplates.shot_shotgun_ability = {
	shield_break = true,
	charge_value = "instant_projectile",
	no_stagger_damage_reduction_ranged = true,
	is_explosion = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			0.1,
			0.2,
			0.001,
			1,
			0.025
		},
		impact_armor_power_modifer = {
			1,
			0.5,
			200,
			0.25,
			1,
			0.05
		}
	},
	armor_modifier_near = {
		attack = {
			1,
			0.1,
			0.2,
			0.001,
			1,
			0
		},
		impact = {
			1,
			0.5,
			100,
			0.25,
			1,
			0
		}
	},
	armor_modifier_far = {
		attack = {
			1,
			0,
			0.2,
			0.001,
			1,
			0
		},
		impact = {
			1,
			0.5,
			200,
			0.25,
			1,
			0
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 0.25,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.25,
		attack_template = "shot_sniper",
		power_distribution_near = {
			attack = 0.5,
			impact = 0.5
		},
		power_distribution_far = {
			attack = 0.25,
			impact = 0.25
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
DamageProfileTemplates.shot_sniper_ability = {
	charge_value = "instant_projectile",
	shield_break = true,
	no_stagger_damage_reduction_ranged = true,
	is_explosion = true,
	critical_strike = {
		attack_armor_power_modifer = {
			1,
			1,
			2,
			0.001,
			1,
			1
		},
		impact_armor_power_modifer = {
			1,
			1,
			200,
			1,
			1,
			1
		}
	},
	armor_modifier = {
		attack = {
			1,
			1,
			2,
			0.001,
			1,
			1
		},
		impact = {
			1,
			1,
			200,
			0.1,
			1,
			1
		}
	},
	cleave_distribution = {
		attack = 0.3,
		impact = 0.3
	},
	default_target = {
		boost_curve_coefficient_headshot = 0.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.5,
		attack_template = "shot_sniper",
		power_distribution = {
			attack = 2,
			impact = 2
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}


ActivatedAbilitySettings.wh_2[1].cooldown = 60 --70
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.witch_hunter[2] = {
		{
			"victor_bountyhunter_regrowth_2",
			"victor_bountyhunter_bloodlust_2",
			"victor_bountyhunter_heal_share"
		},
		{
			"victor_bountyhunter_debuff_defence_on_crit",
			"victor_bountyhunter_power_burst_on_no_ammo",
			"victor_bountyhunter_power_level_on_clip_size"
		},
		{
			"victor_bounty_hunter_smiter_unbalance",
			"victor_bounty_hunter_finesse_unbalance",
			"victor_bounty_hunter_power_level_unbalance"
		},
		{
			"victor_bountyhunter_weapon_swap_buff",
			"victor_bountyhunter_passive_reduced_cooldown",
			"victor_bountyhunter_passive_infinite_ammo"
		},
		{
			"victor_bountyhunter_party_movespeed_on_ranged_crit",
			"victor_bountyhunter_reload_on_kill",
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill"
		},
		{
			"victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
			"victor_bountyhunter_activated_ability_railgun",
			"victor_bountyhunter_activated_ability_blast_shotgun"
		}
}
--////////////Zealot\\\\\\\\\\\\\\
CareerSettings.wh_zealot.attributes.max_hp = 150 --150
BuffTemplates.victor_zealot_ability_cooldown_on_hit.buffs[1].bonus = 0.5 --0.5
BuffTemplates.victor_zealot_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.2
--Baseline Ult
BuffTemplates.victor_zealot_activated_ability.buffs[1].multiplier = 0.5
BuffTemplates.victor_zealot_activated_ability.buffs[1].stat_buff = "power_level"
BuffTemplates.victor_zealot_activated_ability.buffs[1].refresh_durations = false
ActivatedAbilitySettings.wh_1[1].cooldown = 60 --60
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30
BuffTemplates.victor_zealot_activated_ability_power_on_hit.buffs[1].duration = 5
BuffTemplates.victor_zealot_activated_ability_power_on_hit_buff.buffs[1].duration = 5
BuffTemplates.victor_zealot_activated_ability_power_on_hit_buff.buffs[1].max_stacks = 10
BuffTemplates.victor_zealot_activated_ability_power_on_hit_buff.buffs[1].multiplier = 0.05

BuffTemplates.victor_zealot_activated_ability_cooldown_stack_on_hit.buffs[1].duration = 5
BuffTemplates.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.buffs[1].duration = 1
BuffTemplates.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.buffs[1].max_stacks = 10
BuffTemplates.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.buffs[1].multiplier = 0.1
--Talent List
TalentTrees.witch_hunter[1] = {
		{
			"victor_zealot_reaper",
			"victor_zealot_bloodlust_2",
			"victor_zealot_heal_share"
		},
		{
			"victor_zealot_attack_speed_on_health_percent",
			"victor_zealot_crit_count",
			"victor_zealot_power"
		},
		{
			"victor_zealot_smiter_unbalance",
			"victor_zealot_linesman_unbalance",
			"victor_zealot_power_level_unbalance"
		},
		{
			"victor_zealot_passive_move_speed",
			"victor_zealot_passive_healing_received",
			"victor_zealot_passive_damage_taken"
		},
		{
			"victor_zealot_move_speed_on_damage_taken",
			"victor_zealot_max_stamina_on_damage_taken",
			"victor_zealot_reduced_damage_taken"
		},
		{
			"victor_zealot_activated_ability_power_on_hit",
			"victor_zealot_activated_ability_ignore_death",
			"victor_zealot_activated_ability_cooldown_stack_on_hit"
		}
}
--////////////Warrior Priest\\\\\\\\\\\\\\
CareerSettings.wh_priest.attributes.max_hp = 150 --150
BuffTemplates.victor_priest_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.victor_priest_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.25 --0.25
--Baseline Ult

ActivatedAbilitySettings.wh_priest[1].cooldown = 60 --70
--Passive List

--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.witch_hunter[4] = {
		{
			"victor_priest_vanguard",
			"victor_priest_reaper",
			"victor_priest_heal_share"
		},
		{
			"victor_priest_2_1",
			"victor_priest_2_2",
			"victor_priest_2_3"
		},
		{
			"victor_priest_3_1",
			"victor_priest_3_2",
			"victor_priest_3_3"
		},
		{
			"victor_priest_4_1",
			"victor_priest_4_2",
			"victor_priest_4_3"
		},
		{
			"victor_priest_5_1",
			"victor_priest_5_2",
			"victor_priest_5_3"
		},
		{
			"victor_priest_6_1",
			"victor_priest_6_2",
			"victor_priest_6_3"
		}
	}
mod:echo("VS C")
----------------------------------------------------------SIENNA--------------------------------------------------------------------------------------------
--////////////Battle Wizard\\\\\\\\\\\\\\
CareerSettings.bw_adept.attributes.max_hp = 125 --100
BuffTemplates.sienna_adept_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.sienna_adept_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.5 --0.5
--Baseline Ult

ActivatedAbilitySettings.bw_2[1].cooldown = 45 --40
--Passive List
PassiveAbilitySettings.bw_2.buffs = {
			"sienna_adept_passive",
			"sienna_adept_passive_reset_on_spell_used",
			"sienna_adept_passive_overcharge_charge_speed_increased",
			"sienna_adept_passive_ranged_damage",
			"sienna_scholar_overcharge_no_slow", --new
			"sienna_adept_ability_cooldown_on_hit",
			"sienna_adept_ability_cooldown_on_damage_taken"
}
--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.bright_wizard[2] = {
		{
			"sienna_adept_vanguard",
			"sienna_adept_bloodlust_2",
			"sienna_adept_heal_share"
		},
		{
			"sienna_adept_power_level_on_full_charge",
			"sienna_adept_increased_burn_damage_reduced_non_burn_damage",
			"sienna_adept_infinite_burn"
		},
		{
			"sienna_adept_tank_unbalance",
			"sienna_adept_smiter_unbalance",
			"sienna_adept_power_level_unbalance"
		},
		{
			"sienna_adept_passive_cooldown",
			"sienna_adept_passive_charge_speed_increased",
			"sienna_adept_passive_improved"
		},
		{
			"sienna_adept_damage_reduction_on_ignited_enemy",
			"sienna_adept_cooldown_reduction_on_burning_enemy_killed",
			"sienna_adept_attack_speed_on_enemies_hit"
		},
		{
			"sienna_adept_activated_ability_cooldown",
			"sienna_adept_activated_ability_explosion",
			"sienna_adept_ability_trail_double"
		}
}
--////////////Pyromancer\\\\\\\\\\\\\\
CareerSettings.bw_scholar.attributes.max_hp = 125 --100
BuffTemplates.sienna_scholar_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.sienna_scholar_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.3 --0.3
--Baseline Ult
DamageProfileTemplates.fire_spear_trueflight = {
	charge_value = "projectile",
	no_stagger_damage_reduction_ranged = true,
	is_explosion = true,
	critical_strike = {
		attack_armor_power_modifer = {
			4,
			2.5,
			3,
			0.001,
			3,
			2.6
		},
		impact_armor_power_modifer = {
			1,
			1.5,
			100,
			0.25,
			1,
			0.75
		}
	},
	armor_modifier_near = {
		attack = {
			4,
			2.6,
			3,
			0.001,
			3,
			2.6
		},
		impact = {
			1,
			1.5,
			100,
			0,
			1,
			0.75
		}
	},
	armor_modifier_far = {
		attack = {
			4,
			2.6,
			3,
			0.001,
			3,
			2.6
		},
		impact = {
			1,
			1.5,
			100,
			0,
			1,
			0.75
		}
	},
	cleave_distribution = {
		attack = 0.75,
		impact = 0.75
	},
	default_target = {
		boost_curve_coefficient_headshot = 2.5,
		boost_curve_type = "ninja_curve",
		boost_curve_coefficient = 0.75,
		attack_template = "wizard_staff_spear",
		power_distribution_near = {
			attack = 0.75,
			impact = 1
		},
		power_distribution_far = {
			attack = 0.75,
			impact = 1
		},
		range_dropoff_settings = sniper_dropoff_ranges
	}
}
Weapons.sienna_scholar_career_skill_weapon.actions.action_career_release.default.speed = 9000
ActivatedAbilitySettings.bw_1[1].cooldown = 60 --60
--Passive List
PassiveAbilitySettings.bw_1.buffs = {
			"sienna_scholar_passive",
			"sienna_scholar_passive_ranged_damage",
			"sienna_scholar_overcharge_no_slow", --new
			"sienna_scholar_ability_cooldown_on_hit",
			"sienna_scholar_ability_cooldown_on_damage_taken"
}
--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30


--Talent List
TalentTrees.bright_wizard[1] = {
		{
			"sienna_scholar_reaper",
			"sienna_scholar_bloodlust_2",
			"sienna_scholar_heal_share"
		},
		{
			"sienna_scholar_ranged_power_ascending_descending",
			"sienna_scholar_increased_attack_speed",
			"sienna_scholar_crit_chance_above_health_threshold"
		},
		{
			"sienna_scholar_smiter_unbalance",
			"sienna_scholar_linesman_unbalance",
			"sienna_scholar_power_level_unbalance"
		},
		{
			"sienna_scholar_passive_overcharge_pause_on_special_kill",
			"sienna_scholar_passive_increased_power_level_on_high_overcharge",
			"sienna_scholar_passive_increased_attack_speed_from_overcharge"
		},
		{
			"sienna_scholar_damage_taken_on_elite_or_special_kill",
			"sienna_scholar_overcharge_no_slow",
			"sienna_scholar_move_speed_on_critical_hit"
		},
		{
			"sienna_scholar_activated_ability_dump_overcharge",
			"sienna_scholar_activated_ability_heal",
			"sienna_scholar_activated_ability_crit_refresh_cooldown"
		}
}
--////////////Unchained\\\\\\\\\\\\\\
CareerSettings.bw_unchained.attributes.max_hp = 150 --0.25
BuffTemplates.sienna_unchained_ability_cooldown_on_hit.buffs[1].bonus = 0.25 --0.25
BuffTemplates.sienna_unchained_ability_cooldown_on_damage_taken.buffs[1].bonus = 0.5 --0.5
--Baseline Ult

ActivatedAbilitySettings.bw_3[1].cooldown = 90 --120
--Passive List
PassiveAbilitySettings.bw_3.buffs = {
			"sienna_unchained_passive",
			"sienna_unchained_passive_increased_melee_power_on_overcharge",
			"sienna_unchained_ability_cooldown_on_hit",
			"sienna_unchained_ability_cooldown_on_damage_taken"
}
--Passive Buffs


--Row 10


--Row 20


--Row 25


--Row 30

Talents.bright_wizard[50].icon = "sienna_unchained_max_overcharge"
--Talent List
TalentTrees.bright_wizard[3] = {
		{
			"sienna_unchained_vanguard",
			"sienna_unchained_reaper",
			"sienna_unchained_heal_share"
		},
		{
			"sienna_unchained_attack_speed_on_high_overcharge",
			"sienna_unchained_burn_push_2",
			"sienna_unchained_exploding_burning_enemies"
		},
		{
			"sienna_unchained_tank_unbalance",
			"sienna_unchained_linesman_unbalance",
			"sienna_unchained_power_level_unbalance"
		},
		{
			"sienna_unchained_overcharged_blocks",
			"sienna_unchained_increased_vent_speed",
			"sienna_unchained_reduced_damage_taken_after_venting_2"
		},
		{
			"sienna_unchained_burning_enemies_reduced_damage",
			"sienna_unchained_health_to_ult",
			"sienna_unchained_reduced_overcharge"
		},
		{
			"sienna_unchained_activated_ability_power_on_enemies_hit",
			"sienna_unchained_activated_ability_fire_aura",
			"sienna_unchained_activated_ability_temp_health"
		}
}

mod:echo("SF C")
------------------------------------------------------Name/Description Changes for Talents and Passives------------------------------------------------------
mod:hook(_G, "Localize", function(func, key, ...)
--Kruber
	if key == "career_passive_desc_es_3b" then
		return "Enemy mass is reduced by 25%."
	end
	if key == "career_passive_desc_es_3a" then
		return "Hitting 3 enemies in one swing increases Attack Speed by 10% for 7.5 seconds."
	end
	if key == "markus_mercenary_increased_damage_on_enemy_proximity_desc" then
		return "Increases Power by 3%% for every nearby enemy within 5u. Stacks up to 5 times."
	end
	if key == "markus_mercenary_passive_power_level_on_proc_desc" then
		return "Increases Power by 20%% for 7.5 seconds when Paced Strikes is active."
	end
	if key == "markus_mercenary_passive_improved_desc" then
		return "Increases Attack Speed by 30%% for 15 seconds when Paced Strikes is active."
	end
	if key == "markus_mercenary_passive_group_proc_desc" then
		return "Increases Attack Speed by 10%% for 7.5 seconds for Allies when Paced Strikes is active."
	end
	if key == "markus_mercenary_passive_defence_on_proc_desc" then
		return "Reduces Damage Taken by 25%% for 7.5 seconds when Paced Strikes is active."
	end
	if key == "career_passive_desc_es_2a_2" then
		return "Aura that reduces damage taken by 15%. Range 5u. "
	end
	if key == "career_passive_name_es_2b" then
		return "No Guts, No Glory"
	end
	if key == "career_passive_desc_es_2b_2" then
		return "Reduces damage taken by 10%. Stacks additively with Protective Presence."
	end
	if key == "career_passive_name_es_2c" then
		return "Taal's Fortitude"
	end
	if key == "career_passive_desc_es_2c_2" then
		return "Grants an extra Stamina Shield."
	end
	if key == "markus_knight_power_level_on_stagger_elite_desc" then
		return "Staggering an elite enemy Increases Power by 15%% for 15 seconds."
	end
	if key == "markus_knight_attack_speed_on_push_desc" then
		return "Pushing an enemy Increases Attack Speed by 15%% for 5 seconds."
	end
--Bardin
	if key == "bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc" then
		return "Drake Fire damage increases from -80%% to 120%% and ranged attack speed increases reduces from 100%% to -50%% depending on Overcharge."
	end
	if key == "bardin_ironbreaker_power_on_nearby_allies_desc" then
		return "Increases Power by 10%% for every nearby ally within 5u."
	end
	if key == "bardin_ironbreaker_rising_attack_speed_desc" then
		return "Every 2 seconds generates a stack of Rising Anger. When Gromril is active Increases Attack Speed by 2%%, if lost Increases Attack Speed by 4%% for 10 seconds. Stacks up to 5 times."
	end
	if key == "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina_desc" then
		return "Killing enemies with melee kills while on full stamina reduces the CD of Impenetrable by 1%%."
	end
	if key == "bardin_engineer_armor_piercing_ability" then
		return "(Mk III) - 'Flak Cannon'"
	end
	if key == "bardin_engineer_armor_piercing_ability_desc" then
		return "Heavily Increases Damage, and Armor Penetration of the Steam-Assisted Crank Gun at the cost of Rate of Fire and Ammo Cost."
	end
	if key == "bardin_engineer_increased_ability_bar" then
		return "(Mk V) - 'Mobile Turret'"
	end
	if key == "bardin_engineer_increased_ability_bar_desc" then
		return "Increases Ability Bar by 50%%. Killing a Special makes the Steam-Assisted Crank Gun not consume Ability bar for the next 4 seconds."
	end
--Kerillian
	if key == "career_passive_name_we_2" then
		return "The Dance of Seasons"
	end
	if key == "career_passive_desc_we_2a_2" then
		return "All Stamina Regen by the party is increased by 60%."
	end
	if key == "career_passive_name_we_2b" then
		return "Renewal"
	end
	if key == "career_passive_desc_we_2b_2" then
		return "Increased Healing Received by 50%."
	end
	if key == "career_passive_name_we_2c" then
		return "Oak Guard"
	end
	if key == "career_passive_desc_we_2c_2" then
		return "Grants an extra stamina shield."
	end
	if key == "career_passive_name_we_2d" then
		return "Ariel's Benison"
	end
	if key == "career_passive_desc_we_2d_2" then
		return "Increase Kerillian's revive speed by 50%. When Kerillian revives allies, she heals them for 20 health."
	end
	if key == "kerillian_maidenguard_power_level_on_unharmed_desc" then
		return "Not getting hit grants 20%% Power (5s CD if hit)."
	end
--Saltzpyre
	if key == "career_passive_name_wh_3b" then
		return "Resolute Purpose"
	end
	if key == "career_passive_desc_wh_3b" then
		return "Increases Healing Recieved by 30%"
	end
	if key == "career_passive_name_wh_3c" then
		return "Eternal Guard"
	end
	if key == "career_passive_desc_wh_3c" then
		return "Grants an extra Stamina shield."
	end
	if key == "career_passive_name_wh_3d" then
		return "Suffer no Heresy"
	end
	if key == "career_passive_desc_wh_3d" then
		return "Increased Crit Chance by 5%."
	end
	if key == "victor_witchhunter_headshot_damage_increase_desc_2" then
		return "Increases Headshot Damage Bonus by 75%%."
	end
	if key == "career_active_name_wh_1" then
		return "Divine Hate"
	end
	if key == "career_active_desc_wh_1" then
		return "Saltzpyre charges forward and gains 50% increased Power and Phasewalking for 5 seconds. Can't be refreshed while Active."
	end
	if key == "victor_zealot_activated_ability_power_on_hit_desc" then
		return "Attacks during Divine Hate increase Power by 5%% for 5 seconds. Stacks up to 10 Times."
	end
	if key == "victor_zealot_activated_ability_ignore_death_desc" then
		return "Health can't be reduced below 1 for the duration of Divine Hate. Can't be refreshed while Active."
	end
	if key == "victor_zealot_activated_ability_cooldown_stack_on_hit_desc" then
		return "Attacks during Divine Hate reduces it's CD by 10%% after 1 seconds. Stacks up to 10 Times."
	end
--Sienna
	return func(key, ...)
end)
mod:echo("LC C")

--------------------------------------------------------------Functions List----------------------------------------------------------------------------------
--Function Merc Passive
ProcFunctions.gain_markus_mercenary_passive_proc = function (player, buff, params)
		if not Managers.state.network.is_server then
			return
		end

		local player_unit = player.player_unit
		local owner_unit = player_unit
		local buff_template = buff.template
		local target_number = params[4]
		local attack_type = params[2]
		local buff_to_add = buff_template.buff_to_add
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_applied = true

		if Unit.alive(player_unit) and target_number and buff_template.targets <= target_number and (attack_type == "light_attack" or attack_type == "heavy_attack") then
			local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

			if talent_extension:has_talent("markus_mercenary_passive_improved", "empire_soldier", true) then
				if target_number >= 3 then
					buff_system:add_buff(player_unit, "markus_mercenary_passive_improved", owner_unit, false)
				else
					buff_applied = false
				end
			elseif talent_extension:has_talent("markus_mercenary_passive_group_proc", "empire_soldier", true) then
				local side = Managers.state.side.side_by_unit[player_unit]
				local player_and_bot_units = side.PLAYER_AND_BOT_UNITS
				local num_units = #player_and_bot_units

				for i = 1, num_units, 1 do
					local unit = player_and_bot_units[i]

					if Unit.alive(unit) then
						buff_system:add_buff(unit, buff_to_add, owner_unit, false)
					end
				end
			elseif talent_extension:has_talent("markus_mercenary_passive_power_level_on_proc", "empire_soldier", true) then
				buff_system:add_buff(player_unit, "markus_mercenary_passive_power_level", owner_unit, false)
				buff_system:add_buff(player_unit, buff_to_add, owner_unit, false)
			else
				buff_system:add_buff(player_unit, buff_to_add, owner_unit, false)
			end

			if talent_extension:has_talent("markus_mercenary_passive_defence_on_proc", "empire_soldier", true) and buff_applied then
				buff_system:add_buff(player_unit, "markus_mercenary_passive_defence", owner_unit, false)
			end
		end
	end
--Function Huntsman Ult
CareerAbilityESHuntsman._run_ability = function (self, skip_cooldown)
	local owner_unit = self.owner_unit
	local is_server = self.is_server
	local local_player = self.local_player
	local bot_player = self.bot_player
	local network_manager = self.network_manager
	local network_transmit = network_manager.network_transmit
	local inventory_extension = self._inventory_extension
	local buff_extension = self._buff_extension
	local career_extension = self._career_extension
	local talent_extension = ScriptUnit.extension(owner_unit, "talent_system")
	local server_buff_names = {
		"markus_huntsman_activated_ability",
		"markus_huntsman_activated_ability_headshot_multiplier"
	}
	local local_buff_names = {}

	if talent_extension:has_talent("markus_huntsman_activated_ability_improved_stealth") then
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom",
			"markus_huntsman_activated_ability_increased_reload_speed",
		}
	elseif talent_extension:has_talent("markus_huntsman_activated_ability_duration") then
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom_duration",
			"markus_huntsman_activated_ability_increased_reload_speed_duration",
			"markus_huntsman_end_activated_on_ranged_hit_duration",
			"markus_huntsman_end_activated_on_melee_hit_duration"
		}
		server_buff_names = {
			"markus_huntsman_activated_ability_duration",
			"markus_huntsman_activated_ability_headshot_multiplier_duration"
		}
	else
		local_buff_names = {
			"markus_huntsman_activated_ability_increased_zoom",
			"markus_huntsman_activated_ability_increased_reload_speed",
			"markus_huntsman_end_activated_on_ranged_hit",
			"markus_huntsman_end_activated_on_melee_hit"
		}
		server_buff_names = {
			"markus_huntsman_activated_ability",
			"markus_huntsman_activated_ability_headshot_multiplier"
		}
	end

	local unit_object_id = network_manager:unit_game_object_id(owner_unit)

	for _, buff_name in ipairs(server_buff_names) do
		local buff_template_name_id = NetworkLookup.buff_templates[buff_name]

		if is_server then
			buff_extension:add_buff(buff_name, {
				attacker_unit = owner_unit
			})
			network_transmit:send_rpc_clients("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, false)
		else
			network_transmit:send_rpc_server("rpc_add_buff", unit_object_id, buff_template_name_id, unit_object_id, 0, true)
		end
	end

	for _, buff_name in ipairs(local_buff_names) do
		buff_extension:add_buff(buff_name, {
			attacker_unit = owner_unit
		})
	end

	if talent_extension:has_talent("markus_huntsman_activated_ability_cooldown_2") then
		local reference_buff = buff_extension:get_non_stacking_buff("markus_huntsman_passive")
		local max_stacks = reference_buff.template.max_sub_buff_stacks

		if not reference_buff.buff_list then
			reference_buff.buff_list = {}
		end

		for i = 1, max_stacks, 1 do
			if max_stacks > #reference_buff.buff_list then
				table.insert(reference_buff.buff_list, buff_extension:add_buff("markus_huntsman_auto_headshot"))
			end
		end
	end

	local weapon_slot = "slot_ranged"
	local slot_data = inventory_extension:get_slot_data(weapon_slot)
	local right_unit_1p = slot_data.right_unit_1p
	local left_unit_1p = slot_data.left_unit_1p
	local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
	local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
	local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

	if ammo_extension then
		local clip_size = ammo_extension:clip_size()
		local ammo_count = ammo_extension:ammo_count()
		local reserve_ammo = ammo_extension:remaining_ammo()
		local clip_empty = ammo_count == 0
		local clip_full = ammo_count == clip_size
		local instant_ammo = 0

		if clip_empty then
			instant_ammo = clip_size
		elseif clip_full then
			if reserve_ammo == 0 then
				instant_ammo = clip_size
			elseif reserve_ammo < clip_size then
				instant_ammo = clip_size - reserve_ammo
			end
		elseif reserve_ammo == 0 then
			instant_ammo = clip_size - ammo_count + clip_size
		elseif reserve_ammo < clip_size then
			instant_ammo = clip_size - ammo_count + clip_size - reserve_ammo
		else
			instant_ammo = clip_size - ammo_count
		end

		ammo_extension:add_ammo_to_reserve(instant_ammo)

		if ammo_extension:can_reload() then
			if clip_empty then
				ammo_extension:start_reload(true)
			else
				ammo_extension:instant_reload(false, "reload")
			end
		end
	end

	if local_player then
		local first_person_extension = self._first_person_extension

		first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_enter")
		first_person_extension:play_hud_sound_event("Play_career_ability_markus_huntsman_loop")
		first_person_extension:animation_event("shade_stealth_ability")
		career_extension:set_state("markus_activate_huntsman")

		MOOD_BLACKBOARD.skill_huntsman_surge = false
		MOOD_BLACKBOARD.skill_huntsman_stealth = true
	end

	if local_player or (is_server and bot_player) then
		local status_extension = self._status_extension

		status_extension:set_invisible(true)

		local events = {
			"Play_career_ability_markus_huntsman_enter",
			"Play_career_ability_markus_huntsman_loop_husk"
		}
		local unit_id = network_manager:unit_game_object_id(owner_unit)
		local node_id = 0

		for _, event in ipairs(events) do
			local event_id = NetworkLookup.sound_events[event]

			if is_server then
				network_transmit:send_rpc_clients("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
			else
				network_transmit:send_rpc_server("rpc_play_husk_unit_sound_event", unit_id, node_id, event_id)
			end
		end
	end

	if not skip_cooldown then
		career_extension:start_activated_ability_cooldown()
	end

	self:_play_vo()
end
--Function Kerillian Piercing Shot Reset
ProcFunctions.kerillian_waywatcher_reduce_activated_ability_cooldown = function (player, buff, params)
		local player_unit = player.player_unit

		if Unit.alive(player_unit) then
			local hit_zone = params[3]
			local target_number = params[4]
			local buff_type = params[5]

			if target_number then
				buff.can_trigger = true
			end

			if buff.can_trigger and buff_type == "RANGED_ABILITY" and (hit_zone == "head" or hit_zone == "neck") then
				local career_extension = ScriptUnit.extension(player_unit, "career_system")

				career_extension:reduce_activated_ability_cooldown_percent(buff.multiplier)

				buff.can_trigger = false
			end
		end
	end
--Function BH Double Shot Reset
ProcFunctions.victor_bounty_hunter_reduce_activated_ability_cooldown_railgun = function (player, buff, params)
		local player_unit = player.player_unit

		if ALIVE[player_unit] then
			local hit_zone = params[3]
			local target_number = params[4]
			local buff_type = params[5]

			if target_number then
				buff.can_trigger = true
			end

			if buff.can_trigger and buff_type == "RANGED_ABILITY" and (hit_zone == "head" or hit_zone == "neck") then
				local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
				local buff_to_add = buff.template.buff_to_add

				buff_extension:add_buff(buff_to_add)

				buff.can_trigger = false
			end
		end
	end
mod:echo("FC C")