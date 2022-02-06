// ignore_for_file: unnecessary_this

class TournamentsResponse {
  late int? code;
  late Data? data;
  late bool? success;

  TournamentsResponse(
      {required this.code, required this.data, required this.success});

  TournamentsResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  late String? cursor;
  late int? tournamentCount;
  late List<Tournaments>? tournaments;
  late bool? isLastBatch;

  Data(
      {required this.cursor,
      required this.tournamentCount,
      required this.tournaments,
      required this.isLastBatch});

  Data.fromJson(Map<String, dynamic> json) {
    cursor = json['cursor'];
    tournamentCount = json['tournament_count'];
    if (json['tournaments'] != null) {
      tournaments = [];
      json['tournaments'].forEach((v) {
        tournaments?.add(Tournaments.fromJson(v));
      });
    }
    isLastBatch = json['is_last_batch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cursor'] = this.cursor;
    data['tournament_count'] = this.tournamentCount;
    if (this.tournaments != null) {
      data['tournaments'] = this.tournaments?.map((v) => v.toJson()).toList();
    }
    data['is_last_batch'] = this.isLastBatch;
    return data;
  }
}

class Tournaments {
  late bool? isCheckInRequired;
  late String? tournamentId;
  late bool? tournamentEnded;
  late String? tournamentEndDate;
  late bool? areRandomTeamsAllowed;
  late String? adminLocale;
  late String? regEndDate;
  late String? startDate;
  late String? rules;
  late int? maxTeams;
  late String? tournamentUrl;
  late String? prizes;
  late String? matchStyleType;
  late String? pwaUrl;
  late String? tournamentType;
  late String? geo;
  late String? maxLevelId;
  late bool? isPasswordRequired;
  late String? name;
  late String? matchStyle;
  late String? registrationUrl;
  late String? gamePkg;
  late bool? isRegistrationOpen;
  late bool? isWaitlistEnabled;
  late bool? incompleteTeamsAllowed;
  late bool? isAutoResultAllowed;
  late int? teamSize;
  late String? status;
  late bool? isLevelsEnabled;
  late bool? indexPage;
  late String? dynamicAppUrl;
  late String? minLevelId;
  late String? gameFormat;
  late String? details;
  late String? gameIconUrl;
  late String? regStartDate;
  late String? coverUrl;
  late String? bracketsUrl;
  late String? tournamentSlug;
  late String? discordUrl;
  late String? gameId;
  late bool? resultSubmissionByAdmin;
  late String? country;
  late String? adminUsername;
  late String? gameName;
  late String? streamUrl;
  late int? winnersCount;

  Tournaments(
      {required this.isCheckInRequired,
      required this.tournamentId,
      required this.tournamentEnded,
      required this.tournamentEndDate,
      required this.areRandomTeamsAllowed,
      required this.adminLocale,
      required this.regEndDate,
      required this.startDate,
      required this.rules,
      required this.maxTeams,
      required this.tournamentUrl,
      required this.prizes,
      required this.matchStyleType,
      required this.pwaUrl,
      required this.tournamentType,
      required this.geo,
      required this.maxLevelId,
      required this.isPasswordRequired,
      required this.name,
      required this.matchStyle,
      required this.registrationUrl,
      required this.gamePkg,
      required this.isRegistrationOpen,
      required this.isWaitlistEnabled,
      required this.incompleteTeamsAllowed,
      required this.isAutoResultAllowed,
      required this.teamSize,
      required this.status,
      required this.isLevelsEnabled,
      required this.indexPage,
      required this.dynamicAppUrl,
      required this.minLevelId,
      required this.gameFormat,
      required this.details,
      required this.gameIconUrl,
      required this.regStartDate,
      required this.coverUrl,
      required this.bracketsUrl,
      required this.tournamentSlug,
      required this.discordUrl,
      required this.gameId,
      required this.resultSubmissionByAdmin,
      required this.country,
      required this.adminUsername,
      required this.gameName,
      required this.streamUrl,
      required this.winnersCount});

