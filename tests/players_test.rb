# multiliner_test.rb
require 'minitest/autorun'
require './players'

class TestPlayers < Minitest::Test
  def setup
    @players = [
      { player: 'abercda01', year: '1871', stint: '1', team: 'Troy Haymakers', AB: '4', H: '0' },
      { player: 'abercda01', year: '1871', stint: '1', team: 'Rockford Forest Citys', AB: '118', H: '32' },
      { player: 'allisar01', year: '1872', stint: '1', team: 'Cleveland Forest Citys', AB: '137', H: '40' }
    ]
  end

  def test_that_data_calculate_ab_for_user_during_year
    actual_result = Players.new(@players, {}).statistics
    # 4 + 118 = 122
    # 0 + 32 = 32
    # 32 / 122 = 0.262
    assert_equal actual_result[0][:BA], 0.262
  end

  def test_that_we_have_two_names_in_team_attribute
    actual_result = Players.new(@players, {}).statistics
    assert_equal actual_result[0][:team], 'Troy Haymakers, Rockford Forest Citys'
  end

  def test_that_filtered_by_year
    actual_result = Players.new(@players, { year: 1871 }).statistics
    assert_equal actual_result.size, 1
  end

  def test_that_filtered_by_team_name
    actual_result = Players.new(@players, { team: 'Cleveland Forest Citys' }).statistics
    assert_equal actual_result.size, 1
  end

  def test_that_filtered_by_team_name_and_year
    actual_result = Players.new(@players, { year: 1872, team: 'Cleveland Forest Citys' }).statistics
    assert_equal actual_result.size, 1

    actual_result = Players.new(@players, { year: 1871, team: 'Cleveland Forest Citys' }).statistics
    assert_equal actual_result.size, 0
  end
end
