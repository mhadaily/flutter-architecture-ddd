String getOfficialProductManufacturer(String productType) {
  switch (productType) {
    case 'variable':
      return 'Manufacturer number 1';
      break;
    case 'simple':
      return 'Manufacturer number 2';
      break;
    case 'external':
      return 'Manufacturer number 3';
      break;
    default:
      return 'Manufacturer Majid';
  }
}
