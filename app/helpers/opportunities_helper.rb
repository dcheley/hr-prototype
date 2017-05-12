module OpportunitiesHelper
  def display_likes(opportunity)
    votes = opportunity.votes_for.up.by_type('User')
    return list_likers(votes) if votes.size <= 8
    count_likers(votes)
  end

private

  def list_likers(votes)
    names = []
    unless votes.blank?
      votes.voters.each do |v|
        names.push(link_to v.name,
        user_path(v.id),
        class: 'name')
      end
      names.to_sentence.html_safe + like_plural(votes)
    end
  end

  def count_likers(votes)
    vote_count = votes.size
    vote_count.to_s + ' are interested'
  end

  def like_plural(votes)
    return ' show interest' if votes.count > 1
    ' is interested in this'
  end
end
