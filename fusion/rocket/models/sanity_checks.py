#!/usr/bin/env python3
"""Illustrative algebra for Crockett Stardrive concept; NOT a validated simulator.

Outputs depend entirely on chosen hypothetical inputs and should never be
interpreted as measured reactor, radiator, thruster or spacecraft performance.
"""
from math import pi
SIGMA = 5.670374419e-8  # W m^-2 K^-4
G0 = 9.80665 # m/s^2

def radiating_area(waste_heat_w, temperature_k, emissivity=0.9, background_k=3.0):
    return waste_heat_w/(emissivity*SIGMA*(temperature_k**4-background_k**4))

def electric_thrust(power_w, kinetic_efficiency, exhaust_speed_ms):
    return 2*kinetic_efficiency*power_w/exhaust_speed_ms

if __name__ == '__main__':
    terrestrial_only = {'source_thermal_MW':500, 'source_blanket_fraction':0.8,
                        'source_assumed_conversion_efficiency':0.47,
                        'source_assumed_aux_MW':49}
    blanket_mw=terrestrial_only['source_thermal_MW']*terrestrial_only['source_blanket_fraction']
    print('GROUND SOURCE ONLY:')
    print(f'Blanket deposit from source projection: {blanket_mw:.0f} MW')
    print(f'Gross conversion of *only* blanket heat: {blanket_mw*.47:.0f} MW')
    print(f'Net after source-assumed 49 MW auxiliaries: {blanket_mw*.47-49:.0f} MW')
    print('Requires unproven reactor, cycle and thermal integration; NOT space power.')
    print('ILLUSTRATIVE RADIATOR ALGEBRA:')
    for temp in (600,900):
        print(f' 265 MW reject at {temp} K, eps=0.9: {radiating_area(265e6,temp):,.0f} m^2 effective emitting area')
    print('ILLUSTRATIVE ELECTRIC THRUSTER ALGEBRA:')
    print(f' 1 MW / 0.6 efficient / 30 km/s: {electric_thrust(1e6,.6,30e3):.1f} N, Isp={30e3/G0:.0f} s')
