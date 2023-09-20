scoreboard players add #timer clothier.dummy 1 

# Send Blood Moon Data
execute unless score #blood_moon_phase_cache clothier.dummy = #sanguine.blood_moon.phase sanguine.dummy if score #sanguine.blood_moon.phase sanguine.dummy matches 1..2 run execute as @a[scores={svnet_connected=1}] run function clothier:send/blood_moon
execute unless score #blood_moon_phase_cache clothier.dummy matches 0 unless score #sanguine.blood_moon.phase sanguine.dummy matches 1..2 run execute as @a[scores={svnet_connected=1}] run function clothier:send/blood_moon

execute store result score #blood_moon_phase_cache clothier.dummy run scoreboard players get #sanguine.blood_moon.phase sanguine.dummy

# Send Sanity Data
execute if score #timer clothier.dummy matches 200.. run execute as @a[scores={svnet_connected=1}] run function clothier:send/sanity

execute if score #timer clothier.dummy matches 200.. run scoreboard players set #timer clothier.dummy 0
