class User < ApplicationRecord
  attr_accessor :password
  attr_accessor :password_confirmation

  # Offices
  scope :adm_office, -> { where(office: 1) }
  scope :business_planning_and_finance, -> { where(office: 2) }
  scope :strategic_human_resources, -> { where(office: 3) }
  scope :service_management_and_facilities, -> { where(office: 4) }
  # Positions
  scope :director, -> { where(chart_level: 1) }
  scope :manager, -> { where(chart_level: 2) }
  scope :staff, -> { where(chart_level: 3) }
  # Teams
  scope :blue, -> { where(team: 1) }
  scope :red, -> { where(team: 2) }
  scope :green, -> { where(team: 3) }
  scope :purple, -> { where(team: 4) }
  scope :orange, -> { where(team: 5) }

  acts_as_voter
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  ratyrate_rater

  has_one :signup
  has_many :badges
  has_many :opportunities, through: :badges
  has_many :received_badges, class_name: :Recognition, foreign_key: :receiver_id
  has_many :given_badges, class_name: :Recognition, foreign_key: :recognizer_id

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :password, length: { in: 8..16 }, confirmation: true, format: { with: /\A((?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[!@#$%&])).*\Z/, message: "must include at least one lowercase letter, one uppercase letter, one digit and symbol (!@#$%&)" }, on: :create
  validates :password, length: { in: 8..16 }, confirmation: true, format: { with: /\A((?=.*[a-z])(?=.*[A-Z])(?=.*[\d])(?=.*[!@#$%&])).*\Z/, message: "must include at least one lowercase letter, one uppercase letter, one digit and symbol (!@#$%&)" }, on: :update, if: :password_changed?

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }, uniqueness: true
  validates :name, presence: true
  validates :job_description, length: { maximum: 500 }

  accepts_nested_attributes_for :badges
  accepts_nested_attributes_for :signup

  before_save :encrypt_password
  after_save :clear_password
  before_save :destroy_image?

  def self.search(search)
    joins(:badges)
    .where("badges.name ILIKE ? OR users.name ILIKE ?", "%#{search}%", "%#{search}%")
    .references(:badges)
  end

  def image_delete
    @image_delete ||= "0"
  end

  def image_delete=(value)
    @image_delete = value
  end

  private

  def encrypt_password
    if password.present?
      self.encrypted_password = Argon2::Password.create("#{self.password}")
    end
  end

  def clear_password
    self.password = nil
  end

  def password_changed?
    !password.blank?
  end

  def destroy_image?
    self.avatar.clear if @image_delete == "1"
  end
end
