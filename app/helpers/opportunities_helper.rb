module OpportunitiesHelper
  def display_opp_interests(opportunity)
    votes = opportunity.votes_for.up.by_type('User')
    return list_interests(votes) if votes.size <= 8
    count_interests(votes)
  end

private

  def list_interests(votes)
    names = []
    unless votes.blank?
      votes.voters.each do |v|
        names.push(link_to v.name,
        user_path(v.id),
        class: 'name')
      end
      names.to_sentence.html_safe + interest_plural(votes)
    end
  end

  def count_interests(votes)
    vote_count = votes.size
    vote_count.to_s + ' are interested'
  end

  def interest_plural(votes)
    return ' are interested in this event' if votes.count > 1
    ' is interested in this event'
  end
end
