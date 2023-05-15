function GetCannonTable(name)
    return global.forces_ion_cannon_table[name]
end

function GetCannonTableFromForce(force)
    return global.forces_ion_cannon_table[force.name]
end

function NewCannonTableForForce(force)
    global.forces_ion_cannon_table[force.name] = {}
end
