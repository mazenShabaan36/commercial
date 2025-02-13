Map<String, dynamic> convertToMapStringDynamic(Map<dynamic, dynamic> map) {
  return map.map((key, value) {
    // Convert key to String
    final String stringKey = key.toString();

    // If the value is a Map, recursively convert it
    if (value is Map<dynamic, dynamic>) {
      return MapEntry(stringKey, convertToMapStringDynamic(value));
    }

    // If the value is a List, check if it contains Maps and convert them
    if (value is List<dynamic>) {
      return MapEntry(
        stringKey,
        value.map((e) {
          if (e is Map<dynamic, dynamic>) {
            return convertToMapStringDynamic(e);
          }
          return e;
        }).toList(),
      );
    }

    // Otherwise, return the value as is
    return MapEntry(stringKey, value);
  });
}
