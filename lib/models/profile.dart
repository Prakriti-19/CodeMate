class Profile {
  final String uid;
  final String gender;
  final String email;
  final String name;
  final String cc_rank;
  final int he_rank;
  final int apk_points;
  final String interests;
  final String pno;
  Profile(
      {
        required this.gender,
        required this.email,
        required this.uid,
        required this.name,
        required this.cc_rank,
        required this.he_rank,
        required this.apk_points,
        required this.interests,
        required this.pno
      });
}
