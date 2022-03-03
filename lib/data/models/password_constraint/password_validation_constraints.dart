class PasswordConstraintModel {
  final bool meetsLengthRequirement;
  final bool meetsUpperCaseRequirement;
  final bool meetsLowerCaseRequirement;
  final bool meetsNumberRequirement;

  factory PasswordConstraintModel.valid() {
    return PasswordConstraintModel(
      meetsLengthRequirement: true,
      meetsUpperCaseRequirement: true,
      meetsLowerCaseRequirement: true,
      meetsNumberRequirement: true,
    );
  }

  PasswordConstraintModel({
    this.meetsLengthRequirement = false,
    this.meetsUpperCaseRequirement = false,
    this.meetsLowerCaseRequirement = false,
    this.meetsNumberRequirement = false,
  });

  bool get isValid =>
      meetsLengthRequirement &&
      meetsUpperCaseRequirement &&
      meetsLowerCaseRequirement &&
      meetsNumberRequirement;
}
