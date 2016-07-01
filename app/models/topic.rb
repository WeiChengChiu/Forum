class Topic < ActiveRecord::Base

  validates_presence_of :title, :content

  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :topic_categories
  has_many :categories, :through => :topic_categories

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def author_name
    user.try(:display_name) || "Nobody"
  end

  def view!
    self.increment!(:views_count)
  end


  def can_delete_by?(u)
    ( self.user == u ) || (u.is_admin?)
  end



end
