int paperFor(List<int> dimensions) {
  // Sort the dimensions so that the smallest face is in [0] and [1].
  dimensions.sort();
  // Calculate the area of the paper needed: each face: WxH, WxD, HxD, twice. Plus the smallest face.
  return ((2 * dimensions[0] * dimensions[1]) +
          (2 * dimensions[1] * dimensions[2]) +
          (2 * dimensions[0] * dimensions[2])) +
      (dimensions[0] * dimensions[1]);
}
