class Players
  def initialize(players, filters)
    @players = players
    @filters = filters
  end

  def statistics
    apply_filters(@players, @filters)

    generate_statistics(@players).sort_by! { |player| player[:BA] }
  end

  private

  def generate_statistics(data)
    statistics = []
    players = data.group_by { |row| [row[:player], row[:year]] }

    players.each do |player_year, attributes|
      player, year = player_year
      statistics << calculate_user_statistics(player, year, attributes)
    end

    statistics
  end

  def calculate_user_statistics(player, year, attributes)
    total_hits = attributes.map { |a| a[:H].to_f }.inject(:+)
    total_at_bats = attributes.map { |a| a[:AB].to_f }.inject(:+)
    batting_average = (total_hits / total_at_bats).round(3)

    {
      player: player,
      year: year,
      team: attributes.map { |t| t[:team] }.uniq.join(', '),
      BA: (batting_average.nan? ? 0 : batting_average)
    }
  end

  def apply_filters(data, filters)
    data.select! { |row| row[:year] == filters[:year].to_s } if filters[:year]
    data.select! { |row| row[:team] == filters[:team] } if filters[:team]
  end
end
