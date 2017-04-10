module BadgesHelper
  def display_likes(badge)
    votes = badge.votes_for.up.by_type(User)
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
    vote_count.to_s + ' endorsements'
  end

  def like_plural(votes)
    return ' endorse badge' if votes.count > 1
    ' endorses this'
  end
end
