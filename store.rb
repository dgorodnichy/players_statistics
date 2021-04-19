class Store
  PATH_TO_TEAMS_CSV = 'data/Teams.csv'.freeze

  def initialize(path_to_file)
    @path_to_file = path_to_file
  end

  def teams
    @teams ||= CSV.open(PATH_TO_TEAMS_CSV, headers: true, return_headers: false).map(&:to_h)
  end

  def team_names
    @team_names ||= teams.map do |team|
      { team['teamID'] => team['name'] }
    end.inject(:merge)
  end

  def players
    result = []
    CSV.foreach(@path_to_file, headers: true) do |row|
      result << {
        player: row['playerID'],
        year: row['yearID'],
        stint: row['stint'],
        team: team_names[row['teamID']],
        AB: row['AB'],
        H: row['H']
      }
    end
    result
  end
end
