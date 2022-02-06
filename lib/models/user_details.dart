class UserDetails {
  late String ign;
  late String name;
  late int elo;
  late int tournamentsPlayed;
  late int tournamentsWon;
  late String winningPercentage;
  late String url;
  late int id;

  UserDetails({
    required this.id,
    required this.elo,
    required this.ign,
    required this.name,
    required this.tournamentsPlayed,
    required this.tournamentsWon,
    required this.winningPercentage,
    required this.url,
  });

  static UserDetails getUser(int id) {
    return users.firstWhere((user) => user.id == id);
  }

  //Used Local data to fetch login data
  static List<UserDetails> users = [
    UserDetails(
        id: 9898989898,
        elo: 2250,
        ign: "Olofmeister",
        name: "Olof Kajbjer",
        tournamentsPlayed: 34,
        tournamentsWon: 09,
        winningPercentage: "26%",
        url:
            "https://liquipedia.net/commons/images/thumb/8/80/Olofmeister_at_DH_Masters_Stockholm_2018.jpg/450px-Olofmeister_at_DH_Masters_Stockholm_2018.jpg"),
    UserDetails(
        id: 9876543210,
        elo: 3840,
        ign: "s1mple",
        name: "Aleksandr Kostilev",
        tournamentsPlayed: 58,
        tournamentsWon: 21,
        winningPercentage: "36%",
        url: "https://www.ginx.tv/uploads/s1mplemain.jpg"),
  ];
}
