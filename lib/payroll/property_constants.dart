//regions
const Albany = 'Albany';
const Corvallis = 'Corvallis';
const Philomath = 'Philomath';

//name of locations with multiple units/properties
const third = '3rd St';
const albany118_120 = 'Albany 108/120';
const ferry = 'Ferry';
const ridge = 'Ridge';

//properties (but really these are units)
// Albany
const A_118 = Unit(name: '118', property: albany118_120, region: Albany);
const A_118Basement = Unit(
  name: 'BSMT- 118- B',
  property: albany118_120,
  region: Albany,
);
const A_120 = Unit(name: '120', property: albany118_120, region: Albany);
const A_120Basement = Unit(
  name: 'BSMT-120B',
  property: albany118_120,
  region: Albany,
);
const A_FerryAdu = Unit(
  name: 'Ferry Little House',
  property: ferry,
  region: Albany,
);
const A_FerryBasement = Unit(
  name: 'Ferry Basement',
  property: ferry,
  region: Albany,
);
const A_FerryUpstairs = Unit(
  name: 'Ferry Upstairs',
  property: ferry,
  region: Albany,
);

// Corvallis
const C_13thStreet = Unit(
  name: '13th Urban Rustic',
  property: 'Corvallis 13th Street',
  region: Corvallis,
);
const C_19thStreet = Unit(
  name: '19th St',
  property: 'Corvallis 19th Street',
  region: Corvallis,
);
const C_3rd = Unit(name: '3rd St', property: third, region: Corvallis);
const C_3rdBasement = Unit(
    name: 'BSMT-3rd Basement', property: third, region: Corvallis);
const C_Minnesota = Unit(
  name: 'Minnesota',
  property: 'Corvallis Minnesota',
  region: Corvallis,
);
const C_Taylor = Unit(
  name: 'Taylor Ave',
  property: 'Corvallis Taylor',
  region: Corvallis,
);
const C_Western = Unit(
  name: 'Western',
  property: 'Corvallis Western',
  region: Corvallis,
);

// Philomath
const P_Basement = Unit(
  name: 'Philomath Basement',
  property: ridge,
  region: Philomath,
);
const P_Loft = Unit(
  name: 'Philomath Loft',
  property: ridge,
  region: Philomath,
);
const P_Ridge = Unit(
  name: 'Philomath The Ridge',
  property: ridge,
  region: Philomath,
);
const P_Adams = Unit(
  name: 'Adams',
  property: 'Philomath Adams',
  region: Philomath,
);
const P_MainSt = Unit(
  name: 'Main St',
  property: 'Philomath Main St',
  region: Philomath,
);
const P_Brian132 = Unit(
  name: 'Brian 132',
  property: albany118_120,
  region: Albany,
);
const GH_Holly3rd = Unit(
  name: 'GH- Holly 3rd',
  property: 'Holly 3rd',
  region: Corvallis,
); //TODO is this info correct
const GH_Kendall4550 = Unit(
  name: 'GH- Kendall 4550',
  property: 'Kendall 4550',
  region: Philomath,
);
const GH_OTHER = Unit(
  name: 'Ghost Host',
  property: 'Unknown',
  region: Corvallis,
);
// Skipped (region unclear): Brian 121/123/132, Ghost Host,
// GH- Holly 3rd, GH- Kendall 4550, GH- Dustin 4th.

const _allUnits = <Unit>[
  A_118,
  A_118Basement,
  A_120,
  A_120Basement,
  A_FerryAdu,
  A_FerryBasement,
  A_FerryUpstairs,
  C_13thStreet,
  C_19thStreet,
  C_3rd,
  C_3rdBasement,
  C_Minnesota,
  C_Taylor,
  C_Western,
  P_Basement,
  P_Loft,
  P_Ridge,
  P_Adams,
  P_MainSt,
  P_Brian132,
  GH_Holly3rd,
  GH_Kendall4550,
  GH_OTHER,
];

final propertyByName = <String, Unit>{
  for (final u in _allUnits) u.name: u,
};

/// Drive-time minutes for moving from one property to the next:
///   - same unit name → 0 minutes
///   - same location (different unit) → 1 minute
///   - Albany ↔ Philomath → 20 minutes
///   - any other different-region switch → 15 minutes
///   - both in Albany → 6 minutes
///   - otherwise (or unknown property) → 10 minutes
int driveTimeBetween(String fromName, String toName) {
  if (fromName == toName) return 0;
  final from = propertyByName[fromName];
  final to = propertyByName[toName];
  if (from == null) {
    throw ArgumentError.value('invalid property name $fromName');
  }
  if (to == null) {
    throw ArgumentError.value(
        'invalid property name $toName');
  }
  if (from.property == to.property) return 1;
  if (from.region != to.region) {
    final regions = {from.region, to.region};
    if (regions.containsAll({Albany, Philomath})) return 20;
    return 15;
  }
  if (from.region == Albany) return 6;
  return 10;
}

class Unit {
  const Unit({
    required this.name,
    required this.property,
    required this.region,
  });

  final String name;
  final String property;
  final String region;

  //
  bool isSameProperty(Unit propertyB) {
    return property == propertyB.property;
  }

  bool isSameRegion(Unit propertyB) {
    return region == propertyB.region;
  }
}