  Tournaments.fromJson(Map<String, dynamic> json) {
    isCheckInRequired = json['is_check_in_required'];
    tournamentId = json['tournament_id'];
    tournamentEnded = json['tournament_ended'];
    tournamentEndDate = json['tournament_end_date'];
    areRandomTeamsAllowed = json['are_random_teams_allowed'];
    adminLocale = json['admin_locale'];
    regEndDate = json['reg_end_date'];
    startDate = json['start_date'];
    rules = json['rules'];
    maxTeams = json['max_teams'];
    tournamentUrl = json['tournament_url'];
    prizes = json['prizes'];
    matchStyleType = json['match_style_type'];
    pwaUrl = json['pwa_url'];
    tournamentType = json['tournament_type'];
    geo = json['geo'];
    maxLevelId = json['max_level_id'];
    isPasswordRequired = json['is_password_required'];
    name = json['name'];
    matchStyle = json['match_style'];
    registrationUrl = json['registration_url'];
    gamePkg = json['game_pkg'];
    isRegistrationOpen = json['is_registration_open'];
    isWaitlistEnabled = json['is_waitlist_enabled'];
    incompleteTeamsAllowed = json['incomplete_teams_allowed'];
    isAutoResultAllowed = json['is_auto_result_allowed'];
    teamSize = json['team_size'];
    status = json['status'];
    isLevelsEnabled = json['is_levels_enabled'];
    indexPage = json['index_page'];
    dynamicAppUrl = json['dynamic_app_url'];
    minLevelId = json['min_level_id'];
    gameFormat = json['game_format'];
    details = json['details'];
    gameIconUrl = json['game_icon_url'];
    regStartDate = json['reg_start_date'];
    coverUrl = json['cover_url'];
    bracketsUrl = json['brackets_url'];
    tournamentSlug = json['tournament_slug'];
    discordUrl = json['discord_url'];
    gameId = json['game_id'];
    resultSubmissionByAdmin = json['result_submission_by_admin'];
    country = json['country'];
    adminUsername = json['admin_username'];
    gameName = json['game_name'];
    streamUrl = json['stream_url'];
    winnersCount = json['winners_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_check_in_required'] = this.isCheckInRequired;
    data['tournament_id'] = this.tournamentId;
    data['tournament_ended'] = this.tournamentEnded;
    data['tournament_end_date'] = this.tournamentEndDate;
    data['are_random_teams_allowed'] = this.areRandomTeamsAllowed;
    data['admin_locale'] = this.adminLocale;
    data['reg_end_date'] = this.regEndDate;
    data['start_date'] = this.startDate;
    data['rules'] = this.rules;
    data['max_teams'] = this.maxTeams;
    data['tournament_url'] = this.tournamentUrl;
    data['prizes'] = this.prizes;
    data['match_style_type'] = this.matchStyleType;
    data['pwa_url'] = this.pwaUrl;
    data['tournament_type'] = this.tournamentType;
    data['geo'] = this.geo;
    data['max_level_id'] = this.maxLevelId;
    data['is_password_required'] = this.isPasswordRequired;
    data['name'] = this.name;
    data['match_style'] = this.matchStyle;
    data['registration_url'] = this.registrationUrl;
    data['game_pkg'] = this.gamePkg;
    data['is_registration_open'] = this.isRegistrationOpen;
    data['is_waitlist_enabled'] = this.isWaitlistEnabled;
    data['incomplete_teams_allowed'] = this.incompleteTeamsAllowed;
    data['is_auto_result_allowed'] = this.isAutoResultAllowed;
    data['team_size'] = this.teamSize;
    data['status'] = this.status;
    data['is_levels_enabled'] = this.isLevelsEnabled;
    data['index_page'] = this.indexPage;
    data['dynamic_app_url'] = this.dynamicAppUrl;
    data['min_level_id'] = this.minLevelId;
    data['game_format'] = this.gameFormat;
    data['details'] = this.details;
    data['game_icon_url'] = this.gameIconUrl;
    data['reg_start_date'] = this.regStartDate;
    data['cover_url'] = this.coverUrl;
    data['brackets_url'] = this.bracketsUrl;
    data['tournament_slug'] = this.tournamentSlug;
    data['discord_url'] = this.discordUrl;
    data['game_id'] = this.gameId;
    data['result_submission_by_admin'] = this.resultSubmissionByAdmin;
    data['country'] = this.country;
    data['admin_username'] = this.adminUsername;
    data['game_name'] = this.gameName;
    data['stream_url'] = this.streamUrl;
    data['winners_count'] = this.winnersCount;
    return data;
  }
}
