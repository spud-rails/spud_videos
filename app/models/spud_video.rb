class SpudVideo < ActiveRecord::Base
	validates :name, :presence => true
	validates :source,:presence => true
	validates :embed_link,:presence => true

  def self.find_by_identifier(identifier)
    if identifier.class == String
      video = SpudVideo.find_by_name(identifier)
    elsif identifier.class == Symbol
      video = SpudVideo.find_by_name(identifier.to_s.titleize)
    else
      video = SpudVideo.find(identifier)
    end
    return video
  end
end
