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
const A_118 = Property(name: '118', location: albany118_120, region: Albany);
const A_118Basement = Property(
  name: 'BSMT- 118-B',
  location: albany118_120,
  region: Albany,
);
const A_120 = Property(name: '120', location: albany118_120, region: Albany);
const A_120Basement = Property(
  name: 'BSMT-120B',
  location: albany118_120,
  region: Albany,
);
const A_FerryAdu = Property(
  name: 'Ferry Little House',
  location: ferry,
  region: Albany,
);
const A_FerryBasement = Property(
  name: 'Ferry Basement',
  location: ferry,
  region: Albany,
);
const A_FerryUpstairs = Property(
  name: 'Ferry Upstairs',
  location: ferry,
  region: Albany,
);

// Corvallis
const C_13thStreet = Property(
  name: '13th Urban Rustic',
  location: 'Corvallis 13th Street',
  region: Corvallis,
);
const C_19thStreet = Property(
  name: '19th St',
  location: 'Corvallis 19th Street',
  region: Corvallis,
);
const C_3rd = Property(name: '3rd St', location: third, region: Corvallis);
const C_Minnesota = Property(
  name: 'Minnesota',
  location: 'Corvallis Minnesota',
  region: Corvallis,
);
const C_Taylor = Property(
  name: 'Taylor Ave',
  location: 'Corvallis Taylor',
  region: Corvallis,
);
const C_Western = Property(
  name: 'Western',
  location: 'Corvallis Western',
  region: Corvallis,
);

// Philomath
const P_Basement = Property(
  name: 'Philomath Basement',
  location: ridge,
  region: Philomath,
);
const P_Loft = Property(
  name: 'Philomath Loft',
  location: ridge,
  region: Philomath,
);
const P_Ridge = Property(
  name: 'Philomath The Ridge',
  location: ridge,
  region: Philomath,
);
const P_Adams = Property(
  name: 'Adams',
  location: 'Philomath Adams',
  region: Philomath,
);
const P_MainSt = Property(
  name: 'Main St',
  location: 'Philomath Main St',
  region: Philomath,
);
const P_Brian132 = Property(
  name: 'Brian 132',
  location: 'Philomath Adams',
  region: Philomath,
);
const GH_Holly3rd = Property(
  name: 'GH- Holly 3rd',
  location: 'Holly 3rd',
  region: Corvallis,
); //TODO is this info correct
const GH_Kendall4550 = Property(
  name: 'GH- Kendall 4550',
  location: 'Kendall 4550',
  region: Corvallis,
);
const GH_OTHER = Property(
  name: 'Ghost Host',
  location: 'Unknown',
  region: Corvallis,
);
// Skipped (region unclear): Brian 121/123/132, Ghost Host,
// GH- Holly 3rd, GH- Kendall 4550, GH- Dustin 4th.

class Property {
  const Property({
    required this.name,
    required this.location,
    required this.region,
  });

  final String name;
  final String location;
  final String region;

  //
  bool isSameLocation(Property propertyB) {
    return location == propertyB.location;
  }

  bool isSameRegion(Property propertyB) {
    return region == propertyB.region;
  }
}
