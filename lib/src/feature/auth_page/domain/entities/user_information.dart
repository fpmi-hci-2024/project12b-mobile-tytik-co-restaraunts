class UserInformation {
  final String name;
  final String address;

  const UserInformation({
    required this.name,
    required this.address,
  });

  const UserInformation.empty()
      : name = '',
        address = '';
}
