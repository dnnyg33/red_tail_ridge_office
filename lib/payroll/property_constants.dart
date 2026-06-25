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
const A_118 = Unit(
  name: '118',
  propertyId: 127002,
  property: albany118_120,
  region: Albany,
  maxCleanTime: 120,);
const A_118Basement = Unit(
  name: 'BSMT- 118- B',
  propertyId: 126992,
  property: albany118_120,
  region: Albany,
  maxCleanTime: 75,
);
const A_120 = Unit(name: '120',
    propertyId: 126998,
  property: albany118_120,
  region: Albany,
  maxCleanTime: 120,);
const A_120Basement = Unit(
  name: 'BSMT-120B',
  propertyId: 126994,
  property: albany118_120,
  region: Albany,
  maxCleanTime: 75,
);
const A_FerryAdu = Unit(
  propertyId: 157752,
  name: 'Ferry Little House',
  property: ferry,
  region: Albany,
  maxCleanTime: 90,
);
const A_FerryBasement = Unit(
  name: 'Ferry Basement',
  propertyId: 127003,
  property: ferry,
  region: Albany,
  maxCleanTime: 90,
);
const A_FerryUpstairs = Unit(
  name: 'Ferry Upstairs',
  propertyId:127004,
  property: ferry,
  region: Albany,
  maxCleanTime: 180,
);

// Corvallis
const C_13thStreet = Unit(
  name: '13th Urban Rustic',
  propertyId: 127001,
  property: 'Corvallis 13th Street',
  region: Corvallis,
  maxCleanTime: 120,
);
const C_19thStreet = Unit(
  name: '19th St',
  propertyId: 127006,
  property: 'Corvallis 19th Street',
  region: Corvallis,
  maxCleanTime: 120,
);
const C_3rd = Unit(name: '3rd St',
    propertyId: 127005,
  property: third,
  region: Corvallis,
  maxCleanTime: 120,
);
const C_3rdBasement = Unit(
  propertyId: 127008,
  name: 'BSMT-3rd Basement',
  property: third,
  region: Corvallis,
  maxCleanTime: 75,
);
const C_Minnesota = Unit(
  propertyId: 126993,
  name: 'Minnesota',
  property: 'Corvallis Minnesota',
  region: Corvallis,
  maxCleanTime: 120,
);
const C_Taylor = Unit(
  name: 'Taylor Ave',
  propertyId: 127011,
  property: 'Corvallis Taylor',
  region: Corvallis,
  maxCleanTime: 120,

);
const C_Western = Unit(
  name: 'Western',
  propertyId: 182339,
  property: 'Corvallis Western',
  region: Corvallis,
  maxCleanTime: 120,

);

// Philomath
const P_Basement = Unit(
  name: 'Philomath Basement',
  property: ridge,
  propertyId: 126988,
  region: Philomath,
  maxCleanTime: 90,

);
const P_Loft = Unit(
  name: 'Philomath Loft',
  property: ridge,
  propertyId: 126995,
  region: Philomath,
  maxCleanTime: 60,

);
// const P_Ridge = Unit(
//   name: 'Philomath The Ridge',
//   property: ridge,
//   propertyId: ,
//   region: Philomath,
// );
const P_Adams = Unit(
  name: 'Adams',
  property: 'Philomath Adams',
  propertyId: 126999,
  region: Philomath,
  maxCleanTime: 120,

);
const P_MainSt = Unit(
  name: 'Main St',
  property: 'Philomath Main St',
  propertyId: 127010,
  region: Philomath,
  maxCleanTime: 120,

);
const P_Brian132 = Unit(
  name: 'Brian 132',
  property: albany118_120,
  propertyId: 127043,
  region: Albany,
  maxCleanTime: 120,

);
const GH_Holly3rd = Unit(
  name: 'GH- Holly 3rd',
  property: 'Holly 3rd',
  propertyId: 133510,
  region: Corvallis,
  maxCleanTime: 120,

); //TODO is this info correct
const GH_Kendall4550 = Unit(
  name: 'GH- Kendall 4550',
  property: 'Kendall 4550',
  propertyId: 148159,
  region: Philomath,
  maxCleanTime: 90,

);
const GH_OTHER = Unit(
  name: 'Ghost Host',
  property: 'Unknown',
  propertyId: 127045,
  region: Corvallis,
  maxCleanTime: 120,
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
  // P_Ridge,
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

final propertyById = <int, Unit>{
  for (final u in _allUnits) u.propertyId: u,
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
  // Unknown property (e.g. an id not in the map): fall back to the default.
  if (from == null || to == null) return 10;
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
    required this.propertyId,
    required this.property,
    required this.region,
    required this.maxCleanTime,
  });

  final String name;
  final int propertyId;
  final String property;
  final String region;
  final int maxCleanTime;

  //
  bool isSameProperty(Unit propertyB) {
    return property == propertyB.property;
  }

  bool isSameRegion(Unit propertyB) {
    return region == propertyB.region;
  }
}
