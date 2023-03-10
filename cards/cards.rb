# frozen_string_literal: true

require_relative 'card'

class Cards < Array
  include Comparable

  def <=>(other)
    self_points = points
    other_points = other.points

    best = best_points([self_points, other_points])

    return -1 if best == other_points
    return 0 if self_points == other_points
    return 1 if best == self_points
  end

  def aces
    select(&:ace?)
  end

  def others
    reject(&:ace?)
  end

  def win_points
    21
  end

  def points
    aces_values = aces.map(&:values)
    sum = others.map(&:first_value).sum

    if aces_values.length.zero?
      sum
    else
      points_multiple_aces(aces_values, sum)
    end
  end

  def best_points(points_array)
    more, less = points_array.partition { |points| points > win_points }
    [more.min, less.max].min
  end

  def points_multiple_aces(aces_values, sum)
    values = aces_values.dup
    combinations = values.shift
    values.each { |value| combinations = combinations.product(value) }

    combinations.map! { |combination| combination.flatten.sum + sum }
    best_points(combinations)
  end
end
