class SpudVideo < ActiveRecord::Base
	validates :name, :presence => true
	validates :source,:presence => true
	validates :embed_link,:presence => true
end
